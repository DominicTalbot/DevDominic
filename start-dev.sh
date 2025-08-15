#!/bin/bash

# DevDominic Portfolio Development Server
# Simple script to start local development environment

echo "🚀 Starting DevDominic Portfolio Development Server..."
echo "📁 Project: Dominic Talbot's Portfolio"
echo "🌐 Server will be available at: http://localhost:8000"
echo ""

# Check if Python 3 is available
if command -v python3 &> /dev/null; then
    echo "✅ Python 3 found - starting HTTP server..."
    echo "💡 Press Ctrl+C to stop the server"
    echo ""
    python3 -m http.server 8000
else
    echo "❌ Python 3 not found. Please install Python 3 to run the development server."
    echo "🔗 Download Python: https://www.python.org/downloads/"
    exit 1
fi