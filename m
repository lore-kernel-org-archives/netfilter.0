From: "Kleiner, Peter" <kleinerp@smbmicro.com>
Subject: RE: YAPFQ (Yet Another Port forwarding Question)
Date: Thu, 4 Dec 2003 17:48:42 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FDAFEC98D318F74CA26B5A26F2B4965227C5E2@exchange.jfctechnologies.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----_=_NextPart_000_01C3BAB8.C3E8AB60"
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
To: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_000_01C3BAB8.C3E8AB60
Content-Type: text/plain

> 1. Is the firewall that you're configuring the default route for the
> IMAP server?
No.

> If it isn't, then you have to SNAT the initial connection to the IMAP
> server.
You nailed it!!!!  Tried that, and it worked instantly.  Now that you 
suggested it, it makes perfect sense that the packets were coming into
the IMAP server with the public IP address and it (the server) was 
replying to that ip address via its default route, which is other than
the new gateway.  Thank you thank you thank you!!!!!

> 2. It probably isn't such a good habbit to use MASQ so liberally. You
> should make sure to tie it to an interface. It is a good habbit to get
> into especially when you have many-many-many homed machines.
I have a much more extensive firewall script that I use, which locks 
things down much more tightly. I just wanted to get the port forwarding
issue figured out before I lock the sucker down.

Did I thank you yet?  Thanks!!!!!!  I've spent hours trying to figure 
this out, including switching (needlessly) from RH9 to Slackware. I'm so
silly.....

PK

------_=_NextPart_000_01C3BAB8.C3E8AB60
Content-Type: application/ms-tnef
Content-Transfer-Encoding: base64

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
PVVTO2E9IDtwPUpGQyBUZWNobm9sb2dpZXM7bD1FWENIQU5HRS0wMzEyMDQyMjQ4NDJaLTIzMwAA
AAACAfk/AQAAAFQAAAAAAAAA3KdAyMBCEBq0uQgAKy/hggEAAAAAAAAAL089SkFNRSBGSU5FIENI
RU1JQ0FMUy9PVT1KRkMvQ049UkVDSVBJRU5UUy9DTj1LTEVJTkVSUAAeAPg/AQAAAA8AAABLbGVp
bmVyLCBQZXRlcgAAHgA4QAEAAAAJAAAAS0xFSU5FUlAAAAAAAgH7PwEAAABUAAAAAAAAANynQMjA
QhAatLkIACsv4YIBAAAAAAAAAC9PPUpBTUUgRklORSBDSEVNSUNBTFMvT1U9SkZDL0NOPVJFQ0lQ
SUVOVFMvQ049S0xFSU5FUlAAHgD6PwEAAAAPAAAAS2xlaW5lciwgUGV0ZXIAAB4AOUABAAAACQAA
AEtMRUlORVJQAAAAAEAABzDRieHDuLrDAUAACDDtOBHEuLrDAR4APQABAAAABQAAAFJFOiAAAAAA
HgAdDgEAAAAtAAAAWUFQRlEgKFlldCBBbm90aGVyIFBvcnQgZm9yd2FyZGluZyBRdWVzdGlvbikA
AAAAHgA1EAEAAABGAAAAPEZEQUZFQzk4RDMxOEY3NENBMjZCNUEyNkYyQjQ5NjUyMjdDNUUyQGV4
Y2hhbmdlLmpmY3RlY2hub2xvZ2llcy5jb20+AAAACwApAAAAAAALACMAAAAAAAMABhC9Ym6lAwAH
EDADAAADABAQAQAAAAMAERAAAAAAHgAIEAEAAABlAAAAMUlTVEhFRklSRVdBTExUSEFUWU9VUkVD
T05GSUdVUklOR1RIRURFRkFVTFRST1VURUZPUlRIRUlNQVBTRVJWRVI/Tk9JRklUSVNOVCxUSEVO
WU9VSEFWRVRPU05BVFRIRUlOSQAAAAACAX8AAQAAAEYAAAA8RkRBRkVDOThEMzE4Rjc0Q0EyNkI1
QTI2RjJCNDk2NTIyN0M1RTJAZXhjaGFuZ2UuamZjdGVjaG5vbG9naWVzLmNvbT4AAACzOw==

------_=_NextPart_000_01C3BAB8.C3E8AB60--

