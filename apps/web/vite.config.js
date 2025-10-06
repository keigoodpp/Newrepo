import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react';

export default defineConfig({
  plugins: [react()],
  logLevel: 'info',
  server: { host: true, port: 3000, hmr: { clientPort: 443 } }
});
