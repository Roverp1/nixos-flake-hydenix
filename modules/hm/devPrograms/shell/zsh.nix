{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.roverp.shell.zsh;
in {
  options = {
    roverp.shell.zsh = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = true;
        description = "Enable zsh module";
      };

      purePrompt.enable = lib.mkOption {
        type = lib.types.bool;
        default = cfg.enable && !config.roverp.shell.ohMyPosh.enable;
        description = "Enable pure prompt for zsh";
      };
    };
  };

  config = lib.mkIf cfg.enable {
    programs.zsh = {
      enable = true;

      plugins = with pkgs; [
        {
          name = zsh-syntax-highlighting.pname;
          src = zsh-syntax-highlighting.src;
        }

        (lib.mkIf cfg.purePrompt.enable {
          name = pure-prompt.pname;
          src = pure-prompt.src;
        })
      ];

      initContent = let
        purePromptConfig = ''
          autoload -U promptinit; promptinit
          prompt pure

          prompt_newline='%666v'
          PROMPT=" $PROMPT"
        '';

        zshConfig = lib.mkOrder 1000 (builtins.readFile ./../../../../Configs/.config/zsh/.zshrc);
        zshConfigEarly = lib.mkOrder 500 ''
          ${purePromptConfig}
        '';
      in
        lib.mkMerge [zshConfigEarly zshConfig];
    };
  };
}
