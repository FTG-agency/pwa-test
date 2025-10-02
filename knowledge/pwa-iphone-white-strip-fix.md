# Исправление белой полоски в PWA на iPhone (Dynamic Island)

## Проблема
После исправления горизонтального свайпа в PWA на iPhone появилась белая полоска в верхней части экрана (область вокруг Dynamic Island и status bar).

## Причина
1. Отсутствие `viewport-fit=cover` в meta viewport
2. Не использовались CSS переменные `env(safe-area-inset-*)`
3. Отсутствие PWA мета-тегов в page layout файлах
4. Фон не был применён к элементу `html`

## Решение

### 1. Viewport Meta Tag
Добавить `viewport-fit=cover` для покрытия всей области экрана:
```html
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, viewport-fit=cover">
```

### 2. CSS Safe Area для html
```css
html {
    background: linear-gradient(135deg, #2d3748 0%, #1a202c 100%);
    padding-top: env(safe-area-inset-top);
    padding-bottom: env(safe-area-inset-bottom);
}
```

### 3. PWA Meta Tags (обязательно!)
```html
<!-- PWA Meta Tags -->
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
<meta name="apple-mobile-web-app-title" content="Private Management">
<meta name="mobile-web-app-capable" content="yes">
<meta name="theme-color" content="#2d3748">
```

## Best Practices для PWA на iPhone

1. **Всегда используй `viewport-fit=cover`** в PWA режиме
2. **Применяй фон к `html`**, а не только к `body`
3. **Используй `env(safe-area-inset-*)` для padding** в html элементе
4. **Добавляй PWA мета-теги во ВСЕ layout файлы** (default и page)
5. **Используй `black-translucent` для status bar** — лучший вариант для тёмных тем
6. **Синхронизируй `theme-color` с фоном приложения**

## Чеклист
- [ ] `viewport-fit=cover` добавлен во все layout файлы
- [ ] `env(safe-area-inset-top/bottom)` применены к html
- [ ] Фон градиента добавлен к html элементу
- [ ] PWA мета-теги есть во всех layout файлах (default.html, default-en.html, page.html, page-en.html)
- [ ] `apple-mobile-web-app-status-bar-style` установлен в `black-translucent`
- [ ] Протестировано на реальном iPhone в PWA режиме

## Где применено
- `_layouts/default.html`
- `_layouts/default-en.html`
- `_layouts/page.html`
- `_layouts/page-en.html`


