From: "Kurt Tragant " <k.tragant@firemail.de>
Subject: disabling connection tracking
Date: Mon, 25 Aug 2003 13:12:16 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1061809936028593@lycos-europe.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=_NextPart_Lycos_0285931061809936_ID"
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

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

--=_NextPart_Lycos_0285931061809936_ID
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi list,

I did some tests with connection tracking and decided finally to switch off
conntrack. So I deselected connection tracking in the kernel. But if I start the
computer there is still a:

ip_conntrack version 2.1 (2047 buckets, 16376 max) - 152 bytes per conntrack

And if I do a

cat /proc/net/ip_conntrack

I see the tracked connections. I even did a make mrproper in the Kernelsource
and recompiled the kernel again - still the same.

How can I disable connection tracking? Thanks for an answer,

Regards
Kurt Tragant

_________________________________________________________________
www.ebay.de Hier Finden Sie Auktionen und Festpreisangebote!




--=_NextPart_Lycos_0285931061809936_ID--


