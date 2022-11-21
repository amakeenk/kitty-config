#!/bin/bash -e

BLUE='\033[0;34m'
NC='\033[0m'

kitty_config_dir="${HOME}/.config/kitty"
themes_repo="https://github.com/dexpota/kitty-themes"
enabled_kitty_theme="DotGov"

echo -e "${BLUE}remove kitty config dir if exist${NC}"
rm -rf ${kitty_config_dir}

echo -e "${BLUE}create kitty config dir${NC}"
mkdir -p ${kitty_config_dir}

echo -e "${BLUE}create symlink to kitty.conf${NC}"
ln -sv ${PWD}/kitty.conf ${kitty_config_dir}/kitty.conf

echo -e "${BLUE}clone kitty-themes repository${NC}"
git clone ${themes_repo} ${kitty_config_dir}/kitty-themes

echo -e "${BLUE}create symlink to theme ${enabled_kitty_theme}${NC}"
ln -sv ${kitty_config_dir}/kitty-themes/themes/${enabled_kitty_theme}.conf ${kitty_config_dir}/theme.conf

echo -e "${BLUE}set TERM=xterm-256color in bashrc${NC}"
echo "export TERM=xterm-256color" >>${HOME}/.bashrc

