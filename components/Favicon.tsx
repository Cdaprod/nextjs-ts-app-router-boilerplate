// components/Favicon.tsx
import Head from 'next/head';

interface FaviconProps {
  themeColor?: string;
  manifestUrl?: string;
}

const Favicon = ({ themeColor = '#ffffff', manifestUrl = '/site.webmanifest' }: FaviconProps) => (
  <Head>
    {/* Favicon */}
    <link rel="icon" href="/favicon.ico" sizes="any" />
    <link rel="icon" href="/favicon-16x16.png" type="image/png" sizes="16x16" />
    <link rel="icon" href="/favicon-32x32.png" type="image/png" sizes="32x32" />

    {/* Apple Touch Icon */}
    <link rel="apple-touch-icon" href="/apple-touch-icon.png" />

    {/* Android Icons */}
    <link rel="icon" href="/android-chrome-192x192.png" sizes="192x192" />
    <link rel="icon" href="/android-chrome-512x512.png" sizes="512x512" />

    {/* Web App Manifest */}
    <link rel="manifest" href={manifestUrl} />

    {/* Theme Color for mobile browsers */}
    <meta name="theme-color" content={themeColor} />
  </Head>
);

export default Favicon;