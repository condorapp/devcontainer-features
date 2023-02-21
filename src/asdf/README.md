
# ASDF install (asdf)

Install anything with ASDF from `.tool-versions`

## Example Usage

```json
"features": {
    "ghcr.io/condorapp/devcontainer-features/asdf:1": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| plugins | A comma-separated list of plugins to install. Must match versions in `.tool-versions`. | string | erlang,elixir |
| workspace | Full path the workspace directory containing the application's code. | string | - |



---

_Note: This file was auto-generated from the [devcontainer-feature.json](https://github.com/condorapp/devcontainer-features/blob/main/src/asdf/devcontainer-feature.json).  Add additional notes to a `NOTES.md`._
