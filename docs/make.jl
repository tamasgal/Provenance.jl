using Documenter, Provenance

makedocs(;
    modules = [Provenance],
    authors = "Tamas Gal",
    format = Documenter.HTML(
        prettyurls = get(ENV, "CI", nothing) == "true",
        # assets = ["assets/logo.ico"],
    ),
    pages=[
        "Introduction" => "index.md",
        "API" => "api.md",
    ],
    repo="https://github.com/tamasgal/Provenance.jl/blob/{commit}{path}#L{line}",
    sitename="Provenance.jl",
)

deploydocs(;
    repo="github.com/tamasgal/Provenance.jl",
)
