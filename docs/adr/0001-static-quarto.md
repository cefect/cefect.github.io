# 0001: Static Quarto website on GitHub Pages

Status: accepted by the user on 2026-10-28.

## Context

- Personal academic website for a civil/environmental engineering postdoctoral researcher.
- Primary audiences: academic hiring committees and research collaborators.
- Low traffic and infrequent content changes.
- Four sections: Home, Publications, Projects, Software & Data.

## Decision

- Author in Quarto and keep the complete source in GitHub.
- Generate static HTML with Quarto 1.10.19.
- Publish through GitHub Actions and GitHub Pages.
- Develop in a non-root Docker Compose devcontainer with one CPU and 2 GB memory.
- Keep publication metadata in a sanitized BibTeX file; label preprints separately.
- Reuse the CEF blue palette and wave illustration.
- Use Calibri/Calibri Light when available, with local system-font fallbacks.
- Keep large datasets and research software outside the website repository.

## Consequences

- Hosting can use the free GitHub Pages allowance with a public source repository.
- The website works without a database, server application, or live API calls.
- Updating the site requires rendering and publishing new static files.
- Existing pages remain served independently of later build-tool changes.
- The initial project URL is `https://cefect.github.io/personal_webpage/`.
- A future repository rename or custom domain requires changing `website.site-url`.
