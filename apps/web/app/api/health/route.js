export async function GET() {
  try {
    const res = await fetch('http://127.0.0.1:8000/health', { cache: 'no-store' });
    const text = await res.text();
    return new Response(text || '{}', {
      status: res.status,
      headers: { 'Content-Type': 'application/json' }
    });
  } catch (e) {
    return new Response(JSON.stringify({ ok: false, error: 'API unreachable' }), {
      status: 502,
      headers: { 'Content-Type': 'application/json' }
    });
  }
}
