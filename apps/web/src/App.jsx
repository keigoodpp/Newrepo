import { useEffect, useState } from 'react';
export default function App() {
  const [msg, setMsg] = useState('loading...');
  useEffect(() => {
    const host = window.location.hostname;
    const api = host.includes('-3000')
      ? `https://${host.replace('-3000', '-8000')}/api/health`
      : '/api/health';
    fetch(api)
      .then(r => r.json())
      .then(d => setMsg(JSON.stringify(d, null, 2)))
      .catch(e => setMsg('fetch error: ' + e));
  }, []);
  return <pre style={{ padding: 16 }}>{msg}</pre>;
}
