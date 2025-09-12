# Agent Guidelines for Hydenix NixOS Configuration

## Build Commands
- Build system: `sudo nixos-rebuild switch --flake .`
- Test configuration: `sudo nixos-rebuild test --flake .`
- Build without switching: `nixos-rebuild build --flake .`
- Check flake: `nix flake check`
- Update flake inputs: `nix flake update`

## Code Style Guidelines
- Use 2-space indentation consistently across all Nix files
- Follow functional attribute set patterns: `{ inputs, ... }: { ... }`
- Import structure: place `inputs` first, then other parameters
- Comments: Use `#` for single-line, place above code blocks for explanations
- String interpolation: Prefer `"${variable}"` over concatenation
- Package references: Use `pkgs.package` (hydenix) vs `pkgs.userPkgs.package` (user nixpkgs)

## Module Structure
- System modules: `modules/system/default.nix` - NixOS configuration
- Home manager modules: `modules/hm/default.nix` - user environment config
- Import custom modules using relative paths in `imports = [ ./module.nix ];`
- Use `hydenix = { enable = true; ... }` for main configuration
- Use `hydenix.hm = { enable = true; ... }` for home-manager options

## Error Handling
- Always test with `nixos-rebuild test` before `switch`
- Check hardware compatibility in `configuration.nix` hardware imports
- Validate usernames match between `users.users` and `home-manager.users`