From: Svenne Krap <svenne@krap.dk>
Subject: Very wierd problem
Date: Sat, 10 Dec 2005 14:22:49 +0100
Message-ID: <439AD6A9.3050208@krap.dk>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
	micalg=sha1; boundary="------------ms080407030902060200010808"
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
To: netfilter@lists.netfilter.org

This is a cryptographically signed message in MIME format.

--------------ms080407030902060200010808
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi.

I have quite a problem.

One of my customer is suddently unable to upload data to his machine 
(neither via SFTP/SCP nor regular FTP nor HTTP) behind my firewall. I 
believe it is due to something changed on the network he is connected to 
(as I have not changed anything during that period). He has no problems 
downloading data, but when uploading the upload stalls after 4kb of 
transfer.
What is even worse, I cannot recreate the problem from anywhere I have 
tried (>5 different ISP's).

The setup is like this:

In front of my network is a small (/29) network. The bigger (/26) 
"production" network is routed through one of the addresses on  the /29 
network (made by the upstream provider).
On this address, the firewall sits. My upstream is tripple-homed, I have 
no idea about the customers upstream.

I use iptables is version 1.3.4 (installed through Gentoo's portage) and 
a vanilla (not Gentoo enhanced) Linux 2.6.14.2.

The way it works, netfilter basicly rewrites the "known" public ip's 
from the /26 network to some private (192.168.x.y) addresses where X is 
a customer key and Y is the machine number for this customer.
The traffic is also filtered against machine specfic rules on what to 
allow initiating new connections from the outside (SSH, HTTP and so on) 
and connection tracking is taking care of the rest (ESTABLISHED/RELATED).
All this trafic leaves by one physical interface through multiple VLANS 
to a VLAN aware switch and to the final destination.

This has worked flawlessy for half a year or so. But suddently it stop 
working.
The customer's upstream provider blames my firewall. An interesting 
point is that the customer CAN upload to the firewall itself by scp 
through it's /29 adress (it has no /26).
But as said, I have not changed anything in the way the firewall works 
around when the problem arose, and any attempt to recreate it has been a 
failure.

I have tried to log packets both in the filter tables and the prerouting 
chain of the nat filter (before doing the nat). But nothing really 
catches my eyes.

Any suggestions to what could be the problem ? Or how I could zero in on 
it ? What to log and so on?

I am not really keen on publishing the firewall script, but I will send 
it to helpful individuals by email on request.

Thanks in advance

Svenne

--------------ms080407030902060200010808
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIKTjCC
BSMwggQLoAMCAQICBD/KpecwDQYJKoZIhvcNAQEFBQAwMTELMAkGA1UEBhMCREsxDDAKBgNV
BAoTA1REQzEUMBIGA1UEAxMLVERDIE9DRVMgQ0EwHhcNMDUwMjIzMTMxMTMwWhcNMDcwMjIz
MTM0MTMwWjBzMQswCQYDVQQGEwJESzEpMCcGA1UEChMgSW5nZW4gb3JnYW5pc2F0b3Jpc2sg
dGlsa255dG5pbmcxOTASBgNVBAMTC1N2ZW5uZSBLcmFwMCMGA1UEBRMcUElEOjk4MDItMjAw
Mi0yLTk3OTMxMTk0MjAyNzCBnzANBgkqhkiG9w0BAQEFAAOBjQAwgYkCgYEApF423aqlHV/8
RiX5vX5QezMEXKixU6KUSUQOfERsFgahaUn5LobNfxB31+5nKVH3EJfK/UpcE4Alfsa87+hX
MBRzaAv5jbwh57NFSNcmFD/wgcIYupvyWhASacjcBnBfiqNuDBVIT7wL42yijfM3LSVjJOPw
/c5R5wwFfKqjKzMCAwEAAaOCAoMwggJ/MA4GA1UdDwEB/wQEAwID+DArBgNVHRAEJDAigA8y
MDA1MDIyMzEzMTEzMFqBDzIwMDcwMjIzMTM0MTMwWjCCATcGA1UdIASCAS4wggEqMIIBJgYK
KoFQgSkBAQEBAjCCARYwLwYIKwYBBQUHAgEWI2h0dHA6Ly93d3cuY2VydGlmaWthdC5kay9y
ZXBvc2l0b3J5MIHiBggrBgEFBQcCAjCB1TAKFgNUREMwAwIBARqBxkZvciBhbnZlbmRlbHNl
IGFmIGNlcnRpZmlrYXRldCBn5mxkZXIgT0NFUyB2aWxr5XIsIENQUyBvZyBPQ0VTIENQLCBk
ZXIga2FuIGhlbnRlcyBmcmEgd3d3LmNlcnRpZmlrYXQuZGsvcmVwb3NpdG9yeS4gQmVt5nJr
LCBhdCBUREMgZWZ0ZXIgdmlsa+VyZW5lIGhhciBldCBiZWdy5m5zZXQgYW5zdmFyIGlmdC4g
cHJvZmVzc2lvbmVsbGUgcGFydGVyLjAZBgNVHREEEjAQgQ5zdmVubmVAa3JhcC5kazCBgwYD
VR0fBHwwejBKoEigRqREMEIxCzAJBgNVBAYTAkRLMQwwCgYDVQQKEwNUREMxFDASBgNVBAMT
C1REQyBPQ0VTIENBMQ8wDQYDVQQDEwZDUkw1NjgwLKAqoCiGJmh0dHA6Ly9jcmwub2Nlcy5j
ZXJ0aWZpa2F0LmRrL29jZXMuY3JsMB8GA1UdIwQYMBaAFGC1hexWZH4SGSdnHVAVS3OuO/kS
MB0GA1UdDgQWBBTmRrmEbRpZf+Pt0S/qphnyMgKoRzAJBgNVHRMEAjAAMBkGCSqGSIb2fQdB
AAQMMAobBFY3LjEDAgOoMA0GCSqGSIb3DQEBBQUAA4IBAQBgfOEd/VkXc6lFNItNvhgrbPc3
eNcGE7l6sbaG1gYLREn4xmmYajtP90INRG3OlNm3ZlVeYxaMbzQKVlcrKMEwA7cMZIMcT97t
KjXabwqCc/0jNCPceO/ZPoUc7T3fuF7B1QjJelzXsoK4av2lDDgaAJL8WiExsGYmJ0BwfNLZ
YjLRwJ+Db4gsmvjTFazbkRtzqqqAzjy2WC6L4WEuS6EUmDhdX/ZFdq0bT58lx++DKo+TuDu3
bkIi46l6yV5lI4CgBRTmahRyyCuUMjDUiLvgX1m3Ys/U5c88MDgwrKtLcXy7TyCEazOLVC5z
vAgKvNjbdSQjkFZEDiA/oVtwGNH6MIIFIzCCBAugAwIBAgIEP8ql5zANBgkqhkiG9w0BAQUF
ADAxMQswCQYDVQQGEwJESzEMMAoGA1UEChMDVERDMRQwEgYDVQQDEwtUREMgT0NFUyBDQTAe
Fw0wNTAyMjMxMzExMzBaFw0wNzAyMjMxMzQxMzBaMHMxCzAJBgNVBAYTAkRLMSkwJwYDVQQK
EyBJbmdlbiBvcmdhbmlzYXRvcmlzayB0aWxrbnl0bmluZzE5MBIGA1UEAxMLU3Zlbm5lIEty
YXAwIwYDVQQFExxQSUQ6OTgwMi0yMDAyLTItOTc5MzExOTQyMDI3MIGfMA0GCSqGSIb3DQEB
AQUAA4GNADCBiQKBgQCkXjbdqqUdX/xGJfm9flB7MwRcqLFTopRJRA58RGwWBqFpSfkuhs1/
EHfX7mcpUfcQl8r9SlwTgCV+xrzv6FcwFHNoC/mNvCHns0VI1yYUP/CBwhi6m/JaEBJpyNwG
cF+Ko24MFUhPvAvjbKKN8zctJWMk4/D9zlHnDAV8qqMrMwIDAQABo4ICgzCCAn8wDgYDVR0P
AQH/BAQDAgP4MCsGA1UdEAQkMCKADzIwMDUwMjIzMTMxMTMwWoEPMjAwNzAyMjMxMzQxMzBa
MIIBNwYDVR0gBIIBLjCCASowggEmBgoqgVCBKQEBAQECMIIBFjAvBggrBgEFBQcCARYjaHR0
cDovL3d3dy5jZXJ0aWZpa2F0LmRrL3JlcG9zaXRvcnkwgeIGCCsGAQUFBwICMIHVMAoWA1RE
QzADAgEBGoHGRm9yIGFudmVuZGVsc2UgYWYgY2VydGlmaWthdGV0IGfmbGRlciBPQ0VTIHZp
bGvlciwgQ1BTIG9nIE9DRVMgQ1AsIGRlciBrYW4gaGVudGVzIGZyYSB3d3cuY2VydGlmaWth
dC5kay9yZXBvc2l0b3J5LiBCZW3mcmssIGF0IFREQyBlZnRlciB2aWxr5XJlbmUgaGFyIGV0
IGJlZ3LmbnNldCBhbnN2YXIgaWZ0LiBwcm9mZXNzaW9uZWxsZSBwYXJ0ZXIuMBkGA1UdEQQS
MBCBDnN2ZW5uZUBrcmFwLmRrMIGDBgNVHR8EfDB6MEqgSKBGpEQwQjELMAkGA1UEBhMCREsx
DDAKBgNVBAoTA1REQzEUMBIGA1UEAxMLVERDIE9DRVMgQ0ExDzANBgNVBAMTBkNSTDU2ODAs
oCqgKIYmaHR0cDovL2NybC5vY2VzLmNlcnRpZmlrYXQuZGsvb2Nlcy5jcmwwHwYDVR0jBBgw
FoAUYLWF7FZkfhIZJ2cdUBVLc647+RIwHQYDVR0OBBYEFOZGuYRtGll/4+3RL+qmGfIyAqhH
MAkGA1UdEwQCMAAwGQYJKoZIhvZ9B0EABAwwChsEVjcuMQMCA6gwDQYJKoZIhvcNAQEFBQAD
ggEBAGB84R39WRdzqUU0i02+GCts9zd41wYTuXqxtobWBgtESfjGaZhqO0/3Qg1Ebc6U2bdm
VV5jFoxvNApWVysowTADtwxkgxxP3u0qNdpvCoJz/SM0I9x479k+hRztPd+4XsHVCMl6XNey
grhq/aUMOBoAkvxaITGwZiYnQHB80tliMtHAn4NviCya+NMVrNuRG3OqqoDOPLZYLovhYS5L
oRSYOF1f9kV2rRtPnyXH74Mqj5O4O7duQiLjqXrJXmUjgKAFFOZqFHLIK5QyMNSIu+BfWbdi
z9TlzzwwODCsq0txfLtPIIRrM4tULnO8CAq82Nt1JCOQVkQOID+hW3AY0foxggIqMIICJgIB
ATA5MDExCzAJBgNVBAYTAkRLMQwwCgYDVQQKEwNUREMxFDASBgNVBAMTC1REQyBPQ0VTIENB
AgQ/yqXnMAkGBSsOAwIaBQCgggFHMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZI
hvcNAQkFMQ8XDTA1MTIxMDEzMjI0OVowIwYJKoZIhvcNAQkEMRYEFKVbLUABLgPnwSI4daa9
R/sqAmlhMEgGCSsGAQQBgjcQBDE7MDkwMTELMAkGA1UEBhMCREsxDDAKBgNVBAoTA1REQzEU
MBIGA1UEAxMLVERDIE9DRVMgQ0ECBD/KpecwSgYLKoZIhvcNAQkQAgsxO6A5MDExCzAJBgNV
BAYTAkRLMQwwCgYDVQQKEwNUREMxFDASBgNVBAMTC1REQyBPQ0VTIENBAgQ/yqXnMFIGCSqG
SIb3DQEJDzFFMEMwCgYIKoZIhvcNAwcwDgYIKoZIhvcNAwICAgCAMA0GCCqGSIb3DQMCAgFA
MAcGBSsOAwIHMA0GCCqGSIb3DQMCAgEoMA0GCSqGSIb3DQEBAQUABIGASnySR2nDyykhC9+6
6uQaIVIdzgicLHqtNZG2g/cjC/4P8aNgfGSgjA+m0ch9yhdgd6NlcRUTE9Ey1UlSsZVpU76b
RKVULatdaKjj3G/yzqKLi0IEDRlQjcrnkuxB73MzpuOkJO9nUF4a2BDY0pLDH5lmcQDxIcyy
1hB+gFtjjIYAAAAAAAA=
--------------ms080407030902060200010808--

