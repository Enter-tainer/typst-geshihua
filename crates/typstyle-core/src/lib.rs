pub mod attr;
pub mod ext;
pub mod pretty;

pub use attr::AttrStore;
pub use pretty::Config;
pub use pretty::PrettyPrinter;

use typst_syntax::Source;

#[derive(Debug)]
pub enum Error {
    SyntaxError,
}

impl std::fmt::Display for Error {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        match self {
            Error::SyntaxError => write!(f, "The document has syntax errors"),
        }
    }
}

/// Entry point for pretty printing a typst document.
#[derive(Debug, Clone, Default)]
pub struct Typstyle {
    config: Config,
}

impl Typstyle {
    /// Create Typstyle formatter with config.
    pub fn new(config: Config) -> Self {
        Self { config }
    }

    /// Format typst content.
    pub fn format_content(self, content: impl Into<String>) -> Result<String, Error> {
        // We should ensure that the source tree is spanned.
        self.format_source(&Source::detached(content.into()))
    }

    /// Format typst source.
    pub fn format_source(self, source: &Source) -> Result<String, Error> {
        let root = source.root();
        if root.erroneous() {
            return Err(Error::SyntaxError);
        }
        let attr_store = AttrStore::new(root);
        let printer = PrettyPrinter::new(self.config.clone(), attr_store);
        let markup = root.cast().unwrap();
        let doc = printer.convert_markup(markup);
        let result = doc.pretty(self.config.max_width).to_string();
        let result = strip_trailing_whitespace(&result);
        Ok(result)
    }
}

/// Format typst content by Typstyle configured with given max_width.
///
/// It returns the original string if the source is erroneous.
pub fn format_with_width(content: &str, width: usize) -> String {
    let config = Config::new().with_width(width);
    Typstyle::new(config)
        .format_content(content)
        .unwrap_or_else(|_| content.to_string())
}

#[doc(hidden)]
/// Strip trailing whitespace in each line of the input string.
pub fn strip_trailing_whitespace(s: &str) -> String {
    let res = s
        .lines()
        .map(|line| line.trim_end())
        .collect::<Vec<_>>()
        .join("\n");
    res + "\n"
}

#[cfg(all(target_arch = "wasm32", feature = "wasm"))]
use wasm_bindgen::prelude::*;

#[cfg(all(target_arch = "wasm32", feature = "wasm"))]
#[wasm_bindgen]
pub fn pretty_print_wasm(content: &str, width: usize) -> String {
    format_with_width(content, width)
}
