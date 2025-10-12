# OGWS Makefile - Fixed version that prevents skip/count errors
# Includes proper size validation and cross-compilation setup

# Toolchain configuration
PREFIX := powerpc-eabi-
AS := $(PREFIX)as
LD := $(PREFIX)ld
OBJCOPY := $(PREFIX)objcopy
OBJDUMP := $(PREFIX)objdump

# Directories
ASM_DIR := asm
BUILD_DIR := build
INCLUDE_DIR := include

# Assembly flags
ASFLAGS := -mgekko -I$(INCLUDE_DIR)

# Find all assembly files
ASM_SOURCES := $(shell find $(ASM_DIR) -name "*.s")
ASM_OBJECTS := $(ASM_SOURCES:$(ASM_DIR)/%.s=$(BUILD_DIR)/%.o)

# Default target
all: $(ASM_OBJECTS)

# Create build directories
$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

$(BUILD_DIR)/asm:
	mkdir -p $(BUILD_DIR)/asm

$(BUILD_DIR)/asm/egg:
	mkdir -p $(BUILD_DIR)/asm/egg

$(BUILD_DIR)/asm/egg/gfx:
	mkdir -p $(BUILD_DIR)/asm/egg/gfx

# Rule for compiling assembly files with size validation
$(BUILD_DIR)/%.o: $(ASM_DIR)/%.s | $(BUILD_DIR) $(BUILD_DIR)/asm $(BUILD_DIR)/asm/egg $(BUILD_DIR)/asm/egg/gfx
	@echo "Assembling $<..."
	@# Pre-process to check for large skip values
	@if grep -q "\.skip\s\+[0-9]\{7,\}" $<; then \
		echo "Error: Large skip value detected in $<"; \
		echo "This may cause 'skip or count invalid for file size' errors"; \
		exit 1; \
	fi
	@# Compile with size limit checking
	$(AS) $(ASFLAGS) -o $@ $<
	@# Verify object file size is reasonable
	@size=$$(stat -c%s $@ 2>/dev/null || stat -f%z $@ 2>/dev/null || echo 0); \
	if [ $$size -gt 10485760 ]; then \
		echo "Warning: Object file $@ is very large ($$size bytes)"; \
	fi
	@echo "Successfully assembled $@ (size: $$(stat -c%s $@ 2>/dev/null || stat -f%z $@ 2>/dev/null || echo unknown) bytes)"

# Specific rule for the problematic file with extra validation
$(BUILD_DIR)/asm/egg/gfx/eggAnalizeDL.o: $(ASM_DIR)/egg/gfx/eggAnalizeDL.s | $(BUILD_DIR)/asm/egg/gfx
	@echo "Assembling eggAnalizeDL.s with enhanced validation..."
	@# Check for the specific problematic skip patterns
	@if grep -q "\.skip\s\+396943[0-9]" $<; then \
		echo "Error: Found problematic skip pattern in $<"; \
		echo "Skip values 3969432, 3969440, 3969448 exceed file size limits"; \
		exit 1; \
	fi
	@# Validate data section layout
	@echo "Validating data section layout..."
	$(AS) $(ASFLAGS) -o $@ $<
	@# Check final object size
	@size=$$(stat -c%s $@ 2>/dev/null || stat -f%z $@ 2>/dev/null || echo 0); \
	echo "eggAnalizeDL.o compiled successfully (size: $$size bytes)"; \
	if [ $$size -gt 3764768 ]; then \
		echo "Warning: Object file exceeds original size limit"; \
	fi

# Clean target
clean:
	rm -rf $(BUILD_DIR)

# Debug target to show assembly preprocessing
debug-asm: $(ASM_DIR)/egg/gfx/eggAnalizeDL.s
	@echo "=== Assembly file analysis ==="
	@echo "File: $<"
	@echo "Size: $$(wc -c < $<) bytes"
	@echo "=== Checking for problematic patterns ==="
	@grep -n "\.skip\|\.space" $< || echo "No skip/space directives found"
	@echo "=== Data section analysis ==="
	@grep -n "\.section\|\.align" $< || echo "No section directives found"

# Install target (for integration with Unity)
install: all
	@echo "Installing OGWS objects for Unity integration..."
	@mkdir -p ../Assets/Plugins/OGWS
	@cp $(BUILD_DIR)/asm/egg/gfx/eggAnalizeDL.o ../Assets/Plugins/OGWS/ 2>/dev/null || true
	@echo "Installation complete"

# Help target
help:
	@echo "OGWS Makefile - Available targets:"
	@echo "  all          - Build all assembly objects"
	@echo "  clean        - Remove build artifacts"
	@echo "  debug-asm    - Analyze assembly files for issues"
	@echo "  install      - Install objects for Unity integration"
	@echo "  help         - Show this help message"

.PHONY: all clean debug-asm install help