use anyhow::Result;
use which::which;
use std::process::Command;
use crate::models::{Language, Toolchain, Component, ComponentKind};

pub trait Scanner {
    fn scan(&self) -> Result<Vec<Language>>;
}

pub struct PathScanner;

impl PathScanner {
    pub fn new() -> Self {
        Self
    }

    fn check_command(&self, cmd: &str) -> Option<String> {
        if let Ok(path) = which(cmd) {
            // Check version
            if let Ok(output) = Command::new(&path).arg("--version").output() {
                 if output.status.success() {
                     let version_str = String::from_utf8_lossy(&output.stdout).trim().to_string();
                     return Some(version_str);
                 }
            }
        }
        None
    }
}

impl Scanner for PathScanner {
    fn scan(&self) -> Result<Vec<Language>> {
        let mut languages = Vec::new();

        // Check for Rust
        if let Some(version) = self.check_command("rustc") {
             if let Ok(path) = which("rustc") {
                languages.push(Language {
                    name: "Rust".to_string(),
                    version: version.clone(),
                    toolchain: Toolchain {
                        path: path.clone(),
                        components: vec![
                            Component {
                                name: "rustc".to_string(),
                                version: version,
                                path: path,
                                kind: ComponentKind::Compiler,
                            }
                        ]
                    }
                });
             }
        }

        // Check for Go
        if let Some(version) = self.check_command("go") {
            if let Ok(path) = which("go") {
               languages.push(Language {
                   name: "Go".to_string(),
                   version: version.clone(),
                   toolchain: Toolchain {
                       path: path.clone(),
                       components: vec![
                           Component {
                               name: "go".to_string(),
                               version: version,
                               path: path,
                               kind: ComponentKind::Compiler,
                           }
                       ]
                   }
               });
            }
       }

        Ok(languages)
    }
}
