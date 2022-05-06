# mdt

Markdown toolkit (pandoc, XeLaTeX, mermaid and LaTeX beamer slide show)

## Usage

- Build docker image

  ```bash
  mdt docker
  ```

- Slidev

  ```bash
  mdt slidev examples/slidev.md
  ```

- Convert markdown to pdf

  ```bash
  mdt pdf examples/beamer.md
  ```

- Convert markdown to pdf (watch)

  ```bash
  mdt pdf --watch examples/beamer.md -d examples/defaults.yaml
  ```

## Reference

- https://pandoc.org/MANUAL.html
- https://github.com/alexeygumirov/pandoc-beamer-how-to
- https://github.com/puppeteer/puppeteer/blob/main/docs/troubleshooting.md#setting-up-chrome-linux-sandbox
- http://tug.ctan.org/macros/latex/contrib/beamer/doc/beameruserguide.pdf
