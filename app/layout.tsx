import { ReactNode } from 'react'
import './globals.css'
import Favicon from '../components/Favicon'

export const metadata = {
  title: 'My Next.js Application',
  description: 'A Next.js project with TypeScript using the App Router',
}

export default function RootLayout({ children }: { children: ReactNode }) {
  return (
    <html lang="en">
      <Favicon />
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