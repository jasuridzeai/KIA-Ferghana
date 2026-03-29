# KIA Motors Dashboard — Telegram Mini App

Дашборд продаж для KIA Motors. Telegram Mini App с подключением к Supabase.

## Быстрый старт

### 1. Настройка Supabase

1. Зайдите на [supabase.com](https://supabase.com) и создайте бесплатный проект
2. Перейдите в **SQL Editor** и выполните содержимое файла `supabase-setup.sql`
3. Скопируйте **Project URL** и **anon key** из раздела **Settings → API**

### 2. Подключение к приложению

Откройте `index.html` и замените значения в начале `<script>`:

```javascript
const SUPABASE_URL = 'https://ваш-проект.supabase.co';
const SUPABASE_KEY = 'ваш-anon-ключ';
```

### 3. Деплой на GitHub Pages

```bash
# Инициализация репозитория
git init
git add .
git commit -m "KIA Dashboard v1.0"

# Создайте репозиторий на GitHub, затем:
git remote add origin https://github.com/ВАШ_ЮЗЕРНЕЙМ/kia-dashboard.git
git branch -M main
git push -u origin main
```

Затем в GitHub:
1. Перейдите в **Settings → Pages**
2. Source: **Deploy from a branch**
3. Branch: **main**, папка: **/ (root)**
4. Нажмите **Save**
5. Через 1-2 минуты сайт будет доступен по адресу: `https://ВАШ_ЮЗЕРНЕЙМ.github.io/kia-dashboard/`

### 4. Подключение к Telegram боту

1. Откройте [@BotFather](https://t.me/BotFather) в Telegram
2. Создайте бота: `/newbot` → введите имя и username
3. Настройте Mini App: `/newapp` → выберите бота
4. Введите URL вашего GitHub Pages сайта
5. Готово! Теперь Mini App доступно через кнопку в боте

### Структура базы данных

| Таблица    | Описание                        |
|------------|--------------------------------|
| `managers` | Менеджеры (id, name)           |
| `plans`    | Планы на месяц (CKD/DKD)      |
| `sales`    | Продажи (сумма, кол-во)       |

### Начальные менеджеры

- Дилноза Юсупова
- Алишер Каримов
- Бобур Назаров
- Зарина Рахимова
- Шахзод Турсунов
