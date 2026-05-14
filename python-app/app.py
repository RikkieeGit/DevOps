from http.server import HTTPServer, BaseHTTPRequestHandler

class Handler(BaseHTTPRequestHandler):
	def do_GET(self):
		self.send_response(200)
		self.send_header('Content-type','text/html')
		self.end_headers()
		self.wfile.write(b"""
		<h1>Python App Running in Docker!</h1>
		<p>Built by Rikkiee</p>
		<p>No frameworks needed - pure Python!</p>
		""")

server = HTTPServer(('0.0.0.0', 8000), Handler)
print("Server running on port 8000...")
server.serve_forever()
