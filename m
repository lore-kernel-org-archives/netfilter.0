From: Jose Luis Faria <jose@di.uminho.pt>
Subject: netfilter for IPv4 and IPv6
Date: Fri, 16 Apr 2004 11:20:14 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <407FB35E.4000605@di.uminho.pt>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature"; micalg=sha1; boundary="------------ms080206070405040101050009"
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: netfilter@lists.netfilter.org

This is a cryptographically signed message in MIME format.

--------------ms080206070405040101050009
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

I have some servers and others machines already in IPv6, some of them 
are firewalls.

The firewalls are dual stack:IPv6 and IPv4. I must use iptables for IPv4
and ip6tables for IPv6, it means, the same firewall must filter packects 
from
IPv4 machines and IPv6 machines.
I'm looking for any help in the net but I can not find any help about this.

What can I do to solve this problem?
Any ideas?

thanks in advance.

-- 

   :)  cumprimentos
------------------------------------
         Jose Luis Faria
         Universidade do Minho
   /\    Escola de Engenharia
  /\/\   Departamento Informatica
         http://www.di.uminho.pt/~jose


--------------ms080206070405040101050009
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIFvjCC
AtswggJEAgErMA0GCSqGSIb3DQEBBAUAMIGwMQswCQYDVQQGEwJQVDEOMAwGA1UECBMFTWlu
aG8xDjAMBgNVBAcTBUJyYWdhMR4wHAYDVQQKExVVbml2ZXJzaWRhZGUgZG8gTWluaG8xJDAi
BgNVBAsTG0RlcGFydGFtZW50byBkZSBJbmZvcm1hdGljYTEYMBYGA1UEAxMPY2EuZGkudW1p
bmhvLnB0MSEwHwYJKoZIhvcNAQkBFhJhZG1pbkBkaS51bWluaG8ucHQwHhcNMDQwMjE4MTM0
MDUwWhcNMDkwODEyMTM0MDUwWjCBujELMAkGA1UEBhMCUFQxDjAMBgNVBAgTBU1pbmhvMQ4w
DAYDVQQHEwVCcmFnYTEeMBwGA1UEChMVVW5pdmVyc2lkYWRlIGRvIE1pbmhvMSQwIgYDVQQL
ExtEZXBhcnRhbWVudG8gZGUgSW5mb3JtYXRpY2ExIzAhBgNVBAMUGkpvc8OpIEx1w61zIE9s
aXZlaXJhIEZhcmlhMSAwHgYJKoZIhvcNAQkBFhFqb3NlQGRpLnVtaW5oby5wdDCBnzANBgkq
hkiG9w0BAQEFAAOBjQAwgYkCgYEA2H9OzAtDcTuRqsi0uNNEAFa6ZiP1a4Ze8Uz3am4fXU8L
FCz5VQ40YScuc9s9F9AYF5trxmEzKxoM6bFyDzfHnuqgjT35nDSSu0SR6+fFyJvtlK6WkzY9
tySkPs7K9lt+d3R+LNpDpShuAe8VFnQDD3zSCzMRjR8z6uO2lv0Gg9kCAwEAATANBgkqhkiG
9w0BAQQFAAOBgQCx3AJnb/y3+YGbzoZginjo9ZVpJ4x78bSg5mekcrE9EGjTjlWL21/3hsZ3
0clqExeemqMs+nIAa/d1rvKCmVfkwV3KrwGWABwYTyakUCpL3JLb+iZ+VVszE36pfEAdBNJS
RrHJ897zWOC46ywVpYYcxj3x3nfPFrvhyfTE3c3zwjCCAtswggJEAgErMA0GCSqGSIb3DQEB
BAUAMIGwMQswCQYDVQQGEwJQVDEOMAwGA1UECBMFTWluaG8xDjAMBgNVBAcTBUJyYWdhMR4w
HAYDVQQKExVVbml2ZXJzaWRhZGUgZG8gTWluaG8xJDAiBgNVBAsTG0RlcGFydGFtZW50byBk
ZSBJbmZvcm1hdGljYTEYMBYGA1UEAxMPY2EuZGkudW1pbmhvLnB0MSEwHwYJKoZIhvcNAQkB
FhJhZG1pbkBkaS51bWluaG8ucHQwHhcNMDQwMjE4MTM0MDUwWhcNMDkwODEyMTM0MDUwWjCB
ujELMAkGA1UEBhMCUFQxDjAMBgNVBAgTBU1pbmhvMQ4wDAYDVQQHEwVCcmFnYTEeMBwGA1UE
ChMVVW5pdmVyc2lkYWRlIGRvIE1pbmhvMSQwIgYDVQQLExtEZXBhcnRhbWVudG8gZGUgSW5m
b3JtYXRpY2ExIzAhBgNVBAMUGkpvc8OpIEx1w61zIE9saXZlaXJhIEZhcmlhMSAwHgYJKoZI
hvcNAQkBFhFqb3NlQGRpLnVtaW5oby5wdDCBnzANBgkqhkiG9w0BAQEFAAOBjQAwgYkCgYEA
2H9OzAtDcTuRqsi0uNNEAFa6ZiP1a4Ze8Uz3am4fXU8LFCz5VQ40YScuc9s9F9AYF5trxmEz
KxoM6bFyDzfHnuqgjT35nDSSu0SR6+fFyJvtlK6WkzY9tySkPs7K9lt+d3R+LNpDpShuAe8V
FnQDD3zSCzMRjR8z6uO2lv0Gg9kCAwEAATANBgkqhkiG9w0BAQQFAAOBgQCx3AJnb/y3+YGb
zoZginjo9ZVpJ4x78bSg5mekcrE9EGjTjlWL21/3hsZ30clqExeemqMs+nIAa/d1rvKCmVfk
wV3KrwGWABwYTyakUCpL3JLb+iZ+VVszE36pfEAdBNJSRrHJ897zWOC46ywVpYYcxj3x3nfP
FrvhyfTE3c3zwjGCA6gwggOkAgEBMIG2MIGwMQswCQYDVQQGEwJQVDEOMAwGA1UECBMFTWlu
aG8xDjAMBgNVBAcTBUJyYWdhMR4wHAYDVQQKExVVbml2ZXJzaWRhZGUgZG8gTWluaG8xJDAi
BgNVBAsTG0RlcGFydGFtZW50byBkZSBJbmZvcm1hdGljYTEYMBYGA1UEAxMPY2EuZGkudW1p
bmhvLnB0MSEwHwYJKoZIhvcNAQkBFhJhZG1pbkBkaS51bWluaG8ucHQCASswCQYFKw4DAhoF
AKCCAkcwGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMDQwNDE2
MTAyMDE0WjAjBgkqhkiG9w0BCQQxFgQU1F0NHd1qmIPphySjg4JdQ+8RQ2kwUgYJKoZIhvcN
AQkPMUUwQzAKBggqhkiG9w0DBzAOBggqhkiG9w0DAgICAIAwDQYIKoZIhvcNAwICAUAwBwYF
Kw4DAgcwDQYIKoZIhvcNAwICASgwgccGCSsGAQQBgjcQBDGBuTCBtjCBsDELMAkGA1UEBhMC
UFQxDjAMBgNVBAgTBU1pbmhvMQ4wDAYDVQQHEwVCcmFnYTEeMBwGA1UEChMVVW5pdmVyc2lk
YWRlIGRvIE1pbmhvMSQwIgYDVQQLExtEZXBhcnRhbWVudG8gZGUgSW5mb3JtYXRpY2ExGDAW
BgNVBAMTD2NhLmRpLnVtaW5oby5wdDEhMB8GCSqGSIb3DQEJARYSYWRtaW5AZGkudW1pbmhv
LnB0AgErMIHJBgsqhkiG9w0BCRACCzGBuaCBtjCBsDELMAkGA1UEBhMCUFQxDjAMBgNVBAgT
BU1pbmhvMQ4wDAYDVQQHEwVCcmFnYTEeMBwGA1UEChMVVW5pdmVyc2lkYWRlIGRvIE1pbmhv
MSQwIgYDVQQLExtEZXBhcnRhbWVudG8gZGUgSW5mb3JtYXRpY2ExGDAWBgNVBAMTD2NhLmRp
LnVtaW5oby5wdDEhMB8GCSqGSIb3DQEJARYSYWRtaW5AZGkudW1pbmhvLnB0AgErMA0GCSqG
SIb3DQEBAQUABIGAjJdJZRxn51nOUZG2kLKHuUgA+Gx7RPWLSRmm4AwD9kBIexndLZga60AM
6KkaLufP5Yfv39FZ5/TdgEhIC0bwpcOS2z0YyCcdkI0T89AXLk+Y+UYErX5mNCzrJKGt69E/
OqWIWT52sj4Ic71aA5iPmsxvJA9wdMNqAXw+iVi1ZtUAAAAAAAA=
--------------ms080206070405040101050009--

