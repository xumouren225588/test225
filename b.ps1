# --- 配置区域 ---
$VhdPath = "D:\b.vhd"  # VHD 保存路径 (确保文件夹存在)
$VhdSize = 4GB                            # 虚拟磁盘最大容量
$DriveLetter = "Z"                        # 想要分配的主分区盘符
$Label = "DataVolume"                     # 卷标名称

# 确保目录存在
$dir = Split-Path $VhdPath
if (!(Test-Path $dir)) {
    New-Item -ItemType Directory -Force -Path $dir | Out-Null
}

Write-Host "1. 正在创建动态扩展 VHDX ($VhdSize)..." -ForegroundColor Cyan
# 创建动态扩展 VHDX (Dynamic 意味着随数据增长而变大)
New-VHD -Path $VhdPath -SizeBytes $VhdSize -Dynamic -Verbose

Write-Host "2. 正在挂载 VHDX..." -ForegroundColor Cyan
# 挂载 VHD
Mount-VHD -Path $VhdPath -PassThru | Out-Null

# 获取刚挂载的磁盘对象
# 注意：Get-VHD 返回的对象包含 DiskNumber 属性，这是最关键的一步
$vhdObject = Get-VHD -Path $VhdPath
$diskNumber = $vhdObject.DiskNumber

if ($null -eq $diskNumber) {
    Write-Error "无法获取磁盘编号，挂载可能失败。"
    Dismount-VHD -Path $VhdPath
    exit
}

Write-Host "3. 已识别磁盘编号: Disk $diskNumber" -ForegroundColor Green

# --- 构建 DiskPart 脚本内容 ---
# 我们动态生成脚本内容，确保选中的是正确的磁盘编号
$diskpartScriptContent = @"
select disk $diskNumber
clean
convert gpt
create partition efi size=100
format quick fs=fat32 label="System"
assign letter=S
create partition msr size=16
create partition primary
format quick fs=ntfs label="$Label"
assign letter=$DriveLetter
exit
"@

# 将脚本内容写入临时文件
$tempScriptPath = "$env:TEMP\diskpart_temp_$PID.txt"
Set-Content -Path $tempScriptPath -Value $diskpartScriptContent

Write-Host "4. 正在执行 DiskPart 进行分区和格式化..." -ForegroundColor Cyan
# 执行 DiskPart
diskpart /s $tempScriptPath


# 清理临时脚本文件
Remove-Item $tempScriptPath -Force

# 可选：如果不需要立即使用，可以在此处选择卸
Dismount-VHD -Path $VhdPath
