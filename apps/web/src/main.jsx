import { StrictMode } from 'react'
import { createRoot } from 'react-dom/client'
import './index.css'
import App from './App.jsx'

window.onerror = (msg, src, line, col, err) => {
  console.error("Frontend error:", msg, err)
  fetch("/log", {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify({ msg, src, line, col, stack: err?.stack })
  }).catch(() => {})
}
window.addEventListener("unhandledrejection", e => console.error("Unhandled promise:", e.reason))

createRoot(document.getElementById('root')).render(
  <StrictMode>
    <App />
  </StrictMode>,
)
