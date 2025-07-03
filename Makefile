# Компилятор и флаги
CC = gcc
CFLAGS = -Wall -Wextra -std=c99 -O2

# Директории
SRC_DIR = src
OBJ_DIR = obj
BUILD_DIR = build

# Имя исполняемого файла
TARGET = $(BUILD_DIR)/program

# Поиск всех .c файлов в src
SOURCES = $(wildcard $(SRC_DIR)/*.c)
# Создание списка .o файлов в obj директории
OBJECTS = $(SOURCES:$(SRC_DIR)/%.c=$(OBJ_DIR)/%.o)

# Основная цель - сборка программы
all: $(TARGET)

# Сборка исполняемого файла
$(TARGET): $(OBJECTS) | $(BUILD_DIR)
	$(CC) $(OBJECTS) -o $@ -lncurses
	@echo "Сборка завершена: $(TARGET)"

# Компиляция .c файлов в .o файлы
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c | $(OBJ_DIR)
	$(CC) $(CFLAGS) -c $< -o $@

# Создание директории для объектных файлов
$(OBJ_DIR):
	mkdir -p $(OBJ_DIR)

# Создание директории для билда
$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

# Очистка
clean:
	rm -rf $(OBJ_DIR) $(BUILD_DIR)
	@echo "Очистка завершена"

# Пересборка (очистка + сборка)
rebuild: clean all

# Запуск программы
run: $(TARGET)
	./$(TARGET)

# Помощь
help:
	@echo "Доступные команды:"
	@echo "  all     - собрать проект (по умолчанию)"
	@echo "  clean   - удалить obj и build директории"
	@echo "  rebuild - очистить и пересобрать"
	@echo "  run     - собрать и запустить программу"
	@echo "  help    - показать эту справку"

# Указываем, что это не файлы
.PHONY: all clean rebuild run help
