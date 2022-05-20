{ ... }:
{
        programs.fish = {
        enable = true;
        interactiveShellInit = "
            set fish_color_autosuggestion yellow
            set fish_color_command red
            set fish_color_normal red

            starship init fish | source
            function fish_title
                #set -q argv[1]; or set argv fish
                set argx (fish_prompt_pwd_dir_length=1 prompt_pwd)
                set argy (string split \"/\" $argx)
                echo $argy[-1];

            end
        ";

        };

}
