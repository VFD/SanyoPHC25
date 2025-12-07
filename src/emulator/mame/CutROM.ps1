# =====================================================================
# PowerShell Script: Split a 24 KB PHC-25 ROM into 3 parts
# Each part is 8192 bytes (0x2000 in hexadecimal)
# Output: three files (022_04a.ic6, 022_05a.ic7, 022_06a.ic8)
# =====================================================================

# --- User parameters ---
# Name of the source file (the full 24 KB ROM dump)
$sourceFile = "RPUFOS-Basic-phc25rom-Beta4.bin"

# Check if the source file exists
if (-Not (Test-Path $sourceFile)) {
    Write-Host "Error: file $sourceFile not found."
    exit
}

# Read the file into memory as a byte array
$rom = Get-Content $sourceFile -Encoding Byte

# Verify the file size (should be exactly 24 KB = 24576 bytes)
if ($rom.Length -ne 24576) {
    Write-Host "Warning: file size is not 24 KB (24576 bytes)."
    Write-Host "Detected size: $($rom.Length) bytes."
}

# --- Splitting into three parts ---
# Each block is 8192 bytes (0x2000 in hexadecimal)

# Part 1: offset 0x0000 to 0x1FFF (8192 bytes)
[System.IO.File]::WriteAllBytes("022_04a.ic6", $rom[0..0x1FFF])

# Part 2: offset 0x2000 to 0x3FFF (8192 bytes)
[System.IO.File]::WriteAllBytes("022_05a.ic7", $rom[0x2000..0x3FFF])

# Part 3: offset 0x4000 to 0x5FFF (8192 bytes)
[System.IO.File]::WriteAllBytes("022_06a.ic8", $rom[0x4000..0x5FFF])

# --- Result ---
Write-Host "Splitting completed."
Write-Host "Generated files: 022_04a.ic6, 022_05a.ic7, 022_06a.ic8"
Write-Host "Each file size: 8192 bytes (0x2000)."
