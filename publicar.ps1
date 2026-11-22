# Publica as páginas do IA Clipper (Terms/Privacy) no GitHub Pages, num repositório público separado.
# Uso:  E:\AI-CLIPPER\site\publicar.ps1
Set-Location E:\AI-CLIPPER\site
if (-not (Test-Path .git)) {
    git init -q -b main
    git add index.html terms.html privacy.html .nojekyll
    git commit -q -m "IA Clipper: páginas de Terms e Privacy"
    gh repo create ia-clipper --public --source . --push --description "IA Clipper - Terms of Service e Privacy Policy"
    gh api -X POST "repos/{owner}/ia-clipper/pages" -f "source[branch]=main" -f "source[path]=/" | Out-Null
} else {
    # Atualização (ex.: arquivo de verificação do TikTok copiado para esta pasta)
    git add -A
    git commit -q -m "Atualiza páginas"
    git push -q
}
Write-Host "Pronto. Em 1-2 minutos: https://gabriel-bastiani.github.io/ia-clipper/"
