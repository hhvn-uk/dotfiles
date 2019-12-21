#!/bin/bash

cd $HOME/.config/grub/
sudo cp background.png /boot/
sudo cp grub /etc/default/grub
sudo grub-mkconfig -o grub.cfg
sudo cp grub.cfg /boot/grub/grub.cfg
