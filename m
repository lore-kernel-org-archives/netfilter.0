From: "Kevin Smith" <ksmith@perfht.com>
Subject: Cuseeme-Nat
Date: Thu, 17 Apr 2003 09:20:34 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <NGBBLGFEALDADHNDAAFFMEHJDJAA.ksmith@perfht.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_0000_01C304C2.9A12DD80"
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

This is a multi-part message in MIME format.

------=_NextPart_000_0000_01C304C2.9A12DD80
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

Listers, 


Well I upgraded my Kernel to 2.4.20 and patched cuseeme-nat and the other
required file to it (Patch-o-matic says verifies this). But I still get the
same problem with some reflectors, where they read the machine IP and refuse
to let me in. 
I did however get curious error while compiling: 
::
 gcc -D__KERNEL__ -I/usr/src/linux-2.4.20/include -Wall -Wstrict-prototypes
-
Wno-trigraphs -O2 -fno-strict-aliasing -fno-common -fomit-frame-pointer -pip
e -mpreferred-stack-boundary=2 -march=i586   -nostdinc -iwithprefix
include -DKBUILD_BASENAME=ip_nat_core  -c -o ip_nat_core.o ip_nat_core.c
gcc -D__KERNEL__ -I/usr/src/linux-2.4.20/include -Wall -Wstrict-prototypes -
Wno-trigraphs -O2 -fno-strict-aliasing -fno-common -fomit-frame-pointer -pip
e -mpreferred-stack-boundary=2 -march=i586   -nostdinc -iwithprefix
include -DKBUILD_BASENAME=ip_nat_helper  -c -o ip_nat_helper.o
ip_nat_helper.c
ip_nat_helper.c: In function `ip_nat_resize_packet':
ip_nat_helper.c:87: warning: unused variable `data'               <--------
This one

::

Might this cause the patch to malfunction? If so, since Im new to all this
patching/compiling stuff, can someone point me in the right direction to
correct this? Ive been compiling for about a week now so Id liekto NOT have
to do that again, but If I must. 

Thanks,

Kev

------=_NextPart_000_0000_01C304C2.9A12DD80
Content-Type: application/ms-tnef;
	name="winmail.dat"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
	filename="winmail.dat"

