async function fetchHealth() {
  try {
    const res = await fetch('/api/health', { cache: 'no-store' });
    const text = await res.text();
    return { status: res.status, body: text };
  } catch (e) {
    return { status: 0, body: JSON.stringify({ ok: false, error: 'unreachable' }) };
  }
}

export default async function Dev() {
  const health = await fetchHealth();
  return (
    <main style={{ minHeight: '100svh', padding: 16 }}>
      <h1 style={{ fontSize: 22, marginBottom: 8 }}>Dev Dashboard</h1>
      <div style={{ display: 'grid', gap: 12 }}>
        <section style={{ padding: 12, border: '1px solid #ddd', borderRadius: 8 }}>
          <h2 style={{ fontSize: 16, margin: 0, marginBottom: 8 }}>Web</h2>
          <div>OK (HMR有効)</div>
        </section>
        <section style={{ padding: 12, border: '1px solid #ddd', borderRadius: 8 }}>
          <h2 style={{ fontSize: 16, margin: 0, marginBottom: 8 }}>API Health</h2>
          <div style={{ fontFamily: 'monospace', whiteSpace: 'pre-wrap' }}>
            {health.status}: {health.body}
          </div>
          <p style={{ color: '#666', fontSize: 12, marginTop: 8 }}>
            APIが未起動の場合は Codespaces ターミナルで
            <code> php -S 0.0.0.0:8000 -t apps/api/public </code>
          </p>
        </section>
      </div>
    </main>
  );
}
