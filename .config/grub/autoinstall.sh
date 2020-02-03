#!/bin/bash

cd $HOME/.config/grub/
sudo cp box/* /boot/grub
sudo cp theme.txt /boot/grub
sudo cp background.png /boot/grub
sudo cp grub /etc/default/grub
sudo grub-mkconfig -o grub.cfg
sudo cp grub.cfg /boot/grub/grub.cfg
