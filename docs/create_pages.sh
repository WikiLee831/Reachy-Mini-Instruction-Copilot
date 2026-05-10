#!/bin/bash

# 创建通用页面模板函数
create_page() {
    local filepath=$1
    local title=$2
    local nav_section=$3
    local active_link=$4
    
    mkdir -p "$(dirname "$filepath")"
    
    cat > "$filepath" << PAGEEOF
<!DOCTYPE html>
<html lang="zh-TW">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>$title</title>
    <style>
        body { font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif; margin: 0; background: #fff; }
        .header { background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); color: white; padding: 1.5rem 2rem; }
        .header h1 { margin: 0; font-size: 2rem; }
        .container { max-width: 1080px; margin: 2rem auto; padding: 0 1.5rem; }
        .page-layout { display: grid; grid-template-columns: 280px 1fr; gap: 1.5rem; }
        .sidebar { background: #f8f9fa; border: 1px solid #e1e5e9; border-radius: 12px; padding: 1.5rem; max-height: 90vh; overflow-y: auto; font-size: 0.95rem; }
        .sidebar-title { font-size: 0.8rem; font-weight: 700; color: #64748b; text-transform: uppercase; margin-bottom: 0.75rem; }
        .sidebar-list { list-style: none; padding: 0; margin: 0; }
        .sidebar-list li { margin-bottom: 0.5rem; }
        .sidebar-list a { color: #475569; text-decoration: none; display: block; }
        .sidebar-list a:hover { color: #2563eb; }
        .sidebar-active a { color: #2563eb; font-weight: 600; }
        .content h1 { font-size: 1.8rem; margin-top: 0; }
        .content h2 { font-size: 1.3rem; margin-top: 1.5rem; }
        .external-box { background: #e7f3ff; border: 1px solid #b3d9ff; border-radius: 8px; padding: 1.5rem; margin: 2rem 0; }
        .external-box a { color: #0066cc; text-decoration: none; font-weight: 600; }
        .nav { display: flex; justify-content: space-between; margin-top: 2rem; padding-top: 1rem; border-top: 1px solid #ddd; }
        .nav a { color: #2563eb; text-decoration: none; font-weight: 600; }
        .footer { text-align: center; margin: 2rem 0; font-size: 0.9rem; color: #666; }
        @media (max-width: 768px) { .page-layout { grid-template-columns: 1fr; } }
    </style>
</head>
<body>
    <header class="header"><h1>$title</h1></header>
    <main class="container">
        <div class="page-layout">
            <aside class="sidebar">
                $nav_section
            </aside>
            <div class="content">
                <h1>$title</h1>
                <p>此頁面正在建設中。請查看下方的官方文檔鏈接以獲取完整的最新信息。</p>
                <h2>功能概述</h2>
                <p>本節提供 $title 的關鍵信息和說明。</p>
                <div class="external-box">
                    <h3>📖 查看完整官方文檔</h3>
                    <p>此頁面是 Hugging Face 官方文檔的摘要。如需完整信息，請訪問官方文檔。</p>
                    <p><a href="https://huggingface.co/docs/reachy_mini" target="_blank">🔗 官方 Reachy Mini 文檔</a></p>
                </div>
            </div>
        </div>
    </main>
    <footer class="footer"><p>© 2026 Reachy Mini Documentation - 繁體中文摘要版本</p></footer>
</body>
</html>
PAGEEOF
}

# Reachy Mini (Wireless) 导航
WIRELESS_NAV='<div class="sidebar-title">REACHY MINI (WIRELESS)</div>
<ul class="sidebar-list">
<li><a href="get_started.html">Getting started</a></li>
<li><a href="hardware.html">Hardware</a></li>
<li><a href="usage.html">Usage</a></li>
<li><a href="media_advanced.html">Media Advanced Controls</a></li>
<li><a href="reset.html">Reset</a></li>
<li><a href="install_daemon.html">Install Daemon</a></li>
<li><a href="development.html">Development</a></li>
<li><a href="reflash_iso.html">Reflash ISO</a></li>
</ul>'

# Reachy Mini Lite 导航
LITE_NAV='<div class="sidebar-title">REACHY MINI LITE</div>
<ul class="sidebar-list">
<li><a href="get_started.html">Getting started</a></li>
<li><a href="hardware.html">Hardware</a></li>
<li><a href="usage.html">Usage</a></li>
</ul>'

# Simulation 导航
SIM_NAV='<div class="sidebar-title">SIMULATION</div>
<ul class="sidebar-list">
<li><a href="get_started.html">Getting started</a></li>
</ul>'

# SDK 导航
SDK_NAV='<div class="sidebar-title">SOFTWARE GUIDE</div>
<ul class="sidebar-list">
<li><a href="../../index.html">SDK Overview</a></li>
<li><a href="installation.html">Installation</a></li>
<li><a href="core_concepts.html">Core Concepts</a></li>
<li><a href="quickstart.html">Quickstart</a></li>
<li><a href="python_sdk.html">Python SDK</a></li>
<li><a href="ai_integrations.html">AI Integrations</a></li>
<li><a href="building_publishing_apps.html">Building & Publishing</a></li>
<li><a href="rest_api.html">REST API</a></li>
<li><a href="javascript_sdk.html">JavaScript SDK</a></li>
<li><a href="media_architecture.html">Media Architecture</a></li>
<li><a href="gstreamer_installation.html">GStreamer</a></li>
</ul>'

# 创建 Reachy Mini (Wireless) 页面
create_page "platforms/reachy_mini/media_advanced.html" "Media Advanced Controls" "$WIRELESS_NAV" "media_advanced"
create_page "platforms/reachy_mini/reset.html" "Reset" "$WIRELESS_NAV" "reset"
create_page "platforms/reachy_mini/install_daemon.html" "Install Daemon from Branch" "$WIRELESS_NAV" "install_daemon"
create_page "platforms/reachy_mini/development.html" "Development Workflow" "$WIRELESS_NAV" "development"
create_page "platforms/reachy_mini/reflash_iso.html" "Reflash the ISO" "$WIRELESS_NAV" "reflash_iso"

# 创建 Reachy Mini Lite 页面
create_page "platforms/reachy_mini_lite/get_started.html" "Reachy Mini Lite - Getting Started" "$LITE_NAV" "get_started"
create_page "platforms/reachy_mini_lite/hardware.html" "Reachy Mini Lite - Hardware" "$LITE_NAV" "hardware"
create_page "platforms/reachy_mini_lite/usage.html" "Reachy Mini Lite - Usage" "$LITE_NAV" "usage"

# 创建 Simulation 页面
create_page "platforms/simulation/get_started.html" "Simulation - Getting Started" "$SIM_NAV" "get_started"

# 创建 SDK 页面
create_page "SDK/core_concepts.html" "Core Concepts" "$SDK_NAV" "core_concepts"
create_page "SDK/quickstart.html" "Quickstart Guide" "$SDK_NAV" "quickstart"
create_page "SDK/python_sdk.html" "Python SDK" "$SDK_NAV" "python_sdk"
create_page "SDK/ai_integrations.html" "AI Integrations" "$SDK_NAV" "ai_integrations"
create_page "SDK/building_publishing_apps.html" "Building & Publishing Apps" "$SDK_NAV" "building_publishing"
create_page "SDK/javascript_sdk.html" "JavaScript SDK & Web Apps" "$SDK_NAV" "javascript_sdk"
create_page "SDK/media_architecture.html" "Media Architecture" "$SDK_NAV" "media_architecture"
create_page "SDK/gstreamer_installation.html" "GStreamer Installation" "$SDK_NAV" "gstreamer"

echo "✅ All pages created successfully!"
