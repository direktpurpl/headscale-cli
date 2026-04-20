.PHONY: help install test clean

SHELL := /bin/bash

help:
	@echo "hscli — CLI для управления Headscale"
	@echo ""
	@echo "Команды:"
	@echo "  make install    — Установить hscli в ~/.local/bin/"
	@echo "  make test         — Запустить базовые тесты (проверка синтаксиса)"
	@echo "  make clean      — Очистить временные файлы"
	@echo "  make lint       — Проверка bash-скрипта через shellcheck"

install:
	@mkdir -p ~/.local/bin
	@cp hscli ~/.local/bin/hscli
	@chmod +x ~/.local/bin/hscli
	@echo "hscli установлен в ~/.local/bin/hscli"
	@echo "Убедитесь, что ~/.local/bin есть в PATH"

test:
	@bash -n hscli
	@echo "Синтаксис OK"

test-integration:
	@chmod +x tests/*.sh
	@./tests/test_interaction.sh

lint:
	@command -v shellcheck &>/dev/null || { echo "Установите shellcheck"; exit 1; }
	@shellcheck hscli

clean:
	@rm -f *.log .env.backup
	@echo "Очищено"
