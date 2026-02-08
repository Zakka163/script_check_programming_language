use serde::{Deserialize, Serialize};
use std::path::PathBuf;

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct Language {
    pub name: String,
    pub version: String,
    pub toolchain: Toolchain,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct Toolchain {
    pub path: PathBuf,
    pub components: Vec<Component>,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct Component {
    pub name: String,
    pub version: String,
    pub path: PathBuf,
    pub kind: ComponentKind,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub enum ComponentKind {
    Compiler,
    Interpreter,
    PackageManager,
    Linter,
    Formatter,
    Other,
}
