From: "Steven Mugassa" <steven.mugassa@intafrica.com>
Subject: problem with proxy-arp
Date: Wed, 11 Jun 2003 15:44:10 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <NHBBIEHHKBHELDDLACFGCEAGCOAA.steven.mugassa@intafrica.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_0000_01C33030.4D014C40"
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
To: Netfilter <netfilter@lists.netfilter.org>

This is a multi-part message in MIME format.

------=_NextPart_000_0000_01C33030.4D014C40
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

Hello everyone,

I have the following network setup:

machine A<---->RouterA<---CIPE VPN--->RouterB<--->MachineB

machineA & Router A are in LAN A and machine B & router B are in LAN B

-Router A has interfaces eth0,eth1 and vpn interface 'cipcb0'
-Router B also has eth0,eth1, and cipcb0
-Gateway of machine A is cipcb0
-Gateway of machine B is not any interface in Router B

machine A wants to access machine B, so i have decided to use proxy-arp
approach by reserving one IP address in range of LANB to use for proxy-arp
in the Router B.
The idea is that when a packet from A reaches Router B, it is SNATed to that
reserved IP address (call it 10.10.10.10)
So machine B will receive the packet as if it coming from 10.10.10.10( in
LAN B=10.10.10.0/24)
When machine B replies, its arp request broadcast will be answered by Router
B (with proxy-arp entry /sbin/arp -i eth1 -Ds 10.10.10.10 eth1 pub).

However, the situation is that when i do the tcpdump on Router B, i observe
the following
12:02:56.227511 10.10.10.10 > 10.10.10.5: icmp: echo request (DF)
12:02:56.227649 arp who-has 10.10.10.10 tell 10.10.10.5
12:02:57.226258 10.10.10.10 > 10.10.10.5: icmp: echo request (DF)
12:02:57.226399 arp who-has 10.10.10.10 tell 10.10.10.5
12:02:58.227317 10.10.10.10 > 10.10.10.5: icmp: echo request (DF)
12:02:58.227452 arp who-has 10.10.10.10 tell 10.10.10.5

where machine B = 10.10.10.5

According to this tcpdump i suspect that my proxy-arp configurations are not
working i.e. routerB doesn't accept arp request for 10.10.10.10.
Where can be the problem then? What i know is that for proxy-arp i only have
to execute one line "/sbin/arp -i eth1 -Ds 10.10.10.10 eth1 pub". Is there
some more commands i should do? Or is the vpn interface (cipcb0) causing the
problems?

Please advice,

Thanks,
Steven


------=_NextPart_000_0000_01C33030.4D014C40
Content-Type: application/ms-tnef;
	name="winmail.dat"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
	filename="winmail.dat"

