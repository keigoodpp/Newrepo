<?php
// Simple PHP API placeholder
declare(strict_types=1);

header('Content-Type: application/json');

$path = parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH) ?? '/';

if ($path === '/health') {
    echo json_encode(['ok' => true, 'service' => 'api', 'time' => gmdate('c')]);
    exit;
}

http_response_code(404);
echo json_encode(['error' => 'Not Found', 'path' => $path]);
