From: Kelly Shutt <tetrahedron@hardon.truncatedtetrahedron.com>
Subject: rc.firewall script
Date: Mon, 10 Nov 2003 18:24:38 -0600 (CST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.53.0311101822110.1446@hardon.truncatedtetrahedron.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323328-1598651233-1068510278=:1446"
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
To: netfilter@lists.netfilter.org.

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.
  Send mail to mime@docserver.cac.washington.edu for more info.

--8323328-1598651233-1068510278=:1446
Content-Type: TEXT/PLAIN; charset=US-ASCII

Can someone look over my rc script.  I'm relatively new to iptables, so I
just want to make sure I'm not doing something that's just totally insane.
Any input on this would be nice, I'm still trying to figure out exactly
how secure i want to get with this.

Thanks,
Kelly Shutt
--8323328-1598651233-1068510278=:1446
Content-Type: TEXT/PLAIN; charset=US-ASCII; name="rc.firewall"
Content-Transfer-Encoding: BASE64
Content-ID: <Pine.LNX.4.53.0311101824380.1446@hardon.truncatedtetrahedron.com>
Content-Description: 
Content-Disposition: attachment; filename="rc.firewall"

IyMhL2Jpbi9zaA0KZWNobyAtZSAiLSByYy5maXJld2FsbCBydWxlc2V0IC0i
DQojSVBUQUJMRVM9L3NiaW4vaXB0YWJsZXMNCklQVEFCTEVTPS91c3Ivc2Jp
bi9pcHRhYmxlcw0KDQoNCmVjaG8gIlZlcmlmeWluZyB0aGF0IGFsbCBrZXJu
ZWwgbW9kdWxlcyBhcmUgb2siDQovc2Jpbi9kZXBtb2QgLWENCg0KDQojL3Ni
aW4vaW5zbW9kIGlwX25hdF9mdHANCiMvc2Jpbi9pbnNtb2QgaXBfY29ubnRy
YWNrX2Z0cA0KDQoNCmVjaG8gIkVuYWJsaW5nIHBhY2tldCBmb3J3YXJkaW5n
IGluIHRoZSBrZXJuZWwiDQplY2hvICIxIiA+IC9wcm9jL3N5cy9uZXQvaXB2
NC9pcF9mb3J3YXJkDQoNCg0KZWNobyAiRW5hYmxpbmcgZHluYW1pYyBhZGRy
ZXNzaW5nIG1lYXN1cmVzIg0KZWNobyAiMSIgPiAvcHJvYy9zeXMvbmV0L2lw
djQvaXBfZHluYWRkcg0KDQoNCmVjaG8gIkZsdXNoaW5nIG9sZCBJUCBUYWJs
ZXMiDQokSVBUQUJMRVMgLUYNCiRJUFRBQkxFUyAtWA0KDQoNCmVjaG8gIlNl
dHRpbmcgdGhlIElOUFVUIHBvbGljaWVzIg0KJElQVEFCTEVTIC1QIElOUFVU
IFJFSkVDVA0KZWNobyAiICAtU2V0dGluZyB0Y3AgcGFja2V0IHBvbGljaWVz
Ig0KJElQVEFCTEVTIC1BIElOUFVUIC1wIHRjcCAtLWRwb3J0IDIxIC1qIEFD
Q0VQVAkJI2Z0cA0KJElQVEFCTEVTIC1BIElOUFVUIC1wIHRjcCAtLWRwb3J0
IDIyIC1qIEFDQ0VQVAkJI3NzaA0KJElQVEFCTEVTIC1BIElOUFVUIC1wIHRj
cCAtLWRwb3J0IDI1IC1qIEFDQ0VQVAkJI3NtdHANCiRJUFRBQkxFUyAtQSBJ
TlBVVCAtcCB0Y3AgLS1kcG9ydCAzNyAtaiBBQ0NFUFQJCSN0aW1lDQokSVBU
QUJMRVMgLUEgSU5QVVQgLXAgdGNwIC0tZHBvcnQgNTMgLWogQUNDRVBUCQkj
ZG9tYWluDQokSVBUQUJMRVMgLUEgSU5QVVQgLXAgdGNwIC0tZHBvcnQgODAg
LWogQUNDRVBUCQkjaHR0cA0KJElQVEFCTEVTIC1BIElOUFVUIC1wIHRjcCAt
LWRwb3J0IDExMyAtaiBBQ0NFUFQJCSNhdXRoDQokSVBUQUJMRVMgLUEgSU5Q
VVQgLXAgdGNwIC0tZHBvcnQgMzMzMyAtaiBBQ0NFUFQJI2VnZ2Ryb3ANCmVj
aG8gIiAgLVNldHRpbmcgaWNtcCBwYWNrZXQgcG9saWNpZXMiDQokSVBUQUJM
RVMgLUEgSU5QVVQgLXAgaWNtcCAtLWljbXAtdHlwZSA4IC1qIEFDQ0VQVAkj
ZWNobw0KJElQVEFCTEVTIC1BIElOUFVUIC1wIGljbXAgLS1pY21wLXR5cGUg
MTEgLWogQUNDRVBUCSN0aW1lIGV4dGVuZA0KZWNobyAiICAtU2V0dGluZyB1
ZHAgcGFja2V0IHBvbGljaWVzIg0KJElQVEFCTEVTIC1BIElOUFVUIC1wIHVk
cCAtLWRwb3J0IDUzIC1qIEFDQ0VQVAkJI2RvbWFpbg0KJElQVEFCTEVTIC1B
IElOUFVUIC1wIHVkcCAtaSBldGgxIC0tZHBvcnQgNjcgLS1zcG9ydCA2OCAt
aiBBQ0NFUFQJI2RoY3AgcmVxdWVzdHMNCg0KDQplY2hvICJTZXR0aW5nIHRo
ZSBPVVRQVVQgcG9saWNpZXMiDQokSVBUQUJMRVMgLVAgT1VUUFVUIEFDQ0VQ
VA0KDQoNCmVjaG8gIlNldHRpbmcgdGhlIEZPUldBUkQgcG9saWNpZXMiDQok
SVBUQUJMRVMgLVAgRk9SV0FSRCBBQ0NFUFQNCiRJUFRBQkxFUyAtdCBuYXQg
LUEgUFJFUk9VVElORyAtcCB0Y3AgLS1kcG9ydCAzMzg5IC1pIGV0aDAgLWog
RE5BVCAtLXRvLWRlc3RpbmF0aW9uIDE5Mi4xNjguMC4yLTE5Mi4xNjguMC4x
MDANCg0KDQplY2hvICJFbmFibGluZyBTTkFUIChJUE1BU1EpIGZ1bmN0aW9u
YWxpdHkgb24gZXRoMCINCiRJUFRBQkxFUyAtdCBuYXQgLUEgUE9TVFJPVVRJ
TkcgLW8gZXRoMCAtaiBNQVNRVUVSQURFDQoNCg0KZWNobyAtZSAiXG5Eb25l
LlxuIg0K

--8323328-1598651233-1068510278=:1446--

