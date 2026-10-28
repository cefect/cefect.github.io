# Seth Bryant — academic website

- Quarto website for flood-risk research, Earth observation, and research software.
- Pages: Home, Publications, Projects, Software & Data.
- Ubuntu WSL development with Docker Compose and VS Code Dev Containers.
- Quarto pinned to 1.10.19 in development and publishing.

## Open the development environment

From an Ubuntu WSL terminal:

```bash
# Open the project through VS Code's WSL connection.
cd /home/cefect/LS/09_REPOS/01_COMMON/personal_webpage
code personal_webpage-WSL.code-workspace
```

- In VS Code, run **Dev Containers: Reopen in Container**.
- The container uses one CPU, up to 2 GB memory, and a non-root `vscode` user.
- Quarto and Git are installed inside the image; Windows installations are unnecessary.
- A Docker named volume holds the container user's cache.

Inside the container terminal:

```bash
# Start the live preview, available on the host at http://localhost:4200.
quarto preview --host 0.0.0.0 --port 4200 --no-browser
```

Alternatively, use **Terminal → Run Task → Website: preview**.

From WSL without opening VS Code:

```bash
# Build and start the development container.
docker compose -f .devcontainer/docker-compose.yml up -d --build

# Render once, or start the live preview.
docker compose -f .devcontainer/docker-compose.yml exec -T dev quarto render
docker compose -f .devcontainer/docker-compose.yml exec dev quarto preview --host 0.0.0.0 --port 4200 --no-browser
```

## Content map

| File | Purpose |
| --- | --- |
| `index.qmd` | Introduction, research themes, background, contact, and CV link |
| `publications.qmd` | Journal bibliography and a separately labelled preprint |
| `references/publications.bib` | Journal-article metadata; no local file paths or Zotero attachments |
| `references/academic.csl` | Publication formatting and newest-first ordering |
| `projects.qmd` | Selected research projects and related work |
| `software-data.qmd` | Software descriptions, repository links, and data guidance |
| `theme.scss` | CEF colors, typography, desktop/mobile layouts |
| `_quarto.yml` | Navigation, site URL, shared metadata, and rendering |
| `files/seth-bryant-cv.pdf` | Snapshot of the supplied compiled résumé |

## Finish GitHub publishing

- Local setup does not authorize an agent to commit or push.
- Review the four pages and CV before publishing.
- Initial repository name: `cefect/personal_webpage`.
- Initial site address: `https://cefect.github.io/personal_webpage/`.
- GitHub Pages is already configured to use **GitHub Actions** under **Settings → Pages**.
- The empty public GitHub repository and local `origin` remote are already created.
- No commit or push was performed; the website is not published yet.
- The Docker image builds and all four pages render successfully.
- Local page/resource/fragment checks pass, and the listed software repositories are public.
- Home and Projects were inspected at a mobile width, and the mobile menu was exercised.
- The copied résumé PDF was compiled on 2026-10-28.
- The preview service was stopped after verification; start it with the commands above.
- The workflow builds pull requests and publishes pushes to `main` or a manual run.
- Deployment uses GitHub's built-in workflow token; no personal access token is required in the repository.
- If SSH authentication requires login or a key setup step, complete it yourself before pushing.

From the WSL project folder, after reviewing the files:

```bash
# Review the initial files, then create the initial commit yourself.
git status --short
git add .
git commit -m "Create Quarto academic website and devcontainer"

# Publish the reviewed source; this triggers the Pages workflow.
git push -u origin main

# Check the first workflow run.
gh run list --workflow publish.yml --limit 3
```

## Content review before publication

- Confirm the current UW–Madison title and affiliation wording.
- Review the introductory and project summaries, which are editorial condensations of the résumé.
- Journal entries and the preprint retain the supplied bibliography's status and metadata.
- The published article author order is copied from the supplied bibliography, without independent correction.
- Confirm that the copied compiled résumé is the version you want visitors to download.
- Replace or add a professional photograph and research figures if desired; none were invented.
- Add public USFloods software/data links when a release is available.
- Confirm project/funder wording before sharing the site publicly.

## Provenance and design

- Content source: `2607_CV/main_resume.tex`, its included résumé sections, and `bib/publications.bib`.
- CV source: `2607_CV/build/main_resume/main_resume.pdf`.
- Brand source: `03_brand/templates/CEF - single-hue blue 6x.thmx`.
- Wave source: `03_brand/graphics/waves/cef - waves (2023 11 06).svg`.
- Palette: `#EFF3FF`, `#C6DBEF`, `#9ECAE1`, `#6BAED6`, `#3182BD`, `#08519C`.
- Typography: Calibri Light headings and Calibri body where installed; Carlito/Segoe UI/system fallbacks elsewhere.
- No commercial font files are bundled or downloaded.
- `.gitignore` starts from the shared `building_projects/master.gitignore`, with explicit exceptions for this project's devcontainer and workspace.
- Architecture decisions: `docs/adr/0001-static-quarto.md`.
