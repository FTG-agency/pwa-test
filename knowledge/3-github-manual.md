---
layout: page
title: GitHub - Руководство пользователя
description: Полное руководство по работе с GitHub - от основ до продвинутых возможностей
version: 1.0
created: 2025-09-23
updated: 2025-09-23
---

# GitHub: Полное руководство

## Иерархия GitHub

### Основные уровни организации

| Уровень | Описание | Содержимое |
|---------|----------|------------|
| **Аккаунт** | Личный или организационный профиль | Платежная информация, общие настройки |
| **[Организация](https://docs.github.com/ru/organizations)** | Контейнер для команды или компании | Репозитории, команды, приложения, секреты, проекты |
| **[Команда (Team)](https://docs.github.com/ru/organizations/organizing-members-into-teams)** | Группа пользователей с едиными правами доступа | Права доступа к репозиториям, code owners |
| **[Репозиторий](https://docs.github.com/ru/repositories)** | Хранилище кода и связанных артефактов | Ветки, [Issues](https://docs.github.com/ru/issues), [Pull Requests](https://docs.github.com/ru/pull-requests), [Actions](https://docs.github.com/ru/actions), [Wiki](https://docs.github.com/ru/communities/documenting-your-project-with-wikis), [Pages](https://docs.github.com/ru/pages) |
| **[Ветка (Branch)](https://docs.github.com/ru/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/about-branches)** | Линия разработки | [Коммиты](https://docs.github.com/ru/pull-requests/committing-changes-to-your-project) |
| **[Коммит](https://docs.github.com/ru/pull-requests/committing-changes-to-your-project)/[Тег](https://docs.github.com/ru/repositories/releasing-projects-on-github/managing-releases-in-a-repository)/[Релиз](https://docs.github.com/ru/repositories/releasing-projects-on-github)** | Снимок состояния, версия, оформленный выпуск | Бинарные файлы, примечания к релизу |

## Компоненты репозитория

### Основные сущности

| Компонент | Назначение | Связи с другими компонентами |
|-----------|------------|------------------------------|
| **[Issue](https://docs.github.com/ru/issues)** | Задача, ошибка или предложение улучшения | Связывается с метками, milestone, проектами; может закрываться через PR |
| **[Pull Request](https://docs.github.com/ru/pull-requests)** | Предложение внесения изменений | Специальный тип Issue, может закрывать до 10 Issues |
| **[Discussion](https://docs.github.com/ru/discussions)** | Обсуждение общих вопросов | Может быть преобразовано в Issue |
| **Comment** | Комментарий к Issue/PR/Discussion | Принадлежит родительской сущности |
| **[Label](https://docs.github.com/ru/issues/using-labels-and-milestones-to-track-work)** | Цветная метка для категоризации | Прикрепляется к Issues и PR |
| **[Milestone](https://docs.github.com/ru/issues/using-labels-and-milestones-to-track-work/about-milestones)** | Веха проекта с временными рамками | Группирует связанные Issues и PR |
| **[Project](https://docs.github.com/ru/issues/planning-and-tracking-with-projects)** | Канбан-доска или roadmap | Агрегирует Issues и PR из различных репозиториев |
| **[Actions](https://docs.github.com/ru/actions)** | CI/CD пайплайны | Автоматизация на основе событий (push, pull_request и др.) |

### Взаимосвязи компонентов

#### Основные связи
- **Код ↔ Задачи**: [PR](https://docs.github.com/ru/pull-requests) автоматически закрывает [Issues](https://docs.github.com/ru/issues) через ключевые слова (`fixes`, `closes`, `resolves`)
- **[Discussion](https://docs.github.com/ru/discussions) ↔ [Issue](https://docs.github.com/ru/issues)**: [Discussion](https://docs.github.com/ru/discussions) преобразуется в [Issue](https://docs.github.com/ru/issues) для трекинга конкретных задач
- **[Actions](https://docs.github.com/ru/actions) ↔ События**: Пайплайны запускаются на push, [PR](https://docs.github.com/ru/pull-requests), [release](https://docs.github.com/ru/repositories/releasing-projects-on-github), schedule, manual trigger
- **[Labels](https://docs.github.com/ru/issues/using-labels-and-milestones-to-track-work) ↔ Automation**: Метки запускают автоматические действия через [Actions](https://docs.github.com/ru/actions)
- **[Milestones](https://docs.github.com/ru/issues/using-labels-and-milestones-to-track-work/about-milestones) ↔ [Releases](https://docs.github.com/ru/repositories/releasing-projects-on-github)**: Вехи часто соответствуют планируемым релизам
- **[Projects](https://docs.github.com/ru/issues/planning-and-tracking-with-projects) ↔ [Репозитории](https://docs.github.com/ru/repositories)**: Проекты агрегируют [Issues](https://docs.github.com/ru/issues)/[PR](https://docs.github.com/ru/pull-requests) из множества [репозиториев](https://docs.github.com/ru/repositories)
- **[Teams](https://docs.github.com/ru/organizations/organizing-members-into-teams) ↔ Permissions**: Команды определяют права доступа к [репозиториям](https://docs.github.com/ru/repositories) и их компонентам

#### Сложные взаимодействия
- **[Branch Protection](https://docs.github.com/ru/repositories/configuring-branches-and-merges-in-your-repository/managing-protected-branches) ↔ PR**: Защищенные ветки требуют обязательного PR и прохождения проверок
- **[Code Owners](https://docs.github.com/ru/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/about-code-owners) ↔ Reviews**: Автоматическое назначение ревьюеров на основе измененных файлов
- **[Status Checks](https://docs.github.com/ru/pull-requests/collaborating-with-pull-requests/collaborating-on-repositories-with-code-quality-features/about-status-checks) ↔ Merge**: Слияние блокируется до успешного прохождения всех проверок
- **[Environments](https://docs.github.com/ru/actions/deployment/targeting-different-environments) ↔ Deployments**: Окружения контролируют развертывание через approvals и секреты
- **[Dependabot](https://docs.github.com/ru/code-security/dependabot) ↔ Security**: Автоматическое создание PR для обновления уязвимых зависимостей

## Управление вложенными репозиториями

| Метод | Принцип работы | Применение |
|-------|----------------|------------|
| **[Git Submodule](https://docs.github.com/ru/get-started/using-git/about-git-subtree-merges)** | Хранит ссылку на конкретный коммит внешнего репозитория | Точная версия независимой зависимости |
| **[Git Subtree](https://docs.github.com/ru/get-started/using-git/about-git-subtree-merges)** | Копирует код как подпапку с сохранением истории | Создание монорепозитория с редкими синхронизациями |
| **Вложенная папка** | ❌ Не рекомендуется | Конфликты между Git-репозиториями |

## Типы контента в репозитории

### Хранение различных типов файлов

| Тип контента | Способ хранения | Ограничения |
|--------------|-----------------|-------------|
| **Исходный код** | Стандартные текстовые файлы | 100 MB на файл, 1 GB на репозиторий (бесплатный план) |
| **Документация** | Markdown файлы, [Wiki](https://docs.github.com/ru/communities/documenting-your-project-with-wikis), [GitHub Pages](https://docs.github.com/ru/pages) | GitHub Pages ≤ 1 GB |
| **Конфигурационные файлы** | YAML, JSON, конфиги в репозитории | Общие лимиты репозитория |
| **Небольшие бинарные файлы** | Прямое хранение в репозитории | До 100 MB на файл |
| **Крупные бинарные файлы** | [Git LFS](https://docs.github.com/ru/repositories/working-with-files/managing-large-files) (Large File Storage) | 1 GB хранилища + 1 GB трафика/месяц бесплатно |
| **Docker образы и пакеты** | [GitHub Packages](https://docs.github.com/ru/packages)/[Container Registry](https://docs.github.com/ru/packages/working-with-a-github-packages-registry/working-with-the-container-registry) | Тарификация по использованию хранилища и трафика |
| **Артефакты сборки** | [GitHub Actions Artifacts](https://docs.github.com/ru/actions/using-workflows/storing-workflow-data-as-artifacts) | 500 MB на артефакт, хранение 90 дней |

### Git LFS подробно

**Что это такое:**
[Git LFS](https://docs.github.com/ru/repositories/working-with-files/managing-large-files) (Large File Storage) — это система для эффективного хранения больших файлов в [Git](https://git-scm.com/)-репозиториях. Обычный [Git](https://git-scm.com/) плохо работает с большими бинарными файлами (видео, изображения, архивы, модели), так как сохраняет полную копию каждого файла при каждом изменении. [Git LFS](https://docs.github.com/ru/repositories/working-with-files/managing-large-files) решает эту проблему, заменяя большие файлы на маленькие указатели в [Git](https://git-scm.com/), а сами файлы хранит отдельно.

**Принцип работы:**
- Инициализация: `git lfs install`
- Отслеживание типов файлов: `git lfs track "*.psd"`
- В [Git](https://git-scm.com/) хранятся указатели, файлы — в отдельном хранилище

**Преимущества:**
- Быстрое клонирование [репозитория](https://docs.github.com/ru/repositories)
- Компактная история [Git](https://git-scm.com/)
- Эффективная работа с большими файлами

**Ограничения:**
- Бесплатная квота: 1 GB хранилища + 1 GB трафика в месяц
- Дополнительное использование тарифицируется

## DevOps возможности

| Функциональность | Реализация в GitHub |
|------------------|---------------------|
| **Непрерывная интеграция/развертывание** | [GitHub Actions](https://docs.github.com/ru/actions) |
| **Управление секретами** | [Environments](https://docs.github.com/ru/actions/deployment/targeting-different-environments) & [Repository Secrets](https://docs.github.com/ru/actions/security-guides/using-secrets-in-github-actions) |
| **Реестр контейнеров** | [`ghcr.io/<owner>/<image>`](https://docs.github.com/ru/packages/working-with-a-github-packages-registry/working-with-the-container-registry) |
| **Облачная среда разработки** | [GitHub Codespaces](https://docs.github.com/ru/codespaces) |
| **Безопасность** | [Dependabot](https://docs.github.com/ru/code-security/dependabot), [Security Advisories](https://docs.github.com/ru/code-security/security-advisories), [Code Scanning](https://docs.github.com/ru/code-security/code-scanning) |

## Дополнительные возможности

### Расширенные функции

- **[Wiki](https://docs.github.com/ru/communities/documenting-your-project-with-wikis)**: Встроенная документация для репозитория
- **[GitHub Pages](https://docs.github.com/ru/pages)**: Статический хостинг для документации и сайтов
- **[Gist](https://docs.github.com/ru/get-started/writing-on-github/editing-and-sharing-content-with-gists)**: Небольшие фрагменты кода и заметки
- **[GitHub Apps](https://docs.github.com/ru/apps)**: Интеграции и автоматизация
- **[GitHub Sponsors](https://docs.github.com/ru/sponsors)**: Система поддержки разработчиков
- **[Codespaces](https://docs.github.com/ru/codespaces)**: Полноценная облачная IDE

## Архитектура взаимодействия

```
[Организация](https://docs.github.com/ru/organizations)
├── [Репозиторий](https://docs.github.com/ru/repositories) A
│   ├── [Ветки](https://docs.github.com/ru/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/about-branches) → [Коммиты](https://docs.github.com/ru/pull-requests/committing-changes-to-your-project) → [Релизы](https://docs.github.com/ru/repositories/releasing-projects-on-github)
│   ├── [Issues](https://docs.github.com/ru/issues) ↔ [Pull Requests](https://docs.github.com/ru/pull-requests) ← [Discussions](https://docs.github.com/ru/discussions)
│   │   └── [Labels](https://docs.github.com/ru/issues/using-labels-and-milestones-to-track-work), [Milestones](https://docs.github.com/ru/issues/using-labels-and-milestones-to-track-work/about-milestones), [Projects](https://docs.github.com/ru/issues/planning-and-tracking-with-projects)
│   └── [Actions](https://docs.github.com/ru/actions), [Artifacts](https://docs.github.com/ru/actions/using-workflows/storing-workflow-data-as-artifacts), [Packages](https://docs.github.com/ru/packages), [Wiki](https://docs.github.com/ru/communities/documenting-your-project-with-wikis), [Pages](https://docs.github.com/ru/pages)
├── [Репозиторий](https://docs.github.com/ru/repositories) B
│   └── [Аналогичная структура]
└── Общие [проекты](https://docs.github.com/ru/issues/planning-and-tracking-with-projects) (агрегируют задачи из всех [репозиториев](https://docs.github.com/ru/repositories))
```

### Межрепозиторное взаимодействие

- **[Projects](https://docs.github.com/ru/issues/planning-and-tracking-with-projects)**: Объединяют задачи из множества [репозиториев](https://docs.github.com/ru/repositories)
- **[GitHub Actions](https://docs.github.com/ru/actions)**: Могут взаимодействовать с [API](https://docs.github.com/ru/rest) любых доступных [репозиториев](https://docs.github.com/ru/repositories)
- **[Submodules](https://docs.github.com/ru/get-started/using-git/about-git-subtree-merges)**: Фиксируются на определенном коммите до ручного обновления

## Workflow методологии

### Основные паттерны работы с ветками

| Методология | Принцип | Применение |
|-------------|---------|------------|
| **[GitHub Flow](https://docs.github.com/ru/get-started/quickstart/github-flow)** | Одна основная ветка + feature branches | Простые проекты, непрерывное развертывание |
| **[Git Flow](https://nvie.com/posts/a-successful-git-branching-model/)** | Master, develop, feature, release, hotfix ветки | Сложные проекты с релизными циклами |
| **[GitLab Flow](https://docs.gitlab.com/ee/topics/gitlab_flow.html)** | Production branch + environment branches | Контролируемое развертывание по окружениям |
| **[Forking Workflow](https://docs.github.com/ru/get-started/quickstart/fork-a-repo)** | Личные форки + upstream репозиторий | Open source проекты, внешние контрибьюторы |

### Стратегии слияния
- **[Merge commits](https://docs.github.com/ru/repositories/configuring-branches-and-merges-in-your-repository/configuring-pull-request-merges)**: Сохраняет полную историю веток
- **[Squash and merge](https://docs.github.com/ru/pull-requests/collaborating-with-pull-requests/incorporating-changes-from-a-pull-request/about-pull-request-merges#squash-and-merge-your-commits)**: Объединяет коммиты ветки в один
- **[Rebase and merge](https://docs.github.com/ru/pull-requests/collaborating-with-pull-requests/incorporating-changes-from-a-pull-request/about-pull-request-merges#rebase-and-merge-your-commits)**: Линейная история без merge коммитов

## Best Practices

### Именование и организация

| Элемент | Рекомендации | Примеры |
|---------|--------------|---------|
| **[Ветки](https://docs.github.com/ru/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/about-branches)** | Префикс типа + краткое описание | `feature/user-auth`, `bugfix/login-error`, `hotfix/security-patch` |
| **Коммиты** | [Conventional Commits](https://www.conventionalcommits.org/ru/v1.0.0/): тип(область): описание | `feat(auth): add OAuth integration`, `fix(api): handle null responses` |
| **[Pull Requests](https://docs.github.com/ru/pull-requests)** | Четкое описание изменений + связи с [Issues](https://docs.github.com/ru/issues) | "Add user authentication #123" |
| **[Issues](https://docs.github.com/ru/issues)** | Шаблоны для багов, фич, вопросов | Bug report template, Feature request template |
| **[Releases](https://docs.github.com/ru/repositories/releasing-projects-on-github)** | [Семантическое версионирование](https://semver.org/lang/ru/) | v1.2.3 (MAJOR.MINOR.PATCH) |

### Организация репозитория
- **[README.md](https://docs.github.com/ru/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/about-readmes)**: Описание проекта, установка, использование
- **[CONTRIBUTING.md](https://docs.github.com/ru/communities/setting-up-your-project-for-healthy-contributions/setting-guidelines-for-repository-contributors)**: Руководство для контрибьюторов
- **[Issue templates](https://docs.github.com/ru/communities/using-templates-to-encourage-useful-issues-and-pull-requests/configuring-issue-templates-for-your-repository)**: Стандартизированные формы для [Issues](https://docs.github.com/ru/issues)
- **[PR templates](https://docs.github.com/ru/communities/using-templates-to-encourage-useful-issues-and-pull-requests/creating-a-pull-request-template-for-your-repository)**: Чек-листы для [Pull Requests](https://docs.github.com/ru/pull-requests)
- **[.github/CODEOWNERS](https://docs.github.com/ru/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/about-code-owners)**: Автоматическое назначение ревьюеров

## Security Practices

### Управление доступом

| Уровень | Возможности управления |
|---------|------------------------|
| **[Организация](https://docs.github.com/ru/organizations)** | Владельцы, участники, внешние коллабораторы |
| **[Команды](https://docs.github.com/ru/organizations/organizing-members-into-teams)** | Группировка пользователей по ролям |
| **[Репозитории](https://docs.github.com/ru/repositories)** | Admin, Write, Triage, Read, Maintain |
| **[Ветки](https://docs.github.com/ru/repositories/configuring-branches-and-merges-in-your-repository)** | [Branch protection rules](https://docs.github.com/ru/repositories/configuring-branches-and-merges-in-your-repository/managing-protected-branches), required reviews |

### Безопасность кода
- **[Dependabot](https://docs.github.com/ru/code-security/dependabot)**: Автоматическое обновление зависимостей
- **[Security Advisories](https://docs.github.com/ru/code-security/security-advisories)**: Приватное обсуждение уязвимостей
- **[Code Scanning](https://docs.github.com/ru/code-security/code-scanning)**: Автоматический поиск уязвимостей в коде
- **[Secret Scanning](https://docs.github.com/ru/code-security/secret-scanning)**: Обнаружение токенов и ключей в коде
- **[Signed Commits](https://docs.github.com/ru/authentication/managing-commit-signature-verification)**: Криптографическая подпись коммитов

### Управление секретами
- **[Repository Secrets](https://docs.github.com/ru/actions/security-guides/using-secrets-in-github-actions)**: Переменные уровня репозитория
- **[Environment Secrets](https://docs.github.com/ru/actions/deployment/targeting-different-environments/using-environments-for-deployment)**: Секреты для конкретных окружений
- **[Organization Secrets](https://docs.github.com/ru/actions/security-guides/using-secrets-in-github-actions#creating-secrets-for-an-organization)**: Общие секреты для организации

## Advanced GitHub Actions

### Возможности автоматизации

| Функциональность | Применение |
|------------------|------------|
| **[Matrix Builds](https://docs.github.com/ru/actions/using-jobs/using-a-matrix-for-your-jobs)** | Тестирование на множестве версий/платформ |
| **[Conditional Execution](https://docs.github.com/ru/actions/using-jobs/using-conditions-to-control-job-execution)** | Выполнение шагов по условиям |
| **[Custom Actions](https://docs.github.com/ru/actions/creating-actions)** | Переиспользуемые компоненты автоматизации |
| **[Workflow Templates](https://docs.github.com/ru/actions/using-workflows/creating-starter-workflows-for-your-organization)** | Шаблоны для стандартизации CI/CD |
| **[Self-hosted Runners](https://docs.github.com/ru/actions/hosting-your-own-runners)** | Выполнение на собственной инфраструктуре |

### Типы автоматизации
- **[CI/CD](https://docs.github.com/ru/actions/automating-builds-and-tests)**: Сборка, тестирование, развертывание
- **[Code Quality](https://docs.github.com/ru/code-security/code-scanning)**: Линтеры, форматтеры, анализ покрытия
- **[Security](https://docs.github.com/ru/code-security)**: Сканирование уязвимостей, аудит зависимостей
- **Documentation**: Автогенерация docs, обновление changelog
- **Project Management**: Автоматизация [Issues](https://docs.github.com/ru/issues)/[PR](https://docs.github.com/ru/pull-requests), уведомления

## GitHub API и автоматизация

### Возможности интеграции

| API категория | Основные функции |
|---------------|------------------|
| **[REST API](https://docs.github.com/ru/rest)** | CRUD операции с Issues, PR, репозиториями |
| **[GraphQL API](https://docs.github.com/ru/graphql)** | Эффективные запросы со сложной фильтрацией |
| **[Webhooks](https://docs.github.com/ru/webhooks-and-events/webhooks)** | Реакция на события в реальном времени |
| **[GitHub Apps](https://docs.github.com/ru/apps)** | Интеграции с расширенными правами |
| **[OAuth Apps](https://docs.github.com/ru/apps/oauth-apps)** | Авторизация пользователей через GitHub |

### Сценарии автоматизации
- **Синхронизация данных**: Экспорт [Issues](https://docs.github.com/ru/issues) в внешние системы
- **Автоматизация процессов**: Создание [Issues](https://docs.github.com/ru/issues) из внешних источников
- **Интеграция с [CI/CD](https://docs.github.com/ru/actions/automating-builds-and-tests)**: Запуск внешних пайплайнов
- **Мониторинг**: Трекинг активности и метрик проекта

## Интеграции

### Популярные интеграции

| Категория | Сервисы | Возможности |
|-----------|---------|-------------|
| **Коммуникация** | Slack, Microsoft Teams, Discord | Уведомления о [PR](https://docs.github.com/ru/pull-requests), [Issues](https://docs.github.com/ru/issues), deployments |
| **Project Management** | Jira, Asana, Trello | Синхронизация задач и статусов |
| **IDE** | VS Code, IntelliJ, Vim | Работа с [GitHub](https://docs.github.com/) прямо из редактора |
| **Monitoring** | Datadog, New Relic, Sentry | Связывание деплоев с метриками |
| **Security** | Snyk, WhiteSource, Veracode | Интеграция сканеров безопасности |

### Типы интеграций
- **[GitHub Apps](https://docs.github.com/ru/apps)**: Полнофункциональные приложения
- **[Webhooks](https://docs.github.com/ru/webhooks-and-events/webhooks)**: Реакция на события
- **[OAuth Applications](https://docs.github.com/ru/apps/oauth-apps)**: Авторизация через GitHub
- **[Marketplace](https://github.com/marketplace)**: Готовые решения от сообщества

## Team Collaboration

### Настройка процессов

| Процесс | Инструменты GitHub |
|---------|-------------------|
| **[Code Review](https://docs.github.com/ru/pull-requests/collaborating-with-pull-requests/reviewing-changes-in-pull-requests)** | Required reviewers, [CODEOWNERS](https://docs.github.com/ru/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/about-code-owners), review assignments |
| **[Branch Protection](https://docs.github.com/ru/repositories/configuring-branches-and-merges-in-your-repository/managing-protected-branches)** | Status checks, linear history, admin enforcement |
| **[Release Management](https://docs.github.com/ru/repositories/releasing-projects-on-github)** | [Protected tags](https://docs.github.com/ru/repositories/managing-your-repositorys-settings-and-features/managing-repository-settings), required [status checks](https://docs.github.com/ru/pull-requests/collaborating-with-pull-requests/collaborating-on-repositories-with-code-quality-features/about-status-checks), [environments](https://docs.github.com/ru/actions/deployment/targeting-different-environments) |
| **Issue Tracking** | [Templates](https://docs.github.com/ru/communities/using-templates-to-encourage-useful-issues-and-pull-requests), [labels](https://docs.github.com/ru/issues/using-labels-and-milestones-to-track-work), [milestones](https://docs.github.com/ru/issues/using-labels-and-milestones-to-track-work/about-milestones), [projects](https://docs.github.com/ru/issues/planning-and-tracking-with-projects) |
| **Documentation** | [Wiki](https://docs.github.com/ru/communities/documenting-your-project-with-wikis), [GitHub Pages](https://docs.github.com/ru/pages), automated docs |

### Коллаборация в команде
- **[Role-based Access](https://docs.github.com/ru/organizations/managing-user-access-to-your-organizations-repositories)**: Разграничение доступа по ролям
- **[Review Assignments](https://docs.github.com/ru/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/about-code-owners)**: Автоматическое назначение ревьюеров
- **[Draft Pull Requests](https://docs.github.com/ru/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/about-pull-requests#draft-pull-requests)**: Обсуждение изменений до готовности
- **[Discussions](https://docs.github.com/ru/discussions)**: Форум для обсуждений на уровне репозитория
- **[Project Boards](https://docs.github.com/ru/issues/planning-and-tracking-with-projects)**: Канбан для планирования и трекинга

## Тарифы и ограничения

### Бесплатный план (Free)

| Ресурс | Ограничение |
|--------|-------------|
| **Приватные репозитории** | Неограниченно |
| **Коллабораторы** | Неограниченно |
| **[GitHub Actions](https://docs.github.com/ru/actions)** | 2000 минут/месяц |
| **[GitHub Packages](https://docs.github.com/ru/packages)** | 500 MB хранилища, 1 GB трафика |
| **[Git LFS](https://docs.github.com/ru/repositories/working-with-files/managing-large-files)** | 1 GB хранилища, 1 GB трафика |
| **[GitHub Pages](https://docs.github.com/ru/pages)** | 1 GB хранилища |

### Pro план ($4/месяц)

| Дополнительно к Free | Значение |
|---------------------|----------|
| **[GitHub Actions](https://docs.github.com/ru/actions)** | 3000 минут/месяц |
| **[GitHub Packages](https://docs.github.com/ru/packages)** | 2 GB хранилища, 10 GB трафика |
| **[Git LFS](https://docs.github.com/ru/repositories/working-with-files/managing-large-files)** | 2 GB хранилища, 2 GB трафика |
| **Advanced tools** | [Insights](https://docs.github.com/ru/repositories/viewing-activity-and-data-for-your-repository), [protected branches](https://docs.github.com/ru/repositories/configuring-branches-and-merges-in-your-repository/managing-protected-branches) |

### Team план ($4/пользователь/месяц)

| Возможности | Описание |
|-------------|----------|
| **[Team management](https://docs.github.com/ru/organizations/organizing-members-into-teams)** | Управление командами и доступом |
| **[Draft PRs](https://docs.github.com/ru/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/about-pull-requests#draft-pull-requests)** | Черновики [Pull Requests](https://docs.github.com/ru/pull-requests) |
| **[Code owners](https://docs.github.com/ru/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/about-code-owners)** | Автоматическое назначение ревьюеров |
| **[Scheduled reminders](https://docs.github.com/ru/organizations/organizing-members-into-teams/managing-scheduled-reminders-for-your-team)** | Напоминания о review |

### Enterprise ($21/пользователь/месяц)

| Enterprise функции | Описание |
|-------------------|----------|
| **[SAML SSO](https://docs.github.com/ru/enterprise-cloud@latest/organizations/managing-saml-single-sign-on-for-your-organization)** | Единый вход через корпоративные системы |
| **Advanced security** | [Security overview](https://docs.github.com/ru/code-security/security-overview), [dependency insights](https://docs.github.com/ru/code-security/supply-chain-security/understanding-your-software-supply-chain) |
| **[Audit logs](https://docs.github.com/ru/organizations/keeping-your-organization-secure/managing-security-settings-for-your-organization/reviewing-the-audit-log-for-your-organization)** | Детальное логирование действий |
| **[Priority support](https://docs.github.com/ru/support)** | Приоритетная техническая поддержка |

## Полезные ресурсы

- **[Официальная документация](https://docs.github.com/)**: Полное руководство по GitHub
- **[GitHub API](https://docs.github.com/en/rest)**: REST API документация
- **[GitHub CLI](https://cli.github.com/)**: Интерфейс командной строки
- **[GitHub Desktop](https://desktop.github.com/)**: Графический клиент
- **[GitHub Skills](https://skills.github.com/)**: Интерактивные курсы
- **[GitHub Community](https://github.community/)**: Форум сообщества