# hscli

CLI-утилита для управления **Headscale v0.28.0** через Docker.

## Возможности

- **Пользователи** — просмотр, создание, удаление, переименование
- **Теги (ACL)** — просмотр, установка, удаление тегов узлов
- **Узлы (Nodes)** — список, информация, удаление, перемещение, переименование
- **Маршруты (Routes)** — просмотр, включение/отключение, удаление
- **Ключи** — управление API keys и pre-auth keys
- **Namespaces** — создание, удаление, переименование

## Зависимости

- `bash` ≥ 4.0
- `docker`
- `jq`

## Установка

```bash
# Клонировать репозиторий
git clone https://github.com/direkt/headscale-cli.git
cd headscale-cli

# Установить в ~/.local/bin/
make install

# Или использовать напрямую
./hscli --help
```

## Использование

```bash
# Показать справку
hscli --help

# Пользователи
hscli users list
hscli users add myuser
hscli users delete myuser
hscli users rename oldname newname

# Узлы
hscli nodes list
hscli nodes get mynode
hscli nodes delete mynode
hscli nodes move mynode production
hscli nodes rename mynode new-name
hscli nodes expire mynode

# Теги
hscli tags list
hscli tags list mynode
hscli tags set mynode tag:web,tag:prod
hscli tags delete mynode

# Маршруты
hscli routes list
hscli routes get 5
hscli routes enable 5
hscli routes disable 5
hscli routes delete 5

# Ключи
hscli keys api-list
hscli keys api-create 180d
hscli keys api-delete <key_id>
hscli keys preauth-list
hscli keys preauth-list default
hscli keys preauth-create default false false 30m
hscli keys preauth-delete default <key_id>

# Namespaces
hscli namespaces list
hscli namespaces create production
hscli namespaces delete production
hscli namespaces rename old new
```

## Переменные окружения

| Переменная | Описание | По умолчанию |
|---|---|---|
| `HEADSCALE_CONTAINER` | Имя Docker-контейнера Headscale | `headscale` |
| `HEADSCALE_NAMESPACE` | Namespace по умолчанию (опционально) | — |

### Пример

```bash
# Использовать свой контейнер
HEADSCALE_CONTAINER=my-headscale hscli users list

# Экспорт
export HEADSCALE_CONTAINER=headscale-prod
hscli nodes list
```

## Как это работает

Утилита выполняет команды `headscale` внутри Docker-контейнера через `docker exec` и форматирует вывод с помощью `jq`. Никаких API-ключей не требуется — достаточно доступа к Docker.

## Лиценцензия

MIT
