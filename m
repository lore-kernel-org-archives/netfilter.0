From: Marcelo Tosatti <marcelo.tosatti@cyclades.com>
Subject: PROBLEM: PATCH:MORE for 2.4.23-pre4 hang (fwd)
Date: Mon, 10 Nov 2003 09:06:27 -0200 (BRST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0311100906250.16790-100000@logos.cnet>
Mime-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org



---------- Forwarded message ----------
Date: Sat, 8 Nov 2003 15:16:17 -1000
From: Beau E. Cox <beau@beaucox.com>
To: linux-kernel@vger.kernel.org;
Cc: Marcelo Tosatti <marcelo.tosatti@cyclades.com>
Subject: PROBLEM: PATCH:MORE for 2.4.23-pre4 hang

> submitted Sat Nov  8 13:08:55 HST 2003 by Beau E. Cox <beau@beaucox.com>

> [1.] One line summary of the problem:

> Patch that fixes my problem:
> Starting with 2.4.23-pre4 my system hangs during startup and/or is
> generally unstable (see patch in [ X. ] below.)

> [ 2.] Full description of the problem/report:

> Origionally I had catagorized this problem with the startup sequence;
> the system always seemed to hang when squid was started before
> mysql, etc. Moving squid near the end of the startup process, I
> thought the problem was in hand. However, the system (pre9) proved
> unstable (would not stay up for longer than one day.)

> The problem exibits itself with a solid 'hang'; no oops, no dumps,
> nada.

> [...]

Since my patch was to ip_nat_core.c, I should have mentioned that I use
NAT via iptables. Here is an the relevant section if my iptables
startup script:

# setup nat
echo "  applying nat rules"
echo ""
$iptables -F FORWARD
$iptables -F -t nat
$iptables -P FORWARD DROP
$iptables -A FORWARD -i eth0 -j ACCEPT
$iptables -A INPUT -i eth0 -j ACCEPT
$iptables -A OUTPUT -o eth0 -j ACCEPT
$iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
$iptables -t nat -A POSTROUTING -s 10.0.0.0/8 -o eth1 -j SNAT --to-source 
x.x.x.x

Aloha => Beau;

PS: Please let me know if you need more information.



