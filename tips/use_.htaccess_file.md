# How to Use .htaccess File to Prevent Clients Visiting Website

## Reference
 * https://help.dreamhost.com/hc/en-us/articles/216363167-How-do-I-deny-access-to-my-site-with-an-htaccess-file-
 * https://serverfault.com/questions/293160/apache-rewrite-multiple-conditions/293167
 * https://www.siteground.com/kb/how_to_redirect_all_visitors_except_your_ip_to_another_site/
 * https://www.digitalocean.com/community/questions/redirect-ip-address-to-domain-name-apache
 * https://httpd.apache.org/docs/1.3/logs.html
 * http://httpd.apache.org/docs/2.4/mod/core.html#allowoverride

## Idea
 * Based on this [doc|https://help.dreamhost.com/hc/en-us/articles/216363167-How-do-I-deny-access-to-my-site-with-an-htaccess-file-], without restarting apache server, .htaccess file in apache2 server can help to:
   * Deny/Allow access to specific files and folders
   * Deny/Allow access during a specific hour of the day
   * Deny/Allow access from specific IP addresses and domain
   * Redirect to another site if custom comes from specific IP addresses or domain

## How
 1. Make sure logging has been enabled in apache2 server
 2. "AllowOverride All" has been set in the root folder which you want to control the access
 3. "a2enmod rewrite" has been run to enable redirect
 4. Typical .htaccess content is here below, it will redirect to google.com if the custom IP address is 123.456.x.x or 789.112.x.x:
 ```
RewriteEngine On
RewriteBase /
RewriteCond %{REMOTE_HOST} ^123\.456 [NC,OR]
RewriteCond %{REMOTE_HOST} ^789\.112 [NC]
RewriteRule .* http://www.google.com [R=302,L]
 ```
