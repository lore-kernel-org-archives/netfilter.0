From: "Mark E. Donaldson" <markee@bandwidthco.com>
Subject: RE: Changes in kernel >= 2.4.20 ?
Date: Mon, 17 Nov 2003 20:19:58 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311180419.hAI4JvD1013995@server5.bandwidthco.com>
References: <20031117110642.73ee78fc.m.petruzzi@bluewin.ch>
Reply-To: <markee@bandwidthco.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031117110642.73ee78fc.m.petruzzi@bluewin.ch>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: 'Martin Petruzzi' <m.petruzzi@bluewin.ch>, netfilter@lists.netfilter.org

Are you sure you're not having a PMTU problem?  It's unlikely that iptables
will work sometimes but not others.  Try adding this rule: 

$IPT -t filter -A FORWARD -p tcp --tcp-flags SYN,RST SYN -j TCPMSS
--clamp-mss-to-pmtu 

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Martin Petruzzi
Sent: Monday, November 17, 2003 2:07 AM
To: netfilter@lists.netfilter.org
Subject: Changes in kernel >= 2.4.20 ?

Hello

Apparently there have been changes in kernel since 2.4.20 concerning
netfilters. NAT, masqerading, forwarding or whatever it is called does not
work the same as before. I have the rules as following:

#!/bin/bash
/sbin/modprobe iptable_nat
/opt/sbin/iptables -F
/opt/sbin/iptables -X
/opt/sbin/iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE echo 1 >
/proc/sys/net/ipv4/ip_forward ...
and so on.

This worked perfect with kernels < 2.4.20. Now I'm on 2.4.22 and NAT only
works partially. The system is RH7.2. I tried the latest iptables from
updates.redhat.com and also compiled the latest from netfilter.org. I had no
errors at all, nor while compiling (kernel/iptables) neigther while
installing or inserting the roules.

The behaviour is:
- ftp works fine
- http works partially (i.e. google works but most websites do not).
- ssh connections do work, certain commands ok, but for example "last"
hangs.

This behaviour is reproducable.

Latest iptables also work fine with older kernel (that's how I run it now).

Any idea, what the problem is? What do I need to change?

Thank you very much.

Martin



