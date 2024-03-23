# Проверяем, что переданы аргументы
if ($args.Count -ne 2) {
    Write-Host "Usage: .\script.ps1 <branch_name> <commit_message>"
    exit 1
}

# Получаем аргументы
$BRANCH_NAME = $args[0]
$COMMIT_MESSAGE = $args[1]

# Переключаемся на основную ветку и обновляем её
Write-Host "Switching to the main branch and pulling the latest changes..."
git checkout main
git pull

# Сливаем изменения из указанной ветки с помощью squash
Write-Host "Merging changes from $BRANCH_NAME branch with squash..."
git merge --squash $BRANCH_NAME

# Удаляем локальную ветку
Write-Host "Deleting the local $BRANCH_NAME branch..."
git branch -D $BRANCH_NAME

# Создаем новую ветку с тем же именем и переключаемся на неё
Write-Host "Creating a new branch $BRANCH_NAME and checking it out..."
git branch $BRANCH_NAME
git checkout $BRANCH_NAME

# Добавляем все изменения и делаем коммит с указанным сообщением
Write-Host "Adding all changes and committing with message: $COMMIT_MESSAGE"
git add .
git commit -m "$COMMIT_MESSAGE"

# Принудительно пушим изменения в ветку в удаленном репозитории
Write-Host "Force pushing changes to the $BRANCH_NAME branch in the remote repository..."
git push --set-upstream origin $BRANCH_NAME --force

Write-Host "Done! Your merge request should now be clean without conflicts and ready to merge."
