From: "Manikandan" <mani@manikandan.org>
Subject: FW: PPTP conntrack patch
Date: Wed, 21 Apr 2004 14:50:47 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <GHEILNONPACCGBGKBEKKKEFGCFAA.mani@manikandan.org>
Reply-To: <manikandan@manikandan.org>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_0022_01C427B0.07C1DF50"
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

------=_NextPart_000_0022_01C427B0.07C1DF50
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

Welcome to Patch-o-matic (1.14)!

Kernel:         /usr/src/linux-2.4.24
Iptables:       /usr/src/netfilter/iptables-1.2.9

Each patch is a new feature: many have minimal impact, some do not.
Almost every one has bugs, so don't apply what you don't need!
-------------------------------------------------------
Already applied:

Not all requirements fulfilled for pptp-conntrack-nat/, skipping:
 Can't find a patch version of  matching your  version

Excellent! Source trees are ready for compilation.

This is the error I am getting when I apply the patch.

Regards,
Manikandan.

 -----Original Message-----
From: 	Manikandan [mailto:mani@manikandan.org]
<mailto:[mailto:mani@manikandan.org]>  
Sent:	Wednesday, April 21, 2004 2:47 PM
To:	Netfilter
Subject:	PPTP conntrack patch

Dear friends,

	Sorry about keep asking things about pptp conntrack patch. I tried
apply the patch pptp conntrack on 3 different kernel versions. None of them
worked for me. I tried on 2.4.20-9 2.4.26 and 2.6.5 (Redhat Linux 9). The
patch is not getting applied cleanly on any of these.

	Could anyone please tell me with which kernel version this patch
works.

	I have had already spent more than 2 weeks time on just enabling my
LAN clients to access one VPN server using pptp server. With my current
default kernel support, it allows only one connection to the VPN server. My
PPTP clients are running windows XP/2000.

	VPN server is Windows 2000 Advanced server.

Any hints and suggestion on this will be of great help.

Thanks in advance.

Regards,
Manikandan.

------=_NextPart_000_0022_01C427B0.07C1DF50
Content-Type: application/ms-tnef;
	name="winmail.dat"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
	filename="winmail.dat"

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
LTEyOUVBQ0hQQVQAAAAArVk=

------=_NextPart_000_0022_01C427B0.07C1DF50--


