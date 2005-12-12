From: Svenne Krap <svenne@krap.dk>
Subject: Re: Very wierd problem
Date: Mon, 12 Dec 2005 20:20:37 +0100
Message-ID: <439DCD85.6020800@krap.dk>
References: <FAC4E024BF776842876169173CE2F01313B4AC@mailbox.vikus.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
	micalg=sha1; boundary="------------ms000702080909000405090300"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <FAC4E024BF776842876169173CE2F01313B4AC@mailbox.vikus.com>
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
To: Derick Anderson <danderson@vikus.com>
Cc: netfilter@lists.netfilter.org

This is a cryptographically signed message in MIME format.

--------------ms000702080909000405090300
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi again.

Well you intuition wasn't far off. After an uncanny amount of hours of 
testing different things, I found the solution. (I did learn that for 
the next time, tcpdump has the first try to find the problem ;)

It seems like the firewall in front of the customer (or perhaps his 
computer/application) sets the "dont fragment" bit on the packages (I 
believe that is fairly uncommon?). The package arrives fine at my 
firewall, but as there are VLANs behind the firewall, the MTU of 1500 is 
four bytes too long to continue past the firewall. Normally, the package 
would be fragmented by my firewall (as I understand it) and served.
Unfortunately, the DF-flag prevents this, so my firewall bails out with 
an ICMP type 3 message subtype 4 (unreachable - need to frag). This 
message seems to get lost at the firewall  in front of my customer (of 
which he has no control). So his application waits for an acceptance of 
the package which my firewall dropped due to being too big.

The problem has been verified by setting the MTU to 1496 on his 
computer, after which everything runs flawlessy.

I must admit, that I am not that strong within MTU discovery and ICMP 
messages (the above is based on what I have read to day and found out by 
tcpdump).

