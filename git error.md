Issue:
No user exists for uid 11......77
fatal: Could not read from remote repository.

Solution:
Usualy it cause by issues with the terminal.
Try to open a new terminal in new window (not a new tab) and try to push / pull.


proxy_cache_path /tmp/nginx levels=1:2 levels=1:2    keys_zone=STATIC:10m inactive=24h  max_size=1g;
proxy_temp_path /tmp/nginx/tmp;

server {

listen 80;

return 301 https://$host$request_uri;

}

server {

listen 443;

server_name linuxtechlab.com;

ssl_certificate /etc/nginx/ssl/cert.crt;

ssl_certificate_key /etc/nginx/ssl/cert.key;
ssl on;

ssl_session_cache builtin:1000 shared:SSL:10m;

ssl_protocols TLSv1 TLSv1.1 TLSv1.2;

ssl_ciphers HIGH:!aNULL:!eNULL:!EXPORT:!CAMELLIA:!DES:!MD5:!PSK:!RC4;

ssl_prefer_server_ciphers on;

access_log /var/log/nginx/access.log;

location / {

proxy_buffering on;
proxy_cache STATIC;
proxy_cache_valid 200  1d;
proxy_cache_use_stale error timeout invalid_header updating http_500 http_502 http_503 http_504;
proxy_set_header Host $host;
proxy_set_header X-Real-IP $remote_addr;

proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;

proxy_set_header X-Forwarded-Proto $scheme;

proxy_pass https://www.immuniweb.com;

proxy_read_timeout 90;

proxy_redirect http://localhost:8080 https://linuxtechlab.com;

}

}




root@3b7b8ac040aa:/# cat /etc/nginx/ssl/cert.key
-----BEGIN PRIVATE KEY-----
MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDj22+yh32N5ply
yS4Z5HsYs8o9vhD/NmRJXdpyVTt1wFD7SmoYF2UmmOlI4bfJyw6rbCiqFwnMod28
fZ/ouxeoAUQUdAd0yHVB9BAG6Y//zUTZ2pYCO+nymNkjIZisks8N86KYJ6nflUVY
dS3ubyGCRv4NvQotjkaQ8UcqF5XmVnBN+NOP52wSLyqnMFouJ31RqXQBe9LVOuFn
IgzIuild8hvDLlY/0rbQoyzZOFBvAa50JDqD1q4kQJgTvYEIqmMdH9X4y4TetlPC
kOjWUeBbgrvjAcXqmmn6ggOa0bgBVA4ebBgBificq7TcpRdg6Q3EQdfhmiibb06a
ysnsRfV1AgMBAAECggEAX0DLuAFmHl0JRvANQqu+PfxjDl6XcmlFkVoXyPYSjk4g
THy2T23wTitcUqhxkX0+m7DyavCImzALpxGJONyFrikhUb+TomFui2zBCnK3TQN9
xejYDwUG7vCwzTvtPC9/OWDhVuQ14o7fV3RdCDES/Ag7ini9eX/hxhPnYRRNCOXN
wg9/Vwx9vJYeQUSC3FvGHw5SSwqFL5MvIAxP5hhmopKRv2uTn8Q4aJbP7+H+T0OR
jWG4RQadSoQQZhsfYmCoJKkymrU6uyJSKk6ItD8vH4Ge5AMyC5aw8U1JgePKC8+v
4nOLZWcu3r1pON5yUTjoB1BfSFjJJI9TGorwDnToXQKBgQD2an2bX61fKm7DsAdd
9qmPVE30ItTaKjJUes9zLMNKY2me5ZdfEG2N8OTlygaIpsD+MYXQaQ/fki7ezYPj
Lja7IN2vMcgZoBtAyTF2sVmpUETYVF8v0sJS85Yuyhj3+VbryE682dHgJL3TubUy
m5hpPH7PdQ3ZVPh8Xm32V0xELwKBgQDsuCjk8jYss9ZQydC/b0ePrm7gOPu4WhKg
T1jjnFENpxHhV7knuXcBV0e3AR921P1k5CqNEC51OwQxvJm3SuhSVaGlROrLC80s
oIqYxmFjfL8t6VjCE+mm4RzmHnFq/pAoKA2783iNoBjJsIWVjf70Tt8M3XYfSkWs
qhlk2c3jmwKBgQCyurTWcIRAxXdHqrL9PX7o/f34uRboErkku1sir/IKT6b5YI/1
nOXJkVOFNI6eqUzMUsE7VCj2QYKLikdCDXAXNJR2kUYRCCccS5H8BFEDVLxKqI/O
ETFvl0x0LZQEsK6SIFyz782hpSSmoElEJsVad02HTeC4pUACfT+G8PTZcwKBgAXN
8jrC8a8g7cVnXXYEPYX5agCXhRydIM3LhEt4fshN63NSGlkuBAwFXt3O6j2YtWnu
6lgxKGJ5gv3RORe0f4PdU6xgxz0ZWfuZKCzc2HB/E5UFnsaLhHQyGupNnsxX16MU
cFnGe5NFdLYlXPEw3SqScIe5OndD8/dq6Fp/uLu3AoGBALyJTdleeNVT74q9OpL3
D2KV9eJCNzw2XraW8VUtPewMnVUqlmTASGJk/GwtAdC8E5qCHXesBZ59CK+HUdrH
gSAuhypmCb47pwzQ2vULEaMjr0v21Mp5RaZ8dralGMQUJino+1Q39aljEu3NmvAg
1lAG9E+yJTZDpcquZrEX9fgp
-----END PRIVATE KEY-----



