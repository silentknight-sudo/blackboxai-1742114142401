import http.server
import socketserver
import os

PORT = 8000

class CustomHandler(http.server.SimpleHTTPRequestHandler):
    def end_headers(self):
        # Enable CORS
        self.send_header('Access-Control-Allow-Origin', '*')
        self.send_header('Access-Control-Allow-Methods', 'GET, POST, OPTIONS')
        self.send_header('Access-Control-Allow-Headers', 'Content-Type')
        super().end_headers()

    def do_GET(self):
        # Serve index.html for root path
        if self.path == '/':
            self.path = '/index.html'
        return http.server.SimpleHTTPRequestHandler.do_GET(self)

    def do_OPTIONS(self):
        # Handle preflight requests
        self.send_response(200)
        self.end_headers()

Handler = CustomHandler

try:
    with socketserver.TCPServer(("", PORT), Handler) as httpd:
        print(f"\n🚀 Server running at http://localhost:{PORT}")
        print("📁 Serving files from:", os.getcwd())
        print("🛑 Press Ctrl+C to stop the server\n")
        httpd.serve_forever()
except KeyboardInterrupt:
    print("\n🛑 Server stopped")
except Exception as e:
    print(f"\n❌ Error: {e}")