Here is the relevant piece of tcpdump (81.7.170.138 is my firewall, 
81.7.185.77 is a temp IP used for debugging his server (oh, the joy of 
DNAT ;) and 80.63.34.250 is my clients ip:

14:26:45.691261 IP 80.63.34.250.2831 > 81.7.185.77.22: . 5460:5672(212) ack 305 win 64671

14:26:45.691333 IP 80.63.34.250.2831 > 81.7.185.77.22: P 6588:7100(512) ack 305 win 64671

14:26:45.691386 IP 81.7.185.77.22 > 80.63.34.250.2831: . ack 6588 win 12040 <nop,nop,sack sack 1 {7432:11100} >

14:26:45.691480 IP 81.7.185.77.22 > 80.63.34.250.2831: . ack 7100 win 12800 <nop,nop,sack sack 1 {7432:11100} >

14:26:45.692357 IP 80.63.34.250.2831 > 81.7.185.77.22: P 11100:12560(1460) ack 305 win 64671

14:26:45.692368 IP 81.7.170.138 > 80.63.34.250: icmp 556: 81.7.185.77 unreachable - need to frag (mtu 1496)

14:26:45.692471 IP 80.63.34.250.2831 > 81.7.185.77.22: P 12560:13920(1360) ack 305 win 64671

14:26:45.692711 IP 81.7.185.77.22 > 80.63.34.250.2831: . ack 7100 win 12800 <nop,nop,sack sack 2 {12560:13920}{7432:11100} >

14:26:45.695955 IP 80.63.34.250.2831 > 81.7.185.77.22: P 13920:15380(1460) ack 305 win 64671

14:26:45.695965 IP 81.7.170.138 > 80.63.34.250: icmp 556: 81.7.185.77 unreachable - need to frag (mtu 1496)

14:26:46.047387 IP 80.63.34.250.2831 > 81.7.185.77.22: P 7100:8560(1460) ack 305 win 64671

14:26:46.047401 IP 81.7.170.138 > 80.63.34.250: icmp 556: 81.7.185.77 unreachable - need to frag (mtu 1496)

14:26:46.812538 IP 80.63.34.250.2831 > 81.7.185.77.22: P 7100:8560(1460) ack 305 win 64671

14:26:46.812552 IP 81.7.170.138 > 80.63.34.250: icmp 556: 81.7.185.77 unreachable - need to frag (mtu 1496)

14:26:48.125581 IP 80.63.34.250.2831 > 81.7.185.77.22: P 7100:8560(1460) ack 305 win 64671

14:26:48.125592 IP 81.7.170.138 > 80.63.34.250: icmp 556: 81.7.185.77 unreachable - need to frag (mtu 1496)

14:26:50.641188 IP 80.63.34.250.2831 > 81.7.185.77.22: P 7100:8560(1460) ack 305 win 64671

14:26:50.641201 IP 81.7.170.138 > 80.63.34.250: icmp 556: 81.7.185.77 unreachable - need to frag (mtu 1496)

14:26:55.563161 IP 80.63.34.250.2831 > 81.7.185.77.22: P 7100:8560(1460) ack 305 win 64671

14:26:55.563174 IP 81.7.170.138 > 80.63.34.250: icmp 556: 81.7.185.77 unreachable - need to frag (mtu 1496)

The customer offered his NOC my number so that I could tell what I found 
out, but he declined as "my network is running fine!".

So I am very interested in knowing :
- whether or not you agree with me, that this is a problem of the 
firewall in front of the customer (as opposed to a flaw my setup)?
- this could be a potential problem for other people (my mtu of 1496 
instead of 1500) ?
- if it is his firewall, can I stille use the TCPMSS extension to 
corretct this problem, and if so, how ?

Thanks in advance

Svenne

Derick Anderson wrote:

>Inline.
>
>  
>
>>-----Original Message-----
>>From: netfilter-bounces@lists.netfilter.org 
>>[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of 
>>Svenne Krap
>>Sent: Saturday, December 10, 2005 8:23 AM
>>To: netfilter@lists.netfilter.org
>>Subject: Very wierd problem
>>
>>Hi.
>>
>>I have quite a problem.
>>
>>One of my customer is suddently unable to upload data to his 
>>machine (neither via SFTP/SCP nor regular FTP nor HTTP) 
>>behind my firewall. I believe it is due to something changed 
>>on the network he is connected to (as I have not changed 
>>anything during that period). He has no problems downloading 
>>data, but when uploading the upload stalls after 4kb of transfer.
>>What is even worse, I cannot recreate the problem from 
>>anywhere I have tried (>5 different ISP's).
>>    
>>
>
>I interpret this to mean that the problem is with a particular customer
>on a particular ISP - your other customers can upload just fine. The
>fact that data can be downloaded (but not uploaded) is very strange.
>
>[snip]
>
>  
>
>>This has worked flawlessy for half a year or so. But 
>>suddently it stop working.
>>The customer's upstream provider blames my firewall. An 
>>interesting point is that the customer CAN upload to the 
>>firewall itself by scp through it's /29 adress (it has no /26).
>>But as said, I have not changed anything in the way the 
>>firewall works around when the problem arose, and any attempt 
>>to recreate it has been a failure.
>>    
>>
>
>Of course they blame your firewall. Did they give a reason? I assume
>when you attempt to recreate the problem you are uploading to the
>customer's server on your network and it works fine, and that your other
>customers are not having problems with similar rulesets.
>
>If you haven't changed anything, I would recommend not messing with your
>firewall. My first urge when there is a problem is to check everything
>and start changing things which "don't look right". However if there is
>a system which is the same now as it was when things were working then I
>stifle that urge and look elsewhere. Maybe there's something with the
>client's internal server or settings on the VLAN switch... Verify your
>settings but don't go changing them without a good reason. If you do
>find something odd change one thing at a time and then test - otherwise
>you'll never know exactly what the problem was.
>
>  
>
>>I have tried to log packets both in the filter tables and the 
>>prerouting chain of the nat filter (before doing the nat). 
>>But nothing really catches my eyes.
>>
>>Any suggestions to what could be the problem ? Or how I could 
>>zero in on it ? What to log and so on?
>>
>>I am not really keen on publishing the firewall script, but I 
>>will send it to helpful individuals by email on request.
>>
>>Thanks in advance
>>
>>Svenne
>>
>>    
>>
>
>I would set up ethereal on your firewall and monitor both sides of a
>transfer from this client. See who sends the last packet before the
>connection is dropped. Since this problem appears to be protocol
>independent, I would pay close attention to the TCP connections, but I
>would also be curious about HTTP and FTP since they are cleartext and
>may have some additional information about what might be going on
>(timeouts, etc.).
>
>Derick Anderson
>
>  
>


--------------ms000702080909000405090300
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
hvcNAQkFMQ8XDTA1MTIxMjE5MjAzN1owIwYJKoZIhvcNAQkEMRYEFC7785yjzuLU7SSxjbux
f+t/N0oSMEgGCSsGAQQBgjcQBDE7MDkwMTELMAkGA1UEBhMCREsxDDAKBgNVBAoTA1REQzEU
MBIGA1UEAxMLVERDIE9DRVMgQ0ECBD/KpecwSgYLKoZIhvcNAQkQAgsxO6A5MDExCzAJBgNV
BAYTAkRLMQwwCgYDVQQKEwNUREMxFDASBgNVBAMTC1REQyBPQ0VTIENBAgQ/yqXnMFIGCSqG
SIb3DQEJDzFFMEMwCgYIKoZIhvcNAwcwDgYIKoZIhvcNAwICAgCAMA0GCCqGSIb3DQMCAgFA
MAcGBSsOAwIHMA0GCCqGSIb3DQMCAgEoMA0GCSqGSIb3DQEBAQUABIGAAw/aqvaW4n9QhjCk
SDUU8jQdxUcq9BpsId90phA1USM3hhqqn1nJyEavdtXobF4ukUfMcG/i2cC15Mx6NKwGx0D5
5oGdmx426R5+UG+ro3O25grkRGxGKadtArT5zgEmw/j5FQxAEM4Qq2bKITlAnLuQZGXzD1TM
rURhqzIqxsUAAAAAAAA=
--------------ms000702080909000405090300--

