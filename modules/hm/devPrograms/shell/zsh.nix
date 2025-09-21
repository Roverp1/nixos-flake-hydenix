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

      fzfIntegration.enable = lib.mkOption {
        type = lib.types.bool;
        default = config.roverp.programs.fzf.enable;
        description = "Enable fzf integration for zsh";
      };
    };
  };

  config = lib.mkIf cfg.enable {
    programs.zsh = {
      enable = true;
      dotDir = "${config.xdg.configHome}/zsh";

      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;

      history = {
        size = 1000000;
        save = 1000000;
        path = "${config.xdg.dataHome}/zsh/history";

        extended = true;
        share = true;
        ignoreDups = true;
        ignoreSpace = true;
        expireDuplicatesFirst = true;
      };

      plugins = with pkgs; [
        {
          name = zsh-syntax-highlighting.pname;
          src = zsh-syntax-highlighting.src;
        }

        (lib.mkIf cfg.purePrompt.enable {
          name = pure-prompt.pname;
          src = pure-prompt.src;
          file = "pure.zsh";
        })

        (lib.mkIf cfg.fzfIntegration.enable {
          name = zsh-fzf-tab.pname;
          src = zsh-fzf-tab.src;
          file = "fzf-tab.plugin.zsh";
        })
      ];

      initContent = let
        purePromptConfig = lib.mkIf cfg.purePrompt.enable (lib.mkOrder 600 ''
          autoload -U promptinit; promptinit
          prompt pure

          prompt_newline='%666v'
          PROMPT=" $PROMPT"
          print() {
            [ 0 -eq $# -a "prompt_pure_precmd" = "''${funcstack[-1]}" ] || builtin print "$@";
          }
        '');

        completionConfig = lib.mkOrder 700 ''
          # Completion styling
          zstyle ':completion:*' menu select
          zstyle ':completion:*' list-colors "''${(s.:.)LS_COLORS}"
          zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'

          ${lib.optionalString (!cfg.fzfIntegration.enable) ''
            bindkey "^I" menu-complete
            bindkey "^[[Z" reverse-menu-complete
          ''}
        '';

        fzfTabConfig = lib.mkIf cfg.fzfIntegration.enable (lib.mkOrder 750 ''
          zstyle ':completion:*' menu no
          zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
          zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'
        '');

        zshConfig = lib.mkOrder 1000 (builtins.readFile ./../../../../Configs/.config/zsh/.zshrc);
      in
        lib.mkMerge [purePromptConfig completionConfig fzfTabConfig zshConfig];
    };

    home.file = {
      ".zshenv".source = ./../../../../Configs/.zshenv;
    };
  };
}
