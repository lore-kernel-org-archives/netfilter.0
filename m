From: "Kevin Smith" <kevin@perfht.com>
Subject: Re: Noob Question
Date: Fri, 31 Oct 2003 12:03:34 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <NGBBLGFEALDADHNDAAFFGEPJDMAA.kevin@perfht.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_0003_01C39FA7.02584540"
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
To: Netfilter List <netfilter@lists.netfilter.org>

This is a multi-part message in MIME format.

------=_NextPart_000_0003_01C39FA7.02584540
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

Ok thanks, I think I had to but wasn't 100%. Now I can eliminate that is a
possibility (Iptables 1.2.8). 
I finished it late last night so I wasn't in the mood for Googling anything.
but tonight I shall. But I would turn away any tips. ;-)
Thanks


--__--__--

Message: 5
Subject: Re: Noob Question
From: Ray Leach <raymondl@knowledgefactory.co.za>
To: Netfilter Mailing List <netfilter@lists.netfilter.org>
Organization: Knowledge Factory
Date: Fri, 31 Oct 2003 16:25:39 +0200


--=-p9AU5830cWaY0P2ToPWv
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Fri, 2003-10-31 at 16:13, Kevin Smith wrote:
> Does IPtables need to be recompiled every time you roll a new kernel?
> I just compiled 2.4.22 and when my firewall (Shorewall) started, it
> spit some "device busy" errors with ip_tables.o.=20
> Kev
No. The kernel source includes (at least as far as I recall) the
iptables kernel space drivers/programs/libraries.

The userspace tools (the iptables executables used to manage rules) are
separate, and do not get recompiled every time you recompile the kernel.

The exception would be if you have iptables v0.1.0 (for example)
userspace programs and in your kernel have iptables v1.2.8 source code,
then there would be a mismatch, and the userspace programs may be
incompatible with the kernel modules.

Best to keep them all the same.
--=20
--
Raymond Leach <raymondl@knowledgefactory.co.za>
Network Support Specialist
http://www.knowledgefactory.co.za
"lynx -source http://www.rchq.co.za/raymondl.asc | gpg --import"
Key fingerprint =3D 7209 A695 9EE0 E971 A9AD  00EE 8757 EE47 F06F FB28
--


------=_NextPart_000_0003_01C39FA7.02584540
Content-Type: application/ms-tnef;
	name="winmail.dat"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
	filename="winmail.dat"

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
CYAIIAYAAAAAAMAAAAAAAABGAAAAAFSFAAABAAAABAAAADkuMAAeAAqACCAGAAAAAADAAAAAAAAA
RgAAAAA2hQAAAQAAAAEAAAAAAAAAHgALgAggBgAAAAAAwAAAAAAAAEYAAAAAN4UAAAEAAAABAAAA
AAAAAB4ADIAIIAYAAAAAAMAAAAAAAABGAAAAADiFAAABAAAAAQAAAAAAAAALAA2ACCAGAAAAAADA
AAAAAAAARgAAAACChQAAAQAAAAsAOoAIIAYAAAAAAMAAAAAAAABGAAAAAA6FAAAAAAAAAwA8gAgg
BgAAAAAAwAAAAAAAAEYAAAAAEYUAAAAAAAADAD2ACCAGAAAAAADAAAAAAAAARgAAAAAYhQAAAAAA
AAsAUoAIIAYAAAAAAMAAAAAAAABGAAAAAAaFAAAAAAAAAwBTgAggBgAAAAAAwAAAAAAAAEYAAAAA
AYUAAAAAAAACAfgPAQAAABAAAAALkP4K2R7WEbZUAKDJ2dlLAgH6DwEAAAAQAAAAC5D+Ctke1hG2
VACgydnZSwIB+w8BAAAAggAAAAAAAAA4obsQBeUQGqG7CAArKlbCAABQU1RQUlguRExMAAAAAAAA
AABOSVRB+b+4AQCqADfZbgAAAEM6XFdJTkRPV1NcTG9jYWwgU2V0dGluZ3NcQXBwbGljYXRpb24g
RGF0YVxNaWNyb3NvZnRcT3V0bG9va1xvdXRsb29rLnBzdAAAAAMA/g8FAAAAAwANNP03AAACAX8A
AQAAADAAAAA8TkdCQkxHRkVBTERBREhOREFBRkZHRVBKRE1BQS5rZXZpbkBwZXJmaHQuY29tPgAD
AAYQb/+RiQMABxApBQAAAwAQEAAAAAADABEQAAAAAB4ACBABAAAAZQAAAE9LVEhBTktTLElUSElO
S0lIQURUT0JVVFdBU05UMTAwJU5PV0lDQU5FTElNSU5BVEVUSEFUSVNBUE9TU0lCSUxJVFkoSVBU
QUJMRVMxMjgpSUZJTklTSEVESVRMQVRFTEFTVE4AAAAA73w=

------=_NextPart_000_0003_01C39FA7.02584540--


