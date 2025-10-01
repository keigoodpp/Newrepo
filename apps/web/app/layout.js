export const metadata = {
  title: 'AWS Learning Portal',
  description: 'Mobile-first PWA for Q&A learning.'
};

export default function RootLayout({ children }) {
  return (
    <html lang="ja">
      <head>
        <link rel="manifest" href="/manifest.webmanifest" />
        <meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover" />
        <meta name="theme-color" content="#111827" />
      </head>
      <body style={{ margin: 0, fontFamily: 'system-ui, -apple-system, Segoe UI, Roboto, Noto Sans JP, sans-serif' }}>
        {children}
      </body>
    </html>
  );
}
