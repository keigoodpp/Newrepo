export default function Home() {
  return (
    <main style={{ display: 'grid', placeItems: 'center', minHeight: '100svh', padding: 24 }}>
      <div style={{ maxWidth: 480, width: '100%' }}>
        <h1 style={{ fontSize: 24, marginBottom: 12 }}>AWS 学習ポータル</h1>
        <p style={{ color: '#555', marginBottom: 24 }}>スマホPWAの最小雛形。HMR対応。</p>
        <ul>
          <li>Next.js dev: ポート 3000</li>
          <li>API health: ポート 8000 /health</li>
        </ul>
      </div>
    </main>
  );
}
