# Project settings
APP_NAME := wordsquares
SRC := main.cpp trie.cpp
BUILD_DIR := build
OBJ := $(patsubst %.cpp,$(BUILD_DIR)/%.o,$(SRC))
DEP := $(OBJ:.o=.d)

# Toolchain
CXX ?= clang++
CXXFLAGS ?= -std=c++17 -Wall -Wextra -Wpedantic -O2
CPPFLAGS += -MMD -MP
LDFLAGS :=
LDLIBS :=

# Default target
.PHONY: all
all: $(BUILD_DIR)/$(APP_NAME)

# Build modes
.PHONY: debug release
debug: CXXFLAGS := -std=c++17 -Wall -Wextra -Wpedantic -O0 -g3
debug: $(BUILD_DIR)/$(APP_NAME)

release: CXXFLAGS := -std=c++17 -Wall -Wextra -Wpedantic -O3
release: $(BUILD_DIR)/$(APP_NAME)

# Link
$(BUILD_DIR)/$(APP_NAME): $(OBJ)
	@mkdir -p $(BUILD_DIR)
	$(CXX) $(OBJ) -o $@ $(LDFLAGS) $(LDLIBS)

# Compile
$(BUILD_DIR)/%.o: %.cpp | $(BUILD_DIR)
	@mkdir -p $(BUILD_DIR)
	$(CXX) $(CPPFLAGS) $(CXXFLAGS) -c $< -o $@

$(BUILD_DIR):
	@mkdir -p $(BUILD_DIR)

# Run
.PHONY: run
run: $(BUILD_DIR)/$(APP_NAME)
	./$(BUILD_DIR)/$(APP_NAME)

# Clean
.PHONY: clean
clean:
	rm -rf $(BUILD_DIR)

# Include auto-generated dependencies
-include $(DEP)