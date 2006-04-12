From: "Isaiah Makwakwa" <isaiah@medcol.mw>
Subject: RE: IP masquerade + squid problem
Date: Wed, 12 Apr 2006 10:33:11 +0200 (CAT)
Message-ID: <2853.192.168.2.224.1144830791.squirrel@mail2.medcol.mw>
References: <51851.192.168.2.7.1144653554.squirrel@mail2.medcol.mw>
	<000c01c65cce$ad299640$0101000a@sterenborg.info>
Reply-To: isaiah@medcol.mw
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="----=_20060412103311_66283"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <000c01c65cce$ad299640$0101000a@sterenborg.info>
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
To: rob@sterenborg.info
Cc: netfilter@lists.netfilter.org

------=_20060412103311_66283
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit

Hie Rob et al,

Sorry that I could be dumping my whole file to the list but here is my
iptables script.

Everything else works apart from the fact that at first I could not access
my external website also on the same machine and squid could not be
accessible. I solved the external website by configuring view in my DNS
but it seems there is no easy way for the squid box.

Regards,

Isaiah.


>> Dear list,
>>
>> I have a problem with my squid + ip masquerading setup. My box has two
>> interfaces one internal one external. I masquerade all internal
> traffic
>> on this box which also runs squid proxy.
>>
>> When my iptables runs, and I point my client to the proxy on this box
>> I do not seem to get anywhere even though the squid box accepts and
>> logs a request.
>
> So your INPUT rules seem to be fine for your LAN.
>
>> When I go direct I can get the page.
>>
>> My gut feeling is that the squid box does get the request,
>> processses but due to some nating problem fails to identify the client
>> which made the request. Could anyone help to arrest the rot?
>
> Well, you could start by adding iptables LOG rules to see what happens.
> - Does squid actually try to perform the request (try a tcpdump or
> something) ?
> - Is the request getting through your (OUTPUT) rules (hence the logging)
> ?
> - Is the reply being allowed ?
> - What have you looked at / what have you tried ?
> - Maybe some rules we need to look at ?
>
> If you don't have any logging yet, add a rule to the bottom of your
> OUTPUT ruleset saying something like :
> $ipt -A OUTPUT -m limit --limit 1/sec -j LOG --log-prefix "_ipt_OUTPUT:
> "
> and see if it's logging http requests from squid. If it is and your
> OUTPUT policy is DROP, the requests are most likely not getting out of
> your box.
> But since you didn't tell much about your setup and what you tried,
> that's only a wild guess.
>
>
> Gr,
> Rob


-- 
Linux System/Network Administrator,
College of Medicine,
P/Bag 360,
Chichiri,
Blantyre 3.


------=_20060412103311_66283
Content-Type: application/octet-stream; name="iptables"
Content-Disposition: attachment; filename="iptables"
Content-Transfer-Encoding: base64

RVhUSUY9ImV0aDAiCkVYVElQPSIxMC4xMC4wLjEiCkVYVE5FVD0iMTAuMTAuMC4wLzI4IgpJTlRJ
Rj0iZXRoMSIKSU5UTkVUPSIxOTIuMTY4LjIuMC8yNCIKSU5USVA9IjE5Mi4xNjguMi4zIgpJUFRB
QkxFUz0iL3NiaW4vaXB0YWJsZXMiCldPUkxEPSIwLjAuMC4wLzAiCgoKIyBGbHVzaCBhbGwgcnVs
ZXMKJElQVEFCTEVTIC1BIElOUFVUIC1qIERST1AKJElQVEFCTEVTIC1BIE9VVFBVVCAtaiBEUk9Q
CiRJUFRBQkxFUyAtQSBGT1JXQVJEIC1qIERST1AKCiMgRGVjbGFyZSBDdXN0b20gQ2hhaW5zCiRJ
UFRBQkxFUyAtTiBsb2NhbAokSVBUQUJMRVMgLU4gZXh0CiRJUFRBQkxFUyAtTiBsb2NhbC1md2QK
JElQVEFCTEVTIC1OIGV4dC1md2QKCiMkSVBUQUJMRVMgLXQgbmF0IC1BIFBSRVJPVVRJTkcgLWkg
JElOVElGIC1wIHRjcCAtLWRwb3J0IDMxMjggLWogQUNDRVBUCiMkSVBUQUJMRVMgLXQgbmF0IC1B
IFBSRVJPVVRJTkcgLWkgJElOVElGIC1wIHRjcCAtLWRwb3J0IDMwMzMgLWogQUNDRVBUCgojIENy
ZWF0ZSBJTlBVVCBjaGFpbiB0YXJnZXRzCiRJUFRBQkxFUyAtQSBJTlBVVCAtbSBzdGF0ZSAtLXN0
YXRlIFJFTEFURUQsRVNUQUJMSVNIRUQgLWogQUNDRVBUCiRJUFRBQkxFUyAtQSBJTlBVVCAtaSAk
SU5USUYgLWogbG9jYWwKJElQVEFCTEVTIC1BIElOUFVUIC1zIDEyNy4wLjAuMSAtaiBsb2NhbAok
SVBUQUJMRVMgLUEgSU5QVVQgLWkgJEVYVElGIC1qIGV4dAokSVBUQUJMRVMgLUEgSU5QVVQgLWog
RFJPUAoKIyBDcmVhdGUgRk9SV0FSRCBjaGFpbiB0YXJnZXRzCiRJUFRBQkxFUyAtQSBGT1JXQVJE
IC1tIHN0YXRlIC0tc3RhdGUgUkVMQVRFRCxFU1RBQkxJU0hFRCAtaiBBQ0NFUFQKJElQVEFCTEVT
IC1BIEZPUldBUkQgLW8gJEVYVElGIC1qIGxvY2FsLWZ3ZAokSVBUQUJMRVMgLUEgRk9SV0FSRCAt
cyAxMjcuMC4wLjEgLWogbG9jYWwtZndkCiRJUFRBQkxFUyAtQSBGT1JXQVJEIC1qIERST1AKCiMg
RW5hYmxlIHBvcnRzCgojMS4gV2ViCiRJUFRBQkxFUyAtQSBsb2NhbCAtcCB0Y3AgLS1kcG9ydCA4
MCAtaiBBQ0NFUFQKJElQVEFCTEVTIC1BIGxvY2FsIC1wIHRjcCAtLWRwb3J0IDQ0MyAtaiBBQ0NF
UFQKJElQVEFCTEVTIC1BIGV4dCAtcCB0Y3AgLS1kcG9ydCA4MCAtaiBBQ0NFUFQKJElQVEFCTEVT
IC1BIGV4dCAtcCB0Y3AgLS1kcG9ydCA0NDMgLWogQUNDRVBUCgojMi4gRlRQCiRJUFRBQkxFUyAt
QSBsb2NhbCAtcCB0Y3AgLS1kcG9ydCAyMSAtaiBBQ0NFUFQKJElQVEFCTEVTIC1BIGV4dCAtcCB0
Y3AgLS1kcG9ydCAyMSAtaiBBQ0NFUFQKCiMzLiBTU0gKJElQVEFCTEVTIC1BIGxvY2FsIC1wIHRj
cCAtLWRwb3J0IDIyIC1qIEFDQ0VQVAoKIzQuIEROUwokSVBUQUJMRVMgLUEgbG9jYWwgLXAgdGNw
IC0tZHBvcnQgNTMgLWogQUNDRVBUCiRJUFRBQkxFUyAtQSBsb2NhbCAtcCB1ZHAgLS1kcG9ydCA1
MyAtaiBBQ0NFUFQKJElQVEFCTEVTIC1BIGV4dCAtcCB0Y3AgLS1kcG9ydCA1MyAtaiBBQ0NFUFQK
JElQVEFCTEVTIC1BIGV4dCAtcCB1ZHAgLS1kcG9ydCA1MyAtaiBBQ0NFUFQKCgojNS4gV2ViIFBy
b3h5CiRJUFRBQkxFUyAtQSBsb2NhbCAtcCB0Y3AgLS1kcG9ydCAzMTI4IC1qIEFDQ0VQVAokSVBU
QUJMRVMgLUEgbG9jYWwgLXAgdGNwIC0tZHBvcnQgMzAzMyAtaiBBQ0NFUFQKJElQVEFCTEVTIC1B
IGxvY2FsIC1wIHRjcCAtLWRwb3J0IDgwODAgLWogQUNDRVBUCgojNS4gSUNNUAokSVBUQUJMRVMg
LUEgbG9jYWwgLXAgaWNtcCAtaiBBQ0NFUFQKCiMgQWxsb3cgT1VUUFVUIGZyb20gbG9jYWwgTWFj
aGluZSAmIGxvY2FsIG5ldAokSVBUQUJMRVMgLUEgT1VUUFVUIC1tIHN0YXRlIC0tc3RhdGUgRVNU
QUJMSVNIRUQsUkVMQVRFRCAtaiBBQ0NFUFQKJElQVEFCTEVTIC1BIE9VVFBVVCAtcCBBTEwgLWQg
MTI3LjAuMC4xIC1qIEFDQ0VQVAokSVBUQUJMRVMgLUEgT1VUUFVUIC1wIEFMTCAtbyAkSU5USUYg
LWogQUNDRVBUCiRJUFRBQkxFUyAtQSBPVVRQVVQgLXAgQUxMIC1vICRFWFRJRiAtaiBBQ0NFUFQK
CgojIEVuYWJsZSBsb2NhbC1pbnRlcm5ldCBmb3J3YXJkaW5nCiRJUFRBQkxFUyAtQSBsb2NhbC1m
d2QgLXAgdGNwIC0tZHBvcnQgMTEwIC1qIEFDQ0VQVAokSVBUQUJMRVMgLUEgbG9jYWwtZndkIC1w
IHRjcCAtLWRwb3J0IDgwIC1qIEFDQ0VQVAokSVBUQUJMRVMgLUEgbG9jYWwtZndkIC1wIHRjcCAt
LWRwb3J0IDIxIC1qIEFDQ0VQVAokSVBUQUJMRVMgLUEgbG9jYWwtZndkIC1wIHRjcCAtLWRwb3J0
IDUzIC1qIEFDQ0VQVAokSVBUQUJMRVMgLUEgbG9jYWwtZndkIC1wIHRjcCAtLWRwb3J0IDQ0MyAt
aiBBQ0NFUFQKJElQVEFCTEVTIC1BIGxvY2FsLWZ3ZCAtcCB1ZHAgLS1kcG9ydCA1MyAtaiBBQ0NF
UFQKCgoKIyBOb3cgd2UgbWFzcXVlcmFkZSB0aGUgc3R1ZmYgd2UgYWxsb3cKJElQVEFCTEVTIC10
IG5hdCAtQSBQT1NUUk9VVElORyAtbyAkRVhUSUYgLWogTUFTUVVFUkFERQoKCiMgRFJPUCBBTEwg
T1RIRVIgVFJBRkZJQwokSVBUQUJMRVMgLUEgbG9jYWwgLWogRFJPUAokSVBUQUJMRVMgLUEgZXh0
IC1qIERST1AKCiMgUmVtb3ZlIHRoZSBjb21wbGV0ZSBibG9ja3MKJElQVEFCTEVTIC1EIElOUFVU
IDEKJElQVEFCTEVTIC1EIE9VVFBVVCAxCiRJUFRBQkxFUyAtRCBGT1JXQVJEIDEKCiMgRW5hYmxl
IElQLUZvcndhcmRpbmcKZWNobyAxID4gL3Byb2Mvc3lzL25ldC9pcHY0L2lwX2ZvcndhcmQK

------=_20060412103311_66283--


