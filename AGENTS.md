# Project instructions

- Four navigation items only: Home, Publications, Projects, Software & Data.
- No blog, news, update feed, analytics, or contact form.
- Read `docs/adr/0001-static-quarto.md` before changing the architecture.
- Keep source facts grounded in the supplied CV; do not infer results or release dates.
- Run Quarto in the devcontainer; do not install tools on Windows.
- Keep Quarto versions synchronized in `Dockerfile`, Compose, and the publishing workflow.
- Never commit or push unless the user explicitly authorizes it in that message.
- Keep Markdown prose to one sentence per line.

## Environment notes

- This project lives in Ubuntu WSL at `/home/cefect/LS/09_REPOS/01_COMMON/personal_webpage`.
- From managed Windows execution, WSL access may require an approved `wsl.exe` call.
- For scripts containing Bash variables, save an LF-only script and run `wsl.exe -d Ubuntu --exec bash /mnt/c/.../script.sh`.
- Avoid nested `bash -lc` strings through PowerShell: an extra shell can expand variables prematurely.
- The Windows `C:\GD` junction points to Google Drive and is not available through `/mnt/c/GD` in this WSL session.
- Read requested brand sources through native PowerShell and copy only selected assets into the project.
- The shared master gitignore ignores devcontainers and workspace files; this project's exceptions deliberately track both.
