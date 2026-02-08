# LANGSCAN

A high-performance CLI tool to inventory languages, toolchains, and runtimes on your system.

## Features

- 🚀 **Fast**: Written in Rust for maximum performance.
- 🔍 **Accurate**: Detects installed languages (currently supports Rust and Go).
- 📊 **Flexible Output**: Supports both human-readable tables and machine-parsable JSON.

## Usage

### Building

```bash
cargo build --release
```

### Scanning

**Basic Scan (Table Output):**
```bash
cargo run -- scan
```

**JSON Output:**
```bash
cargo run -- scan --format json
```

## Troubleshooting

### "failed to join paths" Error (macOS)

If you see an error like:
```
error: failed to join paths from `$DYLD_FALLBACK_LIBRARY_PATH` together ... Caused by: path segment contains separator `:`
```

This is because the project directory contains a colon (`:`), which confuses the dynamic linker on macOS.

**Workaround 1 (Recommended):**
Set the `CARGO_TARGET_DIR` environment variable to a path without colons (e.g., `/tmp`):

```bash
CARGO_TARGET_DIR=/tmp/langscan_target cargo run -- scan
```

**Workaround 2:**
Rename the project directory to remove the colon (e.g., change `sakadev:langscan` to `sakadev-langscan`).
