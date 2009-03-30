From: Roman Mindalev <r000n@r000n.net>
Subject: Re: Regression caused by commit "netfilter: iptables: lock free
 counters"
Date: Mon, 30 Mar 2009 14:50:31 +0400
Message-ID: <20090330145031.2dfd854e@desktop.r000n.info>
References: <20090329234702.4988017f@desktop.r000n.info>
	<49D075A3.1050202@cosmosbay.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <49D075A3.1050202@cosmosbay.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Eric Dumazet <dada1@cosmosbay.com>
Cc: Stephen Hemminger <shemminger@vyatta.com>, Patrick McHardy <kaber@trash.net>, LKML <linux-kernel@vger.kernel.org>, netfilter@vger.kernel.org

On Mon, 30 Mar 2009 09:32:51 +0200
Eric Dumazet <dada1@cosmosbay.com> wrote:

> Roman Mindalev a =C3=A9crit :
> > Hi.
> > Since 2.6.29-git1 I got many debug messages in kernel log.
> > One from them:
> >=20
> > Mar 29 12:06:11 desktop kernel: [  917.414369] BUG: using
> > smp_processor_id() in preemptible [00000000] code: hddtemp/2820 Mar
> > 29 12:06:11 desktop kernel: [  917.414378] caller is
> > ipt_do_table+0xd0/0x3a8 [ip_tables] Mar 29 12:06:11 desktop kernel:
> > [  917.414382] Pid: 2820, comm: hddtemp Not tainted
> > 2.6.29-05093-gc31f403 #1 Mar 29 12:06:11 desktop kernel:
> > [  917.414386] Call Trace: Mar 29 12:06:11 desktop kernel:
> > [  917.414393] [<ffffffff8042d037>]
> > debug_smp_processor_id+0xe7/0xf0 Mar 29 12:06:11 desktop kernel:
> > [  917.414400]  [<ffffffffa0171f10>] ipt_do_table+0xd0/0x3a8
> > [ip_tables] Mar 29 12:06:11 desktop kernel: [  917.414414]
> > [<ffffffffa0180d0e>] ? nf_conntrack_in+0x23e/0x610 [nf_conntrack]
> > Mar 29 12:06:11 desktop kernel: [  917.414422]
> > [<ffffffff8026d47d>] ? trace_hardirqs_off+0xd/0x10 Mar 29 12:06:11
> > desktop kernel: [  917.414429]  [<ffffffffa008e0b3>]
> > ipt_local_out_hook+0x53/0x60 [iptable_filter] Mar 29 12:06:11
> > desktop kernel: [  917.414435]  [<ffffffff80546a07>]
> > nf_iterate+0x67/0xa0 Mar 29 12:06:11 desktop kernel:
> > [  917.414441]  [<ffffffff80551140>] ? dst_output+0x0/0x10 Mar 29
> > 12:06:11 desktop kernel: [  917.414446] [<ffffffff80546af5>]
> > nf_hook_slow+0xb5/0x100 Mar 29 12:06:11 desktop kernel:
> > [  917.414452]  [<ffffffff80551140>] ? dst_output+0x0/0x10 Mar 29
> > 12:06:11 desktop kernel: [  917.414458]  [<ffffffff80552f7f>]
> > __ip_local_out+0x9f/0xb0 Mar 29 12:06:11 desktop kernel:
> > [  917.414464]  [<ffffffff8058c4db>] ? bictcp_cong_avoid+0x4b/0x2d0
> > Mar 29 12:06:11 desktop kernel: [  917.414469]
> > [<ffffffff80552fa1>] ip_local_out+0x11/0x30 Mar 29 12:06:11 desktop
> > kernel: [  917.414474] [<ffffffff8055389c>]
> > ip_queue_xmit+0x21c/0x410 Mar 29 12:06:11 desktop kernel:
> > [  917.414480]  [<ffffffff80272825>] ?
> > print_lock_contention_bug+0x25/0x120 Mar 29 12:06:11 desktop
> > kernel: [  917.414486]  [<ffffffff8056810e>] ?
> > tcp_established_options+0x3e/0xe0 Mar 29 12:06:11 desktop kernel:
> > [  917.414492]  [<ffffffff80272825>] ?
> > print_lock_contention_bug+0x25/0x120 Mar 29 12:06:11 desktop
> > kernel: [  917.414498]  [<ffffffff80568ef5>]
> > tcp_transmit_skb+0x535/0x820 Mar 29 12:06:11 desktop kernel:
> > [  917.414504]  [<ffffffff8056b5fb>] tcp_write_xmit+0x20b/0xaa0 Mar
> > 29 12:06:11 desktop kernel: [  917.414510]  [<ffffffff8055d451>] ?
> > sk_stream_alloc_skb+0x41/0x110 Mar 29 12:06:11 desktop kernel:
> > [  917.414515]  [<ffffffff8052799e>] ? __alloc_skb+0x6e/0x150 Mar
> > 29 12:06:11 desktop kernel: [  917.414521] [<ffffffff8056befb>]
> > __tcp_push_pending_frames+0x2b/0x90 Mar 29 12:06:11 desktop kernel:
> > [  917.414527]  [<ffffffff8055ddc3>] tcp_sendmsg+0x8a3/0xbb0 Mar 29
> > 12:06:11 desktop kernel: [  917.414533] [<ffffffff8051d2bb>]
> > sock_aio_write+0x12b/0x140 Mar 29 12:06:11 desktop kernel:
> > [  917.414539]  [<ffffffff802df6f1>] do_sync_write+0xf1/0x140 Mar
> > 29 12:06:11 desktop kernel: [  917.414545]  [<ffffffff8025e470>] ?
> > autoremove_wake_function+0x0/0x40 Mar 29 12:06:11 desktop kernel:
> > [  917.414551]  [<ffffffff802e0259>] vfs_write+0x179/0x190 Mar 29
> > 12:06:11 desktop kernel: [  917.414557]  [<ffffffff802e0360>]
> > sys_write+0x50/0x90 Mar 29 12:06:11 desktop kernel: [  917.414563]
> > [<ffffffff8020b51b>] system_call_fastpath+0x16/0x1b
> >=20
> > Result of the bisection:
> >=20
> > 784544739a25c30637397ace5489eeb6e15d7d49 is first bad commit
> > commit 784544739a25c30637397ace5489eeb6e15d7d49            =20
> > Author: Stephen Hemminger <shemminger@vyatta.com>          =20
> > Date:   Fri Feb 20 10:35:32 2009 +0100                     =20
> >=20
> >     netfilter: iptables: lock free counters
> >                                           =20
> >     The reader/writer lock in ip_tables is acquired in the critical
> >     path of processing packets and is one of the reasons just
> > loading iptables can cause a 20% performance loss. The rwlock
> > serves two functions:
> >=20
> >     1) it prevents changes to table state (xt_replace) while table
> > is in use. This is now handled by doing rcu on the xt_table. When
> >     table is replaced, the new table(s) are put in and the old one
> >     table(s) are freed after RCU period.
> >=20
> >     2) it provides synchronization when accesing the counter values=
=2E
> >        This is now handled by swapping in new table_info entries fo=
r
> >     each cpu then summing the old values, and putting the result
> > back onto one cpu.  On a busy system it may cause sampling to occur
> > at different times on each cpu, but no packet/byte counts are lost
> > in the process.
> >=20
> >     Signed-off-by: Stephen Hemminger <shemminger@vyatta.com>
> >=20
> >     Sucessfully tested on my dual quad core machine too, but
> > iptables only (no ipv6 here) BTW, my new "tbench 8" result is 2450
> > MB/s, (it was 2150 MB/s not so long ago)
> >=20
> >     Acked-by: Eric Dumazet <dada1@cosmosbay.com>
> >     Signed-off-by: Patrick McHardy <kaber@trash.net>
> >=20
> > :040000 040000 67ef5761d009330e8d538dd1a3aff77c86995172
> > 0d8d6398ced2117bb6995b0c414fd8013685324e M      include :040000
> > 040000 0317c745a0722ade9a6c0cbe9d6cb92abbd40efa
> > 0eb195a365164c05e7c764ab1c2a7da891276837 M      net
> >=20
> > After reverting commit no more these messages.
> >=20
> > This issue in bugzilla:
> > http://bugzilla.kernel.org/show_bug.cgi?id=3D12960
>=20
> Thanks Roman for this excellent report=20
>=20
> Could you try following patch ?
>=20
> [PATCH] netfilter: use rcu_read_bh() in ipt_do_table()
>=20
> Commit 784544739a25c30637397ace5489eeb6e15d7d49
> (netfilter: iptables: lock free counters) forgot to disable BH
> in arpt_do_table(), ipt_do_table() and  ip6t_do_table()
>=20
> Use rcu_read_lock_bh() instead of rcu_read_lock() cures the problem.
>=20
> Reported-and-bisected-by: Roman Mindalev <r000n@r000n.net>
> Signed-off-by: Eric Dumazet <dada1@cosmosbay.com>
> ---
>=20
> diff --git a/net/ipv4/netfilter/arp_tables.c
> b/net/ipv4/netfilter/arp_tables.c index 35c5f6a..5ba533d 100644
> --- a/net/ipv4/netfilter/arp_tables.c
> +++ b/net/ipv4/netfilter/arp_tables.c
> @@ -253,7 +253,7 @@ unsigned int arpt_do_table(struct sk_buff *skb,
>  	indev =3D in ? in->name : nulldevname;
>  	outdev =3D out ? out->name : nulldevname;
> =20
> -	rcu_read_lock();
> +	rcu_read_lock_bh();
>  	private =3D rcu_dereference(table->private);
>  	table_base =3D
> rcu_dereference(private->entries[smp_processor_id()]);=20
> @@ -329,7 +329,7 @@ unsigned int arpt_do_table(struct sk_buff *skb,
>  		}
>  	} while (!hotdrop);
> =20
> -	rcu_read_unlock();
> +	rcu_read_unlock_bh();
> =20
>  	if (hotdrop)
>  		return NF_DROP;
> diff --git a/net/ipv4/netfilter/ip_tables.c
> b/net/ipv4/netfilter/ip_tables.c index 82ee7c9..810c0b6 100644
> --- a/net/ipv4/netfilter/ip_tables.c
> +++ b/net/ipv4/netfilter/ip_tables.c
> @@ -339,7 +339,7 @@ ipt_do_table(struct sk_buff *skb,
> =20
>  	IP_NF_ASSERT(table->valid_hooks & (1 << hook));
> =20
> -	rcu_read_lock();
> +	rcu_read_lock_bh();
>  	private =3D rcu_dereference(table->private);
>  	table_base =3D
> rcu_dereference(private->entries[smp_processor_id()]);=20
> @@ -437,7 +437,7 @@ ipt_do_table(struct sk_buff *skb,
>  		}
>  	} while (!hotdrop);
> =20
> -	rcu_read_unlock();
> +	rcu_read_unlock_bh();
> =20
>  #ifdef DEBUG_ALLOW_ALL
>  	return NF_ACCEPT;
> diff --git a/net/ipv6/netfilter/ip6_tables.c
> b/net/ipv6/netfilter/ip6_tables.c index e89cfa3..dfed176 100644
> --- a/net/ipv6/netfilter/ip6_tables.c
> +++ b/net/ipv6/netfilter/ip6_tables.c
> @@ -365,7 +365,7 @@ ip6t_do_table(struct sk_buff *skb,
> =20
>  	IP_NF_ASSERT(table->valid_hooks & (1 << hook));
> =20
> -	rcu_read_lock();
> +	rcu_read_lock_bh();
>  	private =3D rcu_dereference(table->private);
>  	table_base =3D
> rcu_dereference(private->entries[smp_processor_id()]);=20
> @@ -466,7 +466,7 @@ ip6t_do_table(struct sk_buff *skb,
>  #ifdef CONFIG_NETFILTER_DEBUG
>  	((struct ip6t_entry *)table_base)->comefrom =3D
> NETFILTER_LINK_POISON; #endif
> -	rcu_read_unlock();
> +	rcu_read_unlock_bh();
> =20
>  #ifdef DEBUG_ALLOW_ALL
>  	return NF_ACCEPT;
>=20

2.6.29-git4 and 2.6.29-git6 both works fine for me with this patch.=20
Thanks, Eric!
