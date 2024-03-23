# Utils and configs for web development

**Использование alias'ов**

### General:
- **fixSqash**: Запускает фикс сквошей. Пример `fixSqash GG-666 'GG-666 | Верстка страницы заказа (fix sqash)'`
- **vim**: Заменяет `vim` на `nvim`.
- **ll**: Заменяет `ll` на `ls`.
- **g**: Заменяет `g` на `git`.
- **grep**: Заменяет `grep` на `findstr`.
- **tig**: Указывает на исполняемый файл `tig`.
- **less**: Указывает на исполняемый файл `less`.

### Node (npm)

- **nrd**: Запускает `npm run dev`.
- **nrt**: Запускает `npm run test`.
- **nid**: Устанавливает пакеты как devDependencies с `npm install`.
- **nl**: Запускает `npm run lint`.
- **nlf**: Запускает `npm run lint:fix`.

### Node (yarn)

- **yd**: Запускает `yarn dev`.
- **yt**: Запускает `yarn test`.
- **yid**: Устанавливает пакеты как devDependencies с `yarn add`.
- **ye**: Запускает `yarn eslint`.
- **yef**: Запускает `yarn eslint:fix`.
- **ys**: Запускает `yarn stylelint`.
- **ysf**: Запускает `yarn stylelint:fix`.

### Git

- **g**: Заменяет `g` на `git`, позволяя использовать Git команды без необходимости вводить `git` перед каждой командой.
- **gil**: Клонирует репозиторий Git, используя `git clone`.
- **gipl**: Выполняет `git pull`, обновляя локальную копию репозитория.
- **gis**: Показывает статус репозитория, используя `git status`.
- **gia**: Добавляет все изменения в индекс для следующего коммита, используя `git add .`.
- **gic**: Создает новый коммит с указанным сообщением, используя `git commit -m 'description'`.
- **gicnv**: Создает новый коммит с указанным сообщением, пропуская проверку pre-commit, используя `git commit -m 'description' --no-verify`.
- **giph**: Пушит изменения в текущую ветку, используя `git push`.
- **gipo**: Пушит изменения в указанную ветку и устанавливает её как upstream, используя `git push --set-upstream origin branch_name`.
- **gich**: Переключается на указанную ветку, используя `git checkout branch_name`.
- **gichb**: Создает новую ветку и переключается на неё, используя `git checkout -b branch_name`.
