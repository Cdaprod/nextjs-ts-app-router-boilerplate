#!/bin/sh

# Create directories
mkdir -p app public styles .github/workflows

# Create and populate Dockerfile
cat > Dockerfile <<EOL
# [Paste the Dockerfile content here]
EOL

# Create and populate next-env.d.ts
cat > next-env.d.ts <<EOL
/// <reference types="next" />
/// <reference types="next/image-types/global" />

// NOTE: This file should not be edited
// see https://nextjs.org/docs/basic-features/typescript for more information.
EOL

# Create and populate package.json
cat > package.json <<EOL
{
  "name": "nextjs-ts-app-router",
  "version": "1.0.0",
  "private": true,
  "scripts": {
    "dev": "next dev",
    "build": "next build",
    "start": "next start",
    "lint": "next lint",
    "type-check": "tsc --noEmit"
  },
  "dependencies": {
    "next": "13.4.19",
    "react": "18.2.0",
    "react-dom": "18.2.0"
  },
  "devDependencies": {
    "@types/react": "18.2.14",
    "@types/node": "20.4.2",
    "typescript": "5.1.6",
    "eslint": "8.49.0",
    "eslint-config-next": "13.4.19"
  }
}
EOL

# Create and populate tsconfig.json
cat > tsconfig.json <<EOL
{
  "compilerOptions": {
    "target": "es5",
    "lib": ["dom", "dom.iterable", "esnext"],
    "allowJs": true,
    "skipLibCheck": true,
    "strict": true,
    "forceConsistentCasingInFileNames": true,
    "noEmit": true,
    "esModuleInterop": true,
    "module": "esnext",
    "moduleResolution": "node",
    "resolveJsonModule": true,
    "isolatedModules": true,
    "jsx": "preserve",
    "incremental": true
  },
  "include": ["next-env.d.ts", "**/*.ts", "**/*.tsx"],
  "exclude": ["node_modules"]
}
EOL

# Create and populate app/layout.tsx
mkdir app
cat > app/layout.tsx <<EOL
import './globals.css'
import { ReactNode } from 'react'

export const metadata = {
  title: 'Next.js TypeScript App Router',
  description: 'A Next.js project with TypeScript using the App Router',
}

export default function RootLayout({ children }: { children: ReactNode }) {
  return (
    <html lang="en">
      <body>
        <header>
          <nav>
            <h1>My Next.js App</h1>
          </nav>
        </header>
        <main>{children}</main>
        <footer>
          <p>&copy; 2024 My Next.js App</p>
        </footer>
      </body>
    </html>
  )
}
EOL

# Create and populate app/page.tsx
cat > app/page.tsx <<EOL
export default function HomePage() {
  return (
    <div>
      <h2>Welcome to the Next.js TypeScript App Router!</h2>
      <p>This is your home page.</p>
    </div>
  )
}
EOL

# Create and populate public/favicon.ico and public/vercel.svg
# You can download these files from a default Next.js project or replace them with your own assets.

# Create and populate styles/globals.css
mkdir styles
cat > styles/globals.css <<EOL
/* styles/globals.css */
html,
body {
  padding: 0;
  margin: 0;
  font-family: -apple-system, BlinkMacSystemFont, Segoe UI, Roboto, Oxygen,
    Ubuntu, Cantarell, Fira Sans, Droid Sans, Helvetica Neue, sans-serif;
}

a {
  color: inherit;
  text-decoration: none;
}

* {
  box-sizing: border-box;
}

main {
  padding: 2rem;
}
EOL

# Create and populate styles/Home.module.css
cat > styles/Home.module.css <<EOL
/* styles/Home.module.css */
.container {
  min-height: 100vh;
  padding: 0 0.5rem;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
}

.main {
  padding: 5rem 0;
  flex: 1;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
}

.footer {
  width: 100%;
  height: 100px;
  border-top: 1px solid #eaeaea;
  display: flex;
  justify-content: center;
  align-items: center;
}
EOL

# Create and populate .github/workflows/ci.yml
mkdir -p .github/workflows
cat > .github/workflows/ci.yml <<EOL
name: CI

on:
  push:
    branches: [ main ]
  pull_request:
    branches: [ main ]

jobs:
  build:

    runs-on: ubuntu-latest

    steps:
      - name: Checkout repository
        uses: actions/checkout@v3

      - name: Set up Node.js
        uses: actions/setup-node@v3
        with:
          node-version: '18'

      - name: Install dependencies
        run: npm ci

      - name: Lint
        run: npm run lint

      - name: Type Check
        run: npm run type-check

      - name: Build
        run: npm run build

      - name: Run tests
        # Add your test command here if you have tests
        run: echo "No tests specified."
EOL

git init
echo "node_modules
.next
.env.local
.env.development.local
.env.test.local
.env.production.local
.DS_Store
coverage" > .gitignore

git add .
git commit -m "Initial commit using Next.js TypeScript App Router boilerplate"