From: "Manikandan" <mani@manikandan.org>
Subject: PPTP conntrack patch.
Date: Wed, 21 Apr 2004 13:00:40 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <GHEILNONPACCGBGKBEKKMEFFCFAA.mani@manikandan.org>
Reply-To: <manikandan@manikandan.org>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_001C_01C427A0.A5E6E640"
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

------=_NextPart_000_001C_01C427A0.A5E6E640
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit


Hello folks,

	I am trying to configure my gateway/firewall RH 9 linux-2.4.20-30.9,
to allow multiple LAN pptp client sessions. I applied pptp conntrack patch
which I downloaded from iptables.org.

	When I apply the patch on my kernel linux-2.4.20-30.9, I am getting
a message 

Testing patch extra/pptp-conntrack-nat.patch...
   Placed new Config.in line
   Placed new Configure.help entry
   Placed new Makefile line
   Placed new Makefile line
   Placed new ip_conntrack.h line
   Placed new ip_conntrack.h line
   Placed new ip_conntrack.h line
   Placed new ip_conntrack.h line
   Placed new ip_conntrack.h line
   Placed new ip_conntrack.h line
   Placed new ip_conntrack.h line
   Placed new ip_conntrack.h line
Failed to patch copy of /usr/src/linux-2.4.20-30.9

But I am able to see files like , 

ip_conntrack_pptp.c
ip_conntrack_proto_gre.c

but there are no files ending with .o for ip_conntrack_pptp.c
ip_conntrack_proto_gre.c .

I went ahead and recompiled and installed my new  kernel. 

Still I am not able to find any modules for gre or pptp inside
/lib/modules/'uname-r'/net/ipv4/netfilter directory. 

What could be the problem. Please assist me. I have already spent few weeks
on this.


Regards,
Manikandan.






------=_NextPart_000_001C_01C427A0.A5E6E640
Content-Type: application/ms-tnef;
	name="winmail.dat"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
	filename="winmail.dat"

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
IBuAU9An8RvSUoCx0f/VgMEQU5ATgLOhsFGRoBgg/W2AZQ/AI4Ii8H9wIC8pH7+VsBOg0LAP17CA
AoBrzZF/zZCCX4Nvho+Hnw6JBOAAAYsgAAsAAIAIIAYAAAAAAMAAAAAAAABGAAAAAAOFAAAAAAAA
AwACgAggBgAAAAAAwAAAAAAAAEYAAAAAEIUAAAAAAAADAAyACCAGAAAAAADAAAAAAAAARgAAAABS
hQAAJ2oBAB4ADYAIIAYAAAAAAMAAAAAAAABGAAAAAFSFAAABAAAABAAAADkuMAALAA6ACCAGAAAA
AADAAAAAAAAARgAAAAAGhQAAAAAAAAMAD4AIIAYAAAAAAMAAAAAAAABGAAAAAAGFAAAAAAAACwAY
gAggBgAAAAAAwAAAAAAAAEYAAAAADoUAAAAAAAADABmACCAGAAAAAADAAAAAAAAARgAAAAARhQAA
AAAAAAMAG4AIIAYAAAAAAMAAAAAAAABGAAAAABiFAAAAAAAAHgAqgAggBgAAAAAAwAAAAAAAAEYA
AAAANoUAAAEAAAABAAAAAAAAAB4AK4AIIAYAAAAAAMAAAAAAAABGAAAAADeFAAABAAAAAQAAAAAA
AAAeACyACCAGAAAAAADAAAAAAAAARgAAAAA4hQAAAQAAAAEAAAAAAAAACwA0gAggBgAAAAAAwAAA
AAAAAEYAAAAAgoUAAAEAAAACAfgPAQAAABAAAAB023W7Ho1nSL3thPkU0QonAgH6DwEAAAAQAAAA
dNt1ux6NZ0i97YT5FNEKJwIB+w8BAAAASQAAAAAAAAA4obsQBeUQGqG7CAArKlbCAABQU1RQUlgu
RExMAAAAAAAAAABOSVRB+b+4AQCqADfZbgAAAEQ6XE1haWxccGVyLnBzdAAAAAADAP4PBQAAAAMA
DTT9NwAAAgF/AAEAAAAzAAAAPEdIRUlMTk9OUEFDQ0dCR0tCRUtLTUVGRkNGQUEubWFuaUBtYW5p
a2FuZGFuLm9yZz4AAAMABhDFcMGOAwAHELYDAAADABAQAAAAAAMAERABAAAAHgAIEAEAAABlAAAA
SEVMTE9GT0xLUyxJQU1UUllJTkdUT0NPTkZJR1VSRU1ZR0FURVdBWS9GSVJFV0FMTFJIOUxJTlVY
LTI0MjAtMzA5LFRPQUxMT1dNVUxUSVBMRUxBTlBQVFBDTElFTlRTRVNTSQAAAAB7nw==

------=_NextPart_000_001C_01C427A0.A5E6E640--


