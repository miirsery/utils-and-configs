# set PowerShell to UTF-8
[console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding

Import-Module posh-git
$omp_config = Join-Path $PSScriptRoot ".\takuya.omp.json"
$squash_config = Join-Path $PSScriptRoot ".\fix_sqash.ps1"
oh-my-posh --init --shell pwsh --config $omp_config | Invoke-Expression

Import-Module -Name Terminal-Icons

# PSReadLine
Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -BellStyle None
Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -Function DeleteChar
Set-PSReadLineOption -PredictionSource History

# Fzf
Import-Module PSFzf
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r'

# Env
$env:GIT_SSH = "C:\Windows\system32\OpenSSH\ssh.exe"

# Alias
Set-Alias -Name fixSqash -Value $squash_config
Set-Alias -Name vim -Value nvim
Set-Alias ll ls
Set-Alias g git
Set-Alias grep findstr
Set-Alias tig 'C:\Program Files\Git\usr\bin\tig.exe'
Set-Alias less 'C:\Program Files\Git\usr\bin\less.exe'


# Node (npm)
function nrd { npm run dev }
function nrt { npm run test }
function nid { npm install @args --save-dev }
function nl { npm run lint }
function nlf { npm run lint:fix }


# Node (yarn)
function yd { yarn dev }
function yt { yarn test }
function yid { yarn add @args --dev }
function ye { yarn eslint }
function yef { yarn eslint:fix }
function ys { yarn stylelint }
function ysf { yarn stylelint:fix }

# Git
function gil { git clone @args }
function gipl { git pull }
function gis { git status }
function gia { git add . }
function gic { git commit -m @args }
function gicnv { git commit -m @args --no-verify }
function giph { git push }
function gipo { git push --set-upstream origin @args }
function gich { git checkout @args }
function gichb { git checkout -b @args }

# Docker
function dcub { docker-compose up -d --build }
function dcsub { docker-compose @args up --build }
function dcd { docker-compose down }
function dcdv { docker-compose down -v }
function dcslf { docker-compose logs -f @args }
function dcs { docker-compose stop }

# Utilities
function which ($command) {
  Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}