eJ8+IgoMAQaQCAAEAAAAAAABAAEAAQeQBgAIAAAA5AQAAAAAAADoAAEIgAcAGAAAAElQTS5NaWNy
b3NvZnQgTWFpbC5Ob3RlADEIAQ2ABAACAAAAAgACAAEGgAMADgAAANMHBgALAA4AOQAAAAMANQEB
A5AGAEAIAAAiAAAACwACAAEAAAALACMAAAAAAAMAJgAAAAAACwApAAAAAAADADYAAAAAAB4AcAAB
AAAAFwAAAHByb2JsZW0gd2l0aCBwcm94eS1hcnAAAAIBcQABAAAAFgAAAAHDMBCqyCRKGw6b+BHX
hJYAArNQu2QAAAIBHQwBAAAAIgAAAFNNVFA6U1RFVkVOLk1VR0FTU0FASU5UQUZSSUNBLkNPTQAA
AAsAAQ4AAAAAQAAGDgAOmJAQMMMBAgEKDgEAAAAYAAAAAAAAAKF2AGu5MtcRhHcAArNQu2TCgAAA
CwAfDgEAAAACAQkQAQAAAHUEAABxBAAAMQgAAExaRnX/BaQUAwAKAHJjcGcxMjUWMgD4C2BuDhAw
MzNPAfcCpAPjAgBjaArAc7BldDAgBxMCgH0KgZJ2CJB3awuAZDQMYA5jAFALAwu1IEhlbFEJACBl
dgSQeQIgZc4sCqIKhAqASSAQ8BRA+CB0aBXQAhAT8QPwDyCSIBSQdHcFsGsgESHYdXA6FMoAwWgL
gBXQKEE8LRkRPggAdXQDBJAY80NJUEUgVpRQThkoQhkCPk0YhMZCF78UkEEgJgfxGYIdEWAgCsAV
0AuAIExB1k4d4hKAIBh2Qh1RA2DvHaMfoB4ZHAstHYcQ8AQgOwuAGZFmANAHkREwaDDKLCOBMR7T
dnADoCLXCCAnYwUgY2IwJ3MhnCBRbHMUECKSI4csJx7TJVQhlUdhGZB3YfB5IG9mHxcdQAQAKD/n
KU4foCphbm8FQABwKXD/JKgeUSY2HB8qEylQAjAEIP50FBAA0CNBBCAfJyfgJuF2aRWUBYFpAQAf
ADBxdYkRICBwA2B4eS0KwJpwHgBwM1EYgSBiKXC7CXARIHISIBahFIEgGiD5HgBkZDSxIrIf0A8R
FdD/KZEegR+gMuUCEAXAM1geUWsV8iY2LhTEVBYBMpFh/ypSFfArcDAAFgADoDpwCrD8Y2sRMBYg
A2Ed4QlwGIE3B5EmNifgaQVAKmFTTnxBVDK0OsM0tDKxNZkoXmMHQAMgPYEPQC5Apin9FMRTFBAf
KAPwQEEJcCNAfmkVxTuFIqIpoD2BBaBtVxaSO/NAqSggpz1ApzDoLzI0QVVXOyIfKAlwewtQCJBz
PWIEIDOyCXBx1QpQcwVAYjQhZEAgSlHtQpNiFdAAcXcEkDKxNIG9JjcoA/AV8DNJCfB0FGBQIC9z
YguALzOyLXMx8CPTLUQEIECpTxRw2HViKTmVFMRIFnAUMt8n4BXyAJAXcCtwaQIgOowdMfBkPmIV
0Q3wZHVt7zPQUxE86SmAYj7zFewUxAkOIDowV9A1Ni4ysDI3NTEkAE+6PkCYdDU6HkBjVPBaQAWQ
aGMUEEoGKERGQVVXyjbMNDlJszsQby0ikk+6rxmQQEFZqFvbN1hBNg4wnjhYv1nPWt9fvzM5XR8X
Xi9fP1gBOFhCMzE372D/Yg9jH2f/NA5AZW9mf99nihTEOxEeIR8oPW9/FMT2QTCwBbBkFpI+UzqS
VLV1MfBzMxBwBZAFQDrDbYcpcDNYBaBuZmlnCHA/UuNJohXQLOIXAhaSaS48ZS4f1R+gVDAHkG4n
/y0BMLEFMUnKN8JAqTmVSAF/HiFAIAOgS3FDYwNgAmBl4zwgFfFuPyBIADrhMfC+ayzgB+A6ljfN
NUFsKXD7FaQUEXgFkBmBNUNJIBjBriJOX09vUHYieOBJOqL/cQIm4AeAHxAFsHzRA3ADgc5kIrEX
QGtgdWwfAFQw/X5gTwXAOpMV0CRsQBAlY54pfOEzEHPDfXhzPxTK7lB94CKgS4FkEiAjQBS7+zoA
AHBrSVBBZRmQFEALkAsU2RHhAJAAAAAACwAAgAggBgAAAAAAwAAAAAAAAEYAAAAAA4UAAAAAAAAD
AAKACCAGAAAAAADAAAAAAAAARgAAAAAQhQAAAAAAAAMAB4AIIAYAAAAAAMAAAAAAAABGAAAAAFKF
AABzeQEAHgAJgAggBgAAAAAAwAAAAAAAAEYAAAAAVIUAAAEAAAAEAAAAOS4wAAsADYAIIAYAAAAA
AMAAAAAAAABGAAAAAIKFAAABAAAACwARgAggBgAAAAAAwAAAAAAAAEYAAAAABoUAAAAAAAADABKA
CCAGAAAAAADAAAAAAAAARgAAAAABhQAAAAAAAAsAG4AIIAYAAAAAAMAAAAAAAABGAAAAAA6FAAAA
AAAAAwAcgAggBgAAAAAAwAAAAAAAAEYAAAAAEYUAAAAAAAADAB6ACCAGAAAAAADAAAAAAAAARgAA
AAAYhQAAAAAAAAIB+A8BAAAAEAAAAKF2AGu5MtcRhHcAArNQu2QCAfoPAQAAABAAAAChdgBruTLX
EYR3AAKzULtkAgH7DwEAAABfAAAAAAAAADihuxAF5RAaobsIACsqVsIAAFBTVFBSWC5ETEwAAAAA
AAAAAE5JVEH5v7gBAKoAN9luAAAARjpcc3RldmVuLm11Z2Fzc2FcTWFpbGJveFxtYWlsYm94LnBz
dAAAAwD+DwUAAAADAA00/TcAAAIBfwABAAAAPAAAADxOSEJCSUVISEtCSEVMRERMQUNGR0NFQUdD
T0FBLnN0ZXZlbi5tdWdhc3NhQGludGFmcmljYS5jb20+AAMABhANIILLAwAHEJAFAAADABAQAAAA
AAMAERAAAAAAHgAIEAEAAABlAAAASEVMTE9FVkVSWU9ORSxJSEFWRVRIRUZPTExPV0lOR05FVFdP
UktTRVRVUDpNQUNISU5FQTwtLS0tUk9VVEVSQTwtLS1DSVBFVlBOLS0tUk9VVEVSQjwtLS1NQUNI
SU5FQk1BQwAAAAAhHQ==

------=_NextPart_000_0000_01C33030.4D014C40--


