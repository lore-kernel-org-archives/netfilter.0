From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: Re: PPTP conntrack patch.
Date: Wed, 21 Apr 2004 10:00:21 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001c01c42776$b1f627e0$1202a8c0@admin>
References: <GHEILNONPACCGBGKBEKKMEFFCFAA.mani@manikandan.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: Netfilter <netfilter@lists.netfilter.org>

> I am trying to configure my gateway/firewall RH 9 linux-2.4.20-30.9,
> to allow multiple LAN pptp client sessions. I applied pptp conntrack
patch
> which I downloaded from iptables.org.
>
> When I apply the patch on my kernel linux-2.4.20-30.9, I am getting
> a message
>
> Testing patch extra/pptp-conntrack-nat.patch...
>    Placed new Config.in line
>    Placed new Configure.help entry
>    Placed new Makefile line
>    Placed new Makefile line
>    Placed new ip_conntrack.h line
>    Placed new ip_conntrack.h line
>    Placed new ip_conntrack.h line
>    Placed new ip_conntrack.h line
>    Placed new ip_conntrack.h line
>    Placed new ip_conntrack.h line
>    Placed new ip_conntrack.h line
>    Placed new ip_conntrack.h line
> Failed to patch copy of /usr/src/linux-2.4.20-30.9
>
> But I am able to see files like ,

Try patching a recent vanilla 2.4 kernel from www.kernel.org.

> ip_conntrack_pptp.c
> ip_conntrack_proto_gre.c
>
> but there are no files ending with .o for ip_conntrack_pptp.c
> ip_conntrack_proto_gre.c .
>
> I went ahead and recompiled and installed my new  kernel.
>
> Still I am not able to find any modules for gre or pptp inside
> /lib/modules/'uname-r'/net/ipv4/netfilter directory.
>
> What could be the problem. Please assist me. I have already spent few
weeks
> on this.

I guess when installing your kernel and modules you get depmod errors
(anyway, I got them when installing kernel 2.4.26) :

> depmod: *** Unresolved symbols in
> /lib/modules/2.4.26-4/kernel/net/ipv4/netfilter/ip_conntrack_pptp.o
> depmod:         ip_ct_gre_keymap_add
> depmod:         ip_ct_gre_keymap_destroy
> depmod: *** Unresolved symbols in
> /lib/modules/2.4.26-4/kernel/net/ipv4/netfilter/ip_nat_pptp.o
> depmod:         ip_ct_gre_keymap_change

Philip Craig's answer fixed that for me :
http://lists.netfilter.org/pipermail/netfilter-devel/2004-March/014618.html


Gr,
Rob




