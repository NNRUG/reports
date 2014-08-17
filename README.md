# Reports

## Installation

Использутеся мененджер задач gulp, для установки всех его зависимостей вызовите `npm install` находясь в папке проекта, также если gulp не установлен на компьютере `npm install -g gulp`.

Команда `gulp dist` соберет проект в папку `dist`.

Команда `gulp` или `gulp default` запустит сборку, а затем будет следить за изменениями в файлах и пересобирать их, а также запустит сервер который будет отдавать собранный проект на 8080 порту.

Команды `gulp scripts/templates/html` собирают отдельные компоненты.

Настроены нотификации, с помощью `gulp notify`, должны работать на всех системах как указано в их описании, но тестировал я их только на Arch Linux с Gnome Shell.

### Prerequisits

You should have [node.js](http://nodejs.org/) and [npm](https://www.npmjs.org/) installed.

### Installation

```bash
$ git clone git@github.com:NNRUG/reports.git
$ cd reports
$ npm install -g gulp
$ npm install
$ gulp dist
```

### Start

```bash
$ gulp
$ open localhost:8080
```

