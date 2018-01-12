# checksite
Checks a site for changes and emails you via your gmail application based password

## Requirements
 * curl
 * md5sum
 * sendEmail

## Usage
```
./checksite.sh {{ site }} "{{ email_to }}" "{{ email_from }}" "{{ email_config_user }}" "{{ email_config_password }}"
```
where,
 * `site` is the site to watch
 * `email_to` is the email to send the notification too
 * `email_from` is who sent the email
 * `email_config_user` is the google gmail account which is configured for application access
 * `email_config_password` is the applications password

 ### Example
1. Install
```
sudo ./install.sh
```
2. add your command to crontab
open crontab
```
crontab -e
```
add this line (filling in variables defined above)
```
*/20 * * * * /usr/local/bin/checksite {{ site }} "{{ email_to }}" "{{ email_from }}" "{{ email_config_user }}" "{{ email_config_password }}"
```
