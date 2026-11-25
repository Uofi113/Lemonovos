# LemonovOS

> [!IMPORTANT]
> Проект LemonovOS заморожен. Активная разработка остановлена, сроков возобновления пока нет. Загрузка ISO-образов с сайта отключена.

Спасибо всем, кто пользовался LemonovOS, тестировал сборки и помогал проекту. Если у вас уже установлена система и вы хотите сохранить похожий опыт, присмотритесь к другим дистрибутивам на базе Arch Linux.

Репозиторий сайта [lemonovos.com](https://lemonovos.com) и пакетного репозитория LemonovOS (релиз **Tarn**).

## Что здесь

- `index.html`, `img/`, `favicon.png`, `CNAME`: сайт (GitHub Pages).
- `netinstall.yaml`: список групп пакетов.
- [Релиз v1](../../releases/tag/v1): пакеты LemonovOS, подписанная база `lemonovos.db` и открытый ключ подписи `lemonovos-signing.asc`.

## Архивная инструкция по подключению пакетного репозитория

Пакеты и база релиза Tarn были подписаны. Команды ниже сохранены для справки.

```
curl -fsSLo /tmp/lemonovos-signing.asc https://github.com/Uofi113/Lemonovos/releases/download/v1/lemonovos-signing.asc
sudo pacman-key --add /tmp/lemonovos-signing.asc
sudo pacman-key --lsign-key FBAC409032DD3808F97AC9C37DC764CA33B941F7
sudo pacman -Syu lemonov-mirror
```

Отпечаток ключа: `FBAC 4090 32DD 3808 F97A C9C3 7DC7 64CA 33B9 41F7`

## Ссылки

- Сайт: <https://lemonovos.com>
- Telegram: <https://t.me/lemonovos>
