From: Jose Luis Faria <jose@di.uminho.pt>
Subject: forward for some IPs and SNAT the rest
Date: Tue, 16 Mar 2004 15:58:46 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40572436.9080308@di.uminho.pt>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature"; micalg=sha1; boundary="------------ms030503020302070506080009"
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

--------------ms030503020302070506080009
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

I have a firewall inside my organization, but I want to preserve some 
source IPs,
and the rest must be SNATed:


host 1 - 192.168.0.1 ------------\
                                  \
                                   \ +--------------+
                                    \|  firewall    | 193.137.1.1 (ex.)    
host 2 - 192.168.0.2 ----------------|  with        |---------------> 
internet
                                    /|  iptables    |       |
                                   / +--------------+       |
                                  /  /                      | internal
host 3 - 192.168.0.3 ------------/  /                       |  routing
                                   /                        |
                                  /                         v
host 4 - 192.168.0.4 ------------/                        license server

the host 1 and host 2 must arrive to the license server with the original IP( 192.168.0.1/2) and the others host must be translated with SNAT into 193.137.1.1.


some help?


P.S: Now every hosts use the SNAT for all, but I want to exclude some of them.
-- 

   :)  cumprimentos
------------------------------------
         Jose Luis Faria
         Universidade do Minho
   /\    Escola de Engenharia
  /\/\   Departamento Informatica
         http://www.di.uminho.pt/~jose


--------------ms030503020302070506080009
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
AKCCAkcwGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMDQwMzE2
MTU1ODQ2WjAjBgkqhkiG9w0BCQQxFgQUAJtTIg24dz9k94M2EoAZuQJP+QgwUgYJKoZIhvcN
AQkPMUUwQzAKBggqhkiG9w0DBzAOBggqhkiG9w0DAgICAIAwDQYIKoZIhvcNAwICAUAwBwYF
Kw4DAgcwDQYIKoZIhvcNAwICASgwgccGCSsGAQQBgjcQBDGBuTCBtjCBsDELMAkGA1UEBhMC
UFQxDjAMBgNVBAgTBU1pbmhvMQ4wDAYDVQQHEwVCcmFnYTEeMBwGA1UEChMVVW5pdmVyc2lk
YWRlIGRvIE1pbmhvMSQwIgYDVQQLExtEZXBhcnRhbWVudG8gZGUgSW5mb3JtYXRpY2ExGDAW
BgNVBAMTD2NhLmRpLnVtaW5oby5wdDEhMB8GCSqGSIb3DQEJARYSYWRtaW5AZGkudW1pbmhv
LnB0AgErMIHJBgsqhkiG9w0BCRACCzGBuaCBtjCBsDELMAkGA1UEBhMCUFQxDjAMBgNVBAgT
BU1pbmhvMQ4wDAYDVQQHEwVCcmFnYTEeMBwGA1UEChMVVW5pdmVyc2lkYWRlIGRvIE1pbmhv
MSQwIgYDVQQLExtEZXBhcnRhbWVudG8gZGUgSW5mb3JtYXRpY2ExGDAWBgNVBAMTD2NhLmRp
LnVtaW5oby5wdDEhMB8GCSqGSIb3DQEJARYSYWRtaW5AZGkudW1pbmhvLnB0AgErMA0GCSqG
SIb3DQEBAQUABIGACgrgPMWnlvbbr7zJkufdG6NOArmkJsYj4mZ5aVoE0Zw3OwNTU5zUkXSP
WHR3eAzYM/AwUqElMqCNWQM+Rr+yKNMg3LQ5wnWZCHvsXZkMEpk+hX/KOQg+rfuC4Kb8JfMF
NPsXj6Cfxbzx2QYH7GAHXLrLNqnmMjvoCYYDht7EedUAAAAAAAA=
--------------ms030503020302070506080009--

