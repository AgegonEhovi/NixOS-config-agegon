git лучше не иницилизировать в /etc/nixos, иначе возникнут проблемы т.к. папка системная и принадлежит не обычному пользователю
1. Переместите конфиг
```bash
mkdir ~/nixos-config && sudo mv /etc/nixos/* ~/nixos-config
```

2. Создайте симлинк
```bash
sudo rmdir /etc/nixos && sudo ln -s ~/nixos-config /etc/nixos
```
3. Смените владельца (замените agegon на ваш)
```bash
sudo chown -R agegon:users ~/nixos-config
```

4. Теперь работайте с конфигом как обычный пользователь
```bash
cd ~/nixos-config
git init
git add .
git commit -m "Initial commit"
```

