#!/bin/bash

# Проверяем, что переданы аргументы
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <branch_name> <commit_message>"
    exit 1
fi

# Получаем аргументы
BRANCH_NAME=$1
COMMIT_MESSAGE=$2

# Переключаемся на основную ветку и обновляем её
echo "Switching to the main branch and pulling the latest changes..."
git checkout main
git pull

# Сливаем изменения из указанной ветки с помощью squash
echo "Merging changes from $BRANCH_NAME branch with squash..."
git merge --squash $BRANCH_NAME

# Удаляем локальную ветку
echo "Deleting the local $BRANCH_NAME branch..."
git branch -D $BRANCH_NAME

# Создаем новую ветку с тем же именем и переключаемся на неё
echo "Creating a new branch $BRANCH_NAME and checking it out..."
git branch $BRANCH_NAME
git checkout $BRANCH_NAME

# Добавляем все изменения и делаем коммит с указанным сообщением
echo "Adding all changes and committing with message: $COMMIT_MESSAGE"
git add .
git commit -m "$COMMIT_MESSAGE"

# Принудительно пушим изменения в ветку в удаленном репозитории
echo "Force pushing changes to the $BRANCH_NAME branch in the remote repository..."
git push --set-upstream origin $BRANCH_NAME --force

echo "Done! Your merge request should now be clean without conflicts and ready to merge."
