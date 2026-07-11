# AGENTS Guide

## Project Snapshot
- This repo is a Jekyll static site for Banda Comunale Rezzato, using remote theme `mmistakes/minimal-mistakes@4.24.0` (`_config.yml`, `Gemfile.lock`).
- Main content domains are implemented as Jekyll collections:
  - `_concerti` -> permalink `/banda/:collection/:path/`
  - `_insegnanti` -> permalink `/accademia-musicale/:collection/:path/`
- Navigation and many labels are data-driven from `_data/navigation.yml` and `_data/ui-text.yml`.

## How Content Flows
- Most visible pages are Markdown with front matter under `_pages`, `_posts`, `_concerti`, `_insegnanti`.
- Collection index pages use `layout: collection` plus metadata such as `collection`, `entries_layout`, `sort_by`, `sort_order` (example: `_pages/accademia-musicale/insegnanti.md`).
- Homepage logic (`index.html`) iterates `site.tags` and highlights items tagged `primo_piano`.
- To feature an item on home, use `tag: primo_piano` in front matter (examples: `_concerti/2025-06-11-concerto-estate-2025.md`, `_posts/2025-12-23-concerto-natale-2026.md`).

## Project-Specific Conventions
- Keep date-prefixed filenames for time-based content: `YYYY-MM-DD-slug.md` (widely used in `_concerti` and `_posts`).
- Teacher entries in `_insegnanti` often include `cognome_nome` for sorting and `header.teaser` for thumbnails.
- Pages commonly set explicit `permalink` and `sidebar.nav` keys that match `_data/navigation.yml` groups.
- Gallery content is often declared in front matter as `gallery:` lists and rendered with `{% include gallery %}` (see `_pages/banda/locandine.md`, `_posts/2015-09-25-bottega-alta-20-settembre-2015.md`).

## Styling and Layout Notes
- Custom home styles live in `assets/custom_style/home.scss`; `index.html` links to `home.css` (Jekyll processes SCSS with front matter).
- Custom layout ` _layouts/gallery_index.html` is used for gallery-style listing pages.
- Do not place build-relevant logic in `custom_helpers` expecting Jekyll to load it automatically: `_config.yml` excludes `custom_helpers`.

## Build and Local Workflow
- Documented local build path uses the custom Docker action context in `.github/actions/build-dist-site` (`README.md`):
  - build the image from `.github/actions/build-dist-site`
  - run it with repo mounted and `LOCAL_BUILD=1`
- The action entrypoint (`.github/actions/build-dist-site/entrypoint.sh`) installs deps, runs `bundle exec jekyll build`, and deploys to `gh-pages` only when `LOCAL_BUILD` is not set.
- Gitpod defaults to `bundle exec jekyll s` on port `4000` (`.gitpod.yml`).

## Dependencies and Integrations
- Key gems: `jekyll`, `jekyll-remote-theme`, `jekyll-include-cache`, `jekyll-gallery-generator`, `rmagick`, `exifr` (`Gemfile`).
- Gallery generator settings are centralized in `_config.yml` under `gallery:` and source images from `galleries/`.
- Helper script `custom_helpers/gallery_generator.rb` generates YAML snippets for gallery front matter; use it to keep gallery blocks consistent.

## Safe Change Strategy For Agents
- Prefer editing content/front matter over changing theme internals.
- When adding new sections, wire nav entries in `_data/navigation.yml` and match `sidebar.nav` in target pages.
- When changing list/sort behavior, verify relevant front matter keys exist in all affected collection documents (example: `cognome_nome` for teacher ordering).

