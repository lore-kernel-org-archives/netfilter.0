From: Kurt Tragant <k.tragant@firemail.de>
Subject: ip_conntrack table grows
Date: Mon, 27 Jan 2003 12:52:33 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1043668353015969@lycos-europe.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=_NextPart_Lycos_0159691043668353_ID"
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

--=_NextPart_Lycos_0159691043668353_ID
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi list,

I compiled iplimit into the kernel. After some time,
wc -l /proc/net/ip_conntrack
gets bigger and bigger, till ip_conntrack_max is reached and the kernel drops
packages it shouldn't drop (kernel: ip_conntrack: table full, dropping packet.).
If I increase ip_conntrack_max, this effect takes place later. The thing is,
that I even don't use any NAT rules nor the -m iplimit nor other connection
tracking modules!!! But ip_conntrack grows. Is this right? How can I stop it?
How can I empty the ip_conntrack table from time to time?

For an answer I thank you in advance...

Regards
Kurt Tragant

__________________________________________________________________
Arcor-DSL Flatrate - jetzt kostenlos einsteigen und bis zu 76,18 Euro sparen!
Arcor-DSL gibt es jetzt auch mit bis zu 1500 Mbit/s Downstream! http://www.angebot.arcor.net/cgi-bin/angebot.cgi?key=b13e92247022


--=_NextPart_Lycos_0159691043668353_ID--


