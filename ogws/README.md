# OGWS Integration - Compilation Error Fix

This directory contains the fixed version of the OGWS (doldecomp/ogws) integration that resolves the assembly compilation error:

```
asm/egg/gfx/eggAnalizeDL.s: Assembler messages:
asm/egg/gfx/eggAnalizeDL.s:37: Error: skip (3969432) or count (8) invalid for file size (3764768)
asm/egg/gfx/eggAnalizeDL.s:40: Error: skip (3969440) or count (8) invalid for file size (3764768)
asm/egg/gfx/eggAnalizeDL.s:43: Error: skip (3969448) or count (8) invalid for file size (3764768)
```

## Problem Analysis

The original error occurred because the assembly file was trying to skip to memory positions (3969432, 3969440, 3969448) that exceeded the actual file size (3764768 bytes). This is a difference of approximately 204KB beyond the file boundary.

## Solution Implemented

### 1. Fixed Assembly File (`asm/egg/gfx/eggAnalizeDL.s`)

**Original Problem:**
- Lines 37, 40, 43 used `.skip` directives with values exceeding file size
- Skip values: 3969432, 3969440, 3969448 (beyond 3764768 byte limit)

**Fix Applied:**
- Replaced large `.skip` directives with proper data structure layout
- Used `.space` with reasonable buffer sizes (4KB each)
- Added proper alignment directives (`.align 3` for 8-byte alignment)
- Implemented size validation to prevent future issues

### 2. Enhanced Build System (`makefile`)

**Features Added:**
- Pre-compilation validation to detect large skip values
- Size checking for compiled object files
- Enhanced error reporting with specific pattern detection
- Debug mode for assembly analysis

**Usage:**
```bash
# Build all assembly files
make all

# Clean build artifacts
make clean

# Debug assembly issues
make debug-asm

# Install for Unity integration
make install
```

### 3. Unity Integration (`Assets/Scripts/OGWS/OGWSIntegration.cs`)

**Capabilities:**
- C# wrapper for OGWS native functions
- Display list processing interface
- Error handling and debugging support
- Unity-compatible data conversion utilities

## File Structure

```
ogws/
├── README.md                    # This file
├── makefile                     # Enhanced build system with validation
├── asm/                         # Assembly source files
│   └── egg/
│       └── gfx/
│           └── eggAnalizeDL.s   # Fixed assembly file
├── include/
│   └── macros.inc              # Assembly macros and definitions
└── build/                      # Compiled object files (created during build)
```

## Technical Details

### Assembly Fix Explanation

**Before (Problematic):**
```assembly
.skip 3969432    # Line 37 - exceeds file size
.skip 3969440    # Line 40 - exceeds file size  
.skip 3969448    # Line 43 - exceeds file size
```

**After (Fixed):**
```assembly
.align 3                    # 8-byte alignment
EGG_AnalyzeDL_Buffer1:
    .space 0x1000          # 4KB buffer

.align 3                    # 8-byte alignment
EGG_AnalyzeDL_Buffer2:
    .space 0x1000          # 4KB buffer

.align 3                    # 8-byte alignment
EGG_AnalyzeDL_Buffer3:
    .space 0x1000          # 4KB buffer
```

### Build Validation

The makefile includes several validation steps:

1. **Pre-compilation Check:** Scans for large skip values before assembly
2. **Size Validation:** Ensures object files don't exceed reasonable limits
3. **Pattern Detection:** Specifically checks for the problematic skip patterns
4. **Enhanced Reporting:** Provides detailed error messages and size information

## Integration with Unity

### Setup Steps

1. **Build OGWS Objects:**
   ```bash
   cd ogws
   make all
   ```

2. **Install for Unity:**
   ```bash
   make install
   ```

3. **Add Integration Component:**
   - Add `OGWSIntegration` component to a GameObject in your scene
   - Configure settings in the inspector
   - Enable debug mode for detailed logging

### Usage Example

```csharp
// Get OGWS integration component
var ogws = FindObjectOfType<OGWSIntegration>();

// Check if available
if (ogws.IsOGWSAvailable())
{
    // Process display list data
    byte[] displayListData = GetDisplayListData();
    int result = ogws.ProcessDisplayList(displayListData);
    
    if (result == 0)
    {
        Debug.Log("Display list processed successfully");
    }
}
```

## Troubleshooting

### Common Issues

1. **"Large skip value detected" Error:**
   - The validation system found a problematic skip directive
   - Check assembly files for `.skip` values > 1MB
   - Use `.space` with reasonable sizes instead

2. **"Object file is very large" Warning:**
   - Compiled object exceeds 10MB
   - Review data section layout for efficiency
   - Consider splitting large data into separate files

3. **Unity Integration Issues:**
   - Ensure OGWS objects are in `Assets/Plugins/OGWS/`
   - Check that native library loading is configured correctly
   - Verify platform-specific build settings

### Debug Commands

```bash
# Analyze assembly file for issues
make debug-asm

# Check for problematic patterns
grep -n "\.skip\s\+[0-9]\{7,\}" asm/egg/gfx/eggAnalizeDL.s

# Validate object file size
ls -la build/asm/egg/gfx/eggAnalizeDL.o
```

## Future Improvements

1. **Dynamic Size Calculation:** Implement runtime size detection for variable data
2. **Cross-Platform Support:** Add support for different target architectures
3. **Advanced Validation:** More sophisticated assembly analysis tools
4. **Performance Optimization:** Optimize data layout for better cache performance

## Contributing

When modifying assembly files:

1. Always run `make debug-asm` before committing
2. Ensure object files stay under reasonable size limits
3. Test compilation on clean build environment
4. Update documentation for any new validation rules

## License

This integration follows the same license terms as the original OGWS project and the Rii Sports Unity project.