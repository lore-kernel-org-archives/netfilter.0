From: "Kevin Smith" <ksmith@perfht.com>
Subject: Modprobe .
Date: Wed, 23 Apr 2003 09:14:47 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <NGBBLGFEALDADHNDAAFFGEIKDJAA.ksmith@perfht.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_0000_01C30978.C96B8C20"
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

------=_NextPart_000_0000_01C30978.C96B8C20
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

I recently patched my kernel and all went well with POM. After I recompiled
it and rebooted, I didn't see the module on lsmod, so I tried insmod which
responded with and "module not found" error. 
I looked in the /lib/modules and saw the module was not compiled. (.c file)
when the other patch was compiled ok. (.o) file. 
What would cause a patch not to compile? I checked the source and saw the
#include lines and all the files are where is suggest it should be, though
running gcc (lack of anything better to do) responds with file or directory
not found errors. Is there a PATH that needs to be set up to get this
working? 
I am using RH 7.2 Kernel 2.4.20,  IPTables 2.2.7a, the module is
ip_nat_cuseeme.c.

Kev

------=_NextPart_000_0000_01C30978.C96B8C20
Content-Type: application/ms-tnef;
	name="winmail.dat"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
	filename="winmail.dat"

eJ8+Ii8NAQaQCAAEAAAAAAABAAEAAQeQBgAIAAAA5AQAAAAAAADoAAEIgAcAGAAAAElQTS5NaWNy
b3NvZnQgTWFpbC5Ob3RlADEIAQ2ABAACAAAAAgACAAEGgAMADgAAANMHBAAXAAkADgAAAAMADwEB
A5AGANwGAAAlAAAACwACAAEAAAALACMAAAAAAAMAJgAAAAAACwApAAAAAAADADYAAAAAAB4AcAAB
AAAACwAAAE1vZHByb2JlIC4AAAIBcQABAAAAFgAAAAHDCZpP7RfiKiB1ahHXtmMAoMnZ2UsAAAIB
HQwBAAAAFwAAAFNNVFA6S1NNSVRIQFBFUkZIVC5DT00AAAsAAQ4AAAAAQAAGDgBcFjSaCcMBAgEK
DgEAAAAYAAAAAAAAAAuQ/grZHtYRtlQAoMnZ2UvCgAAACwAfDgEAAAACAQkQAQAAAJcCAACTAgAA
XAMAAExaRnUy28mXAwAKAHJjcGcxMjUWMgD4C2BuDhAwMzNPAfcCpAPjAgBjaArAc7BldDAgBxMC
gH0KgZJ2CJB3awuAZDQMYI5jAFALAwu1IEkgCXBCYwnwdGx5IAqwdFMQ4AmAIG0UYGsEkWXfAyAA
cBTgB0ADIHcUIRYRARXyaXRoIFBPTb4uEWABgASQE8QDcHADEF8U0RbQFZMJcAbgbxeAZIIsE8Fk
aWRuJwVAuREgZSAW4BpQBGF1GFBiIAIgIGxzBGEZgHP6bxPBdAiBGHEAgARhFhDOaA3gFvAJcHNw
AiABAFccwRbSFaIiGrVuGUAgZQIQdRKAIiAEkANgct8XQAqiCoAT0AkAbxUwHFLBGmMvbGliLxq0
BCCZFaJzYQfgGnl3YQQgxx7yGAYXQCguYx8gGEH+KRzRCfAaYxlAFMAFwBSD7yNjGAcgsCRybyUQ
JNIf9i5XEPAWUQhgbBTgY2HedREgFZAmFR7ydBvQGAX2PxPBFLFjIMIachvACHDrFBAiOyMLgGMK
QAEAG0D/C4AiFRXiGnIk0iIhCXAlIscvYQQAGiB1Z2cHkAVAyRiRc2gpA2JlGYAW4D0IYGcdIR9Q
AwAPICBnumMksCgLYCuAGxBmFZF+eRbgMjIxQAJAF5EqcWT/J7EdRQQgFsMk0hsQBcAZwLsT8Spw
chRgHvcflHMXQA5JBCAl0imSUEFUSP8aYSjBFWAJgDfhG9AxQBoh+QVAdXAqYjBQKlEc8DUhmwWw
EmFnKxAgFmFtOhALAJAyQVI4sDcuMiCiSxVEMi40PPAwGYB5E8BQVAGgIgI9kD2QN55hMWIaly/x
BSBfbhSQtF9jKXFlB4AkoC4gFFsgFD0gdiAUEeEAQrAACwABgAggBgAAAAAAwAAAAAAAAEYAAAAA
A4UAAAAAAAADAAOACCAGAAAAAADAAAAAAAAARgAAAAAQhQAAAAAAAAMAB4AIIAYAAAAAAMAAAAAA
AABGAAAAAFKFAAAnagEAHgAJgAggBgAAAAAAwAAAAAAAAEYAAAAAVIUAAAEAAAAEAAAAOS4wAB4A
CoAIIAYAAAAAAMAAAAAAAABGAAAAADaFAAABAAAAAQAAAAAAAAAeAAuACCAGAAAAAADAAAAAAAAA
RgAAAAA3hQAAAQAAAAEAAAAAAAAAHgAMgAggBgAAAAAAwAAAAAAAAEYAAAAAOIUAAAEAAAABAAAA
AAAAAAsADYAIIAYAAAAAAMAAAAAAAABGAAAAAIKFAAABAAAACwA6gAggBgAAAAAAwAAAAAAAAEYA
AAAADoUAAAAAAAADADyACCAGAAAAAADAAAAAAAAARgAAAAARhQAAAAAAAAMAPYAIIAYAAAAAAMAA
AAAAAABGAAAAABiFAAAAAAAACwBSgAggBgAAAAAAwAAAAAAAAEYAAAAABoUAAAAAAAADAFOACCAG
AAAAAADAAAAAAAAARgAAAAABhQAAAAAAAAIB+A8BAAAAEAAAAAuQ/grZHtYRtlQAoMnZ2UsCAfoP
AQAAABAAAAALkP4K2R7WEbZUAKDJ2dlLAgH7DwEAAACCAAAAAAAAADihuxAF5RAaobsIACsqVsIA
AFBTVFBSWC5ETEwAAAAAAAAAAE5JVEH5v7gBAKoAN9luAAAAQzpcV0lORE9XU1xMb2NhbCBTZXR0
aW5nc1xBcHBsaWNhdGlvbiBEYXRhXE1pY3Jvc29mdFxPdXRsb29rXG91dGxvb2sucHN0AAAAAwD+
DwUAAAADAA00/TcAAAIBfwABAAAAMQAAADxOR0JCTEdGRUFMREFESE5EQUFGRkdFSUtESkFBLmtz
bWl0aEBwZXJmaHQuY29tPgAAAAADAAYQo+B4FgMABxAxAgAAAwAQEAAAAAADABEQAAAAAB4ACBAB
AAAAZQAAAElSRUNFTlRMWVBBVENIRURNWUtFUk5FTEFOREFMTFdFTlRXRUxMV0lUSFBPTUFGVEVS
SVJFQ09NUElMRURJVEFORFJFQk9PVEVELElESUROVFNFRVRIRU1PRFVMRU9OTFNNT0QAAAAAi4I=

------=_NextPart_000_0000_01C30978.C96B8C20--


