# hscli

Компактный интерактивный CLI для управления **Headscale v0.28.0** в Docker.

## Быстрый старт

```bash
./hscli
```

## Принцип работы

Вводишь **цифру** — переходишь по пунктам меню:

```
  Headscale CLI v0.3.0  │  контейнер: headscale
  ────────────────────────────────────────

  1) Узлы
  2) Пользователи
  3) Маршруты
  4) Теги
  5) Ключи
  6) Namespaces
  0) Выход

  Выбор [0-6]:
```

## Зависимости

- `docker`
- `jq`
- `column` (из bsdmainutils или util-linux)
- `bash` ≥ 4.0

## ENV-переменные

| Переменная | По умолчанию | Описание |
|---|---|---|
| `HEADSCALE_CONTAINER` | `headscale` | Имя Docker-контейнера |
| `HEADSCALE_SSH` | _(пусто)_ | SSH-хост (например, `user@host`) для удаленного управления |
| `HEADSCALE_NAMESPACE` | _(пусто)_ | Namespace по умолчанию |

## Удаленное управление

Если Headscale запущен на другом сервере, укажите его SSH-хост:

```bash
export HEADSCALE_SSH="direkt@100.64.0.2"
./hscli
```

## Структура

```
headscale-cli/
├── hscli          # главный скрипт
├── README.md
├── .env.example
├── .gitignore
├── Makefile
└── docs/
```

## Команды Makefile

```bash
make install   # сделать hscli доступным из PATH
make test      # проверка синтаксиса
make lint      # shellcheck
make clean     # удаление артефактов
```
