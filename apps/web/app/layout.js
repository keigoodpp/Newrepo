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
      <body style={{ margin: 0, fontFamily: 'system-ui, -apple-system, Segoe UI, Roboto, Noto Sans JP, sans-serif', backgroundColor: '#FFFBE6' }}>
        <div style={{ background: '#FFEB3B', color: '#111', textAlign: 'center', padding: '12px 16px', fontWeight: 600 }}>
          レビューモード有効中 — 表示が変わっていればOKです
        </div>
        {children}
      </body>
    </html>
  );
}