eJ8+IiINAQaQCAAEAAAAAAABAAEAAQeQBgAIAAAA5AQAAAAAAADoAAEIgAcAGAAAAElQTS5NaWNy
b3NvZnQgTWFpbC5Ob3RlADEIAQ2ABAACAAAAAgACAAEGgAMADgAAANMHBAARAAkAFAAAAAQAEAEB
A5AGADwIAAAlAAAACwACAAEAAAALACMAAAAAAAMAJgAAAAAACwApAAAAAAADADYAAAAAAB4AcAAB
AAAADAAAAEN1c2VlbWUtTmF0AAIBcQABAAAAFgAAAAHDBOQgOUvrfQBwsxHXtmIAoMnZ2UsAAAIB
HQwBAAAAFwAAAFNNVFA6S1NNSVRIQFBFUkZIVC5DT00AAAsAAQ4AAAAAQAAGDgCALwzkBMMBAgEK
DgEAAAAYAAAAAAAAAAuQ/grZHtYRtlQAoMnZ2UvCgAAACwAfDgEAAAACAQkQAQAAAPgDAAD0AwAA
TQYAAExaRnVaJqHkAwAKAHJjcGcxMjUWMgD4C2BuDhAwMzNPAfcCpAPjAgBjaArAc/BldDAgBxMC
gwBQBFWvEMkIVQeyAoB9CoF2CJCkd2sLgGQ0DGBjAFBTCwMLtSBMBAB0BJBzjiwK4wqEFuZXZWwD
IEhJIHUOAHJhAQBkYCBteSBLBJEX0CCAdG8gMi40LhXhNwBwGKAKsHQQ4BiRY3VlESBlB4AtbhpQ
GfN0ORqAIG8bwQXACXBxdXJpCXEgZgMQG+AZYWmJBUAoUBpSLW8tAMBCdA3gIHNheQQgdh8GcgiQ
BCAbwAQAKS4gfEJ1BUAYEBYwAxADIGf/ETAbsx6QB4AaMANgAmAbAP4gA/AbwB6AA3Ab4AlwDvD3
BZAZYBZidxwhHSEagBjQfwlwGHAbswDBH4AZIBgAUP8Z8yKRGtEZUh0QBUAhQQuAJx/AFqQYEGRp
GKBob/x3ZR7hIJMawAUQCGAEID8EkANgBcAjUB0CBaBtcJMDEAuAZzoWlTo6FqgrGKADMTEgkGMe
cC1EAF9fS0VSTkVMkywwLABJLxrQci8tIERjLynhdXgtGZQv3QuAYwpAAQAsAFcHQAMgby7gFjAF
ECLgLSFxGWB01HlwB5EtF2VuHhAvcckYUXBoMGFPMiwAAvD/HhAvZQdABzAAkA8gMgQpkf8EYAOg
MhADcB1wMhAYYBsRvHBvC4AWQSwAKcBwFqR/LsEpsCKRKNEJgDJRANBrmi0G4HUUwArAeT0x8QMA
wC1gaD1pNTg2fytwLAAxABYwJ1AucCwAaTMh8jZSaXgWpC5nREsQQlVJTCwgQkFTIEVOQU1FOGBw
X/0bQV8FoRvgLAAr8R1RPFj+Lj1cAOAWsyvfLO8t/y8P/zAfMS8yPzNPNF81bzZ/N4/fOJ85rzq/
O80agGxD8AXA/z0MUGQ+IE31UVs/FVKdKiC+SQOgJaBCIB5QR6FgPEXjCXAAkHplXwqwStARMKYn
KrVT7jg3KiB3CsDfAwAqAksgGtEYoHYKwAcwbyGhVaBLQAGQJ0xhWro88i1btSBUH4Eb8BkgFq6t
FXIgKqoKgE1FAGggwvlcYWNhJbMb0RpDGVIAwOpsVSY/GABmIjEWgEbB/mMk8SHQGSAH4BlhQrJf
U9saQynxLymXIDF1ASAWgP9foAOgIkJckRowSLImVBuz/0TxXyEnUAlwVVQZYQWhZ4LnH2NhgR7g
IGIJ4SmIHOC/BbEBoAhgG2Eh4Anga2KQfyegIjEYABigKeBrIBlhTrRPVCeAYWkhGWFkGXDbG8Ab
UmcLcRaAYh/yYbD1GBBtGtB0JrYWpFxAAHBuaxZwFqoY8HYWpBQhAAFxwAsAAYAIIAYAAAAAAMAA
AAAAAABGAAAAAAOFAAAAAAAAAwADgAggBgAAAAAAwAAAAAAAAEYAAAAAEIUAAAAAAAADAAeACCAG
AAAAAADAAAAAAAAARgAAAABShQAAJ2oBAB4ACYAIIAYAAAAAAMAAAAAAAABGAAAAAFSFAAABAAAA
BAAAADkuMAAeAAqACCAGAAAAAADAAAAAAAAARgAAAAA2hQAAAQAAAAEAAAAAAAAAHgALgAggBgAA
AAAAwAAAAAAAAEYAAAAAN4UAAAEAAAABAAAAAAAAAB4ADIAIIAYAAAAAAMAAAAAAAABGAAAAADiF
AAABAAAAAQAAAAAAAAALAA2ACCAGAAAAAADAAAAAAAAARgAAAACChQAAAQAAAAsAOoAIIAYAAAAA
AMAAAAAAAABGAAAAAA6FAAAAAAAAAwA8gAggBgAAAAAAwAAAAAAAAEYAAAAAEYUAAAAAAAADAD2A
CCAGAAAAAADAAAAAAAAARgAAAAAYhQAAAAAAAAsAUoAIIAYAAAAAAMAAAAAAAABGAAAAAAaFAAAA
AAAAAwBTgAggBgAAAAAAwAAAAAAAAEYAAAAAAYUAAAAAAAACAfgPAQAAABAAAAALkP4K2R7WEbZU
AKDJ2dlLAgH6DwEAAAAQAAAAC5D+Ctke1hG2VACgydnZSwIB+w8BAAAAggAAAAAAAAA4obsQBeUQ
GqG7CAArKlbCAABQU1RQUlguRExMAAAAAAAAAABOSVRB+b+4AQCqADfZbgAAAEM6XFdJTkRPV1Nc
TG9jYWwgU2V0dGluZ3NcQXBwbGljYXRpb24gRGF0YVxNaWNyb3NvZnRcT3V0bG9va1xvdXRsb29r
LnBzdAAAAAMA/g8FAAAAAwANNP03AAACAX8AAQAAADEAAAA8TkdCQkxHRkVBTERBREhOREFBRkZN
RUhKREpBQS5rc21pdGhAcGVyZmh0LmNvbT4AAAAAAwAGEItHqngDAAcQNQQAAAMAEBAAAAAAAwAR
EAAAAAAeAAgQAQAAAGUAAABMSVNURVJTLFdFTExJVVBHUkFERURNWUtFUk5FTFRPMjQyMEFORFBB
VENIRURDVVNFRU1FLU5BVEFORFRIRU9USEVSUkVRVUlSRURGSUxFVE9JVChQQVRDSC1PLU1BVElD
U0FZAAAAABL8

------=_NextPart_000_0000_01C304C2.9A12DD80--


