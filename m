From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: Iptables
Date: Fri, 20 May 2005 08:04:18 +0200
Message-ID: <20050520060303.34BE88EDCEB@smtp.sterenborg.info>
References: <200505200738.57268.chadley@pinteq.co.za>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200505200738.57268.chadley@pinteq.co.za>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: Netfilter <netfilter@lists.netfilter.org>

> Would it be safe to set the OUTPUT default policy to ACCEPT?
> Every time I set it to DROP I get locked out, I suppose it
> has to do with the fact that I have no rules for the OUTPUT chain.

A lot of people set OUTPUT policy to ACCEPT.
You can always do something like :

$ipt -P OUTPUT DROP
$ipt -A OUTPUT -p tcp --sport 1024: -j ACCEPT
$ipt -A OUTPUT -p udp --sport 1024: -j ACCEPT
$ipt -A OUTPUT -p icmp -j ACCEPT

This way a program cannot pretend to something like a web- or
mailserver. If you check "/proc/sys/net/ipv4/ip_local_port_range" you
see the local portrange (sport) your box will use. You can use this
range in your rules. E.g. you could  use "32768:61000" (if that is your
range) instead of "1024:".


Gr,
Rob


