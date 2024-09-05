# SPF (Sender Policy Framework)

An SPF (Sender Policy Framework) record is a type of DNS (Domain Name System) record used to prevent email spoofing and to authenticate the email sender's domain. SPF allows the owner of a domain to specify which mail servers are authorized to send emails on behalf of their domain. When an email is sent, the recipient's mail server checks the SPF record of the sending domain to verify if the email originated from an authorized source.

### Key Points of SPF Records:
- DNS Record: SPF is implemented as a DNS TXT record in the domain's DNS settings.
- Authorized Mail Servers: It lists IP addresses or hostnames of servers that are allowed to send emails for the domain.
- Email Authentication: It helps validate the legitimacy of the sender's domain to prevent spoofing or phishing attempts.
- Evaluation: When an email is received, the receiving mail server checks the SPF record of the sender's domain to see if the sending server is authorized. If not, the email may be rejected or marked as spam.