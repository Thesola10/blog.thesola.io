# Update references to theme repo
pull-theme:
    git -C theme pull
    nix flake update pelicanTheme --refresh

# Show this message
help:
    just -l