root@3b7b8ac040aa:/# cat /etc/nginx/ssl/cert.crt
-----BEGIN CERTIFICATE-----
MIIDazCCAlOgAwIBAgIUQmcmyxyQv7z2bNZXRilEw3SNMsYwDQYJKoZIhvcNAQEL
BQAwRTELMAkGA1UEBhMCQVUxEzARBgNVBAgMClNvbWUtU3RhdGUxITAfBgNVBAoM
GEludGVybmV0IFdpZGdpdHMgUHR5IEx0ZDAeFw0xOTA5MjUxMzQwMjZaFw0yMDA5
MjQxMzQwMjZaMEUxCzAJBgNVBAYTAkFVMRMwEQYDVQQIDApTb21lLVN0YXRlMSEw
HwYDVQQKDBhJbnRlcm5ldCBXaWRnaXRzIFB0eSBMdGQwggEiMA0GCSqGSIb3DQEB
AQUAA4IBDwAwggEKAoIBAQDj22+yh32N5plyyS4Z5HsYs8o9vhD/NmRJXdpyVTt1
wFD7SmoYF2UmmOlI4bfJyw6rbCiqFwnMod28fZ/ouxeoAUQUdAd0yHVB9BAG6Y//
zUTZ2pYCO+nymNkjIZisks8N86KYJ6nflUVYdS3ubyGCRv4NvQotjkaQ8UcqF5Xm
VnBN+NOP52wSLyqnMFouJ31RqXQBe9LVOuFnIgzIuild8hvDLlY/0rbQoyzZOFBv
Aa50JDqD1q4kQJgTvYEIqmMdH9X4y4TetlPCkOjWUeBbgrvjAcXqmmn6ggOa0bgB
VA4ebBgBificq7TcpRdg6Q3EQdfhmiibb06aysnsRfV1AgMBAAGjUzBRMB0GA1Ud
DgQWBBT6wahgzLSdGUCj7vGgwFvzAq4JmzAfBgNVHSMEGDAWgBT6wahgzLSdGUCj
7vGgwFvzAq4JmzAPBgNVHRMBAf8EBTADAQH/MA0GCSqGSIb3DQEBCwUAA4IBAQCl
tOOsfFXs1NFtAH/cmEZxmdW8UI3Uie83PoaixZqyls+Is4Tze4ldrL/4hrwu1p3G
ucPzBLaIx5oDxHUb6tLeDHtoPd1Bpsy+IE9Esg2o8WQ1WzfAXMtacxuf/cwAJqW+
Aie7+qYzhY/zEK2sTMN/Yy8xWJAF9/4hHrYTeZpGg7cxUzRBgTOBgbODpElwOR8l
rXbegyMI9m1IM3SXaVJ2fOQWmL8NVigVIqm47EHzJ60ypCbuEJjEcFlyuURyjryU
ABhbThAlPvnhlOCuo17JQA5UgWA4idEqwuOvR/e3xy5U/N8TLcr4xsZZn2Wkefcg
yB/tE+qglKkImlwj5agj
-----END CERTIFICATE-----


docker run -p 8888:80 -p 8883:443 -v $(pwd)/default.conf:/etc/nginx/conf.d/default.conf -v $(pwd)/cert.crt:/etc/nginx/ssl/cert.crt -v $(pwd)/cert.key:/etc/nginx/ssl/cert.key -it nginx bash
