From: "=?ISO-8859-1?Q?T=F6r=F6k_Edvin?=" <edwintorok@gmail.com>
Subject: Re: do_IRQ: stack overflow
Date: Mon, 10 Jul 2006 16:08:13 +0300
Message-ID: <4354d3270607100608o15eff2b7w38168ece9a7cae9c@mail.gmail.com>
References: <200607071547.51437.rene.mayrhofer@gibraltar.at>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200607071547.51437.rene.mayrhofer@gibraltar.at>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Rene Mayrhofer <rene.mayrhofer@gibraltar.at>
Cc: netfilter@lists.netfilter.org

On 7/7/06, Rene Mayrhofer <rene.mayrhofer@gibraltar.at> wrote:
> Hi all,
Hi,
[why did this mail got delayed 3 days?
Received: from localhost ([127.0.0.1] helo=vishnu.netfilter.org)
	by vishnu.netfilter.org with esmtp (Exim 4.60 #1 (Debian))
	id 1FzulL-0003tk-Tz; Mon, 10 Jul 2006 14:21:19 +0200
Received: from jupiter.gibraltar.at ([80.120.3.32])
	by vishnu.netfilter.org with esmtps (Exim 4.60 #1 (Debian))
	id 1Fys2y-0001ni-3E
	for <netfilter@lists.netfilter.org>; Fri, 07 Jul 2006 17:15:13 +0200
]
>
> Since a few days, we have a serious kernel problem on one of our production
> firewalls. It seems to be a problem in the interaction between openswan's
> KLIPS, netfilter, and routing code, at least as fas as I see it. This problem
> is reproducible on one system (we have not yet managed to figure out how to
> reproduce it on another system) running kernel 2.4.32 with KLIPS 2.4.5 (and
> pluto 2.4.5):
Is this similar to:
http://oss.sgi.com/archives/netdev/2004-12/msg00484.html?

Does your system continue to work after this, or does it flood your logs?

>
> do_IRdo_IRQ: stack overflow: 292
> c0252788 00000124 00000120 c028e000 61776bb8 644a8a78 c4562900 c0120da3
>        00000000 000000e4 00000080 61776bb8 644a8a78 c4562900 0000003c 00000018
>        c0280018 ffffff12 e0364a81 00000010 00000206 00000008 c028e764 c4562880
<snip>
> messages appear as fast as the console can print them. ksymoops decodes them
> to
>
> ....
> Trace; c011e861 <do_IRQ+e1/120>
> Trace; c0120da3 <call_do_IRQ+5/12>
> Trace; c011b280 <default_idle+0/50>
> Trace; c011b2a3 <default_idle+23/50>
> Trace; c011b332 <cpu_idle+42/70>
> Trace; c011918c <L6+0/2>
> Trace; c0120da3 <call_do_IRQ+5/12>

Why does this enter cpu_idle at all?

> Trace; e0364a81 <[ipsec]aes_encrypt+8d1/f40>
> Trace; e0365388 <[ipsec]aes_decrypt+298/f60>
> Trace; e036576f <[ipsec]aes_decrypt+67f/f60>
> Trace; e03604d0 <[ipsec]ipsec_rcv_esp_decrypt_setup+50/80>
> Trace; e038f620 <[ipsec]SHA1Final+18830/25270>
> Trace; e035edec <[ipsec]pfkey_msg_interp+8c/337>
> Trace; e038f620 <[ipsec]SHA1Final+18830/25270>
> Trace; e0350361 <[ipsec].text.lock.ipsec_proc+2c/3b>
> Trace; e038f620 <[ipsec]SHA1Final+18830/25270>
> Trace; e0347d75 <[ipx].text.lock.af_ipx+115/150>
> Trace; e038d580 <[ipsec]SHA1Final+16790/25270>
> Trace; e0351f91 <[ipsec]ipsec_tunnel_ioctl+51/240>
> Trace; e034a040 <[ipx]ipx_unregister_sysctl+2270/2290>
> Trace; c01e4bab <kfree_skbmem+b/70>
> Trace; e034d5fb <[ipsec]rj_refines+ab/c0>
> Trace; e034e3f1 <[ipsec]rj_walktree+d1/200>
> Trace; c01f6748 <qdisc_restart+c8/160>
> Trace; c01e8fdd <dev_queue_xmit+18d/430>
> Trace; c0205800 <ip_finish_output2+0/150>
> Trace; c01f2c0b <nf_hook_slow+15b/1c0>
> Trace; c0205db7 <ip_output+137/1e0>
> Trace; c0205800 <ip_finish_output2+0/150>
> Trace; c0205650 <output_maybe_reroute+0/10>
> Trace; c020565b <output_maybe_reroute+b/10>
> Trace; c01f2c0b <nf_hook_slow+15b/1c0>
> Trace; c0206a1d <ip_build_xmit_slow+3ad/5b0>
> Trace; c0205650 <output_maybe_reroute+0/10>

> Trace; c0206ee8 <ip_build_xmit+2c8/420>
Second time it goes through this code.

> Trace; c02294e0 <icmp_glue_bits+0/d0>
> Trace; c0229a1b <icmp_send+2db/390>
> Trace; c02294e0 <icmp_glue_bits+0/d0>
> Trace; e0347d75 <[ipx].text.lock.af_ipx+115/150>
> Trace; e038d580 <[ipsec]SHA1Final+16790/25270>
> Trace; e03524c7 <[ipsec]ipsec_tunnel_init+f7/140>
> Trace; e034a040 <[ipx]ipx_unregister_sysctl+2270/2290>
> Trace; c01e4bab <kfree_skbmem+b/70>
> Trace; e034d5fb <[ipsec]rj_refines+ab/c0>
> Trace; e034e3f1 <[ipsec]rj_walktree+d1/200>
> Trace; c01f6748 <qdisc_restart+c8/160>
> Trace; c01e8fdd <dev_queue_xmit+18d/430>
> Trace; c0205800 <ip_finish_output2+0/150>
> Trace; c01f2c0b <nf_hook_slow+15b/1c0>
> Trace; c0205db7 <ip_output+137/1e0>
> Trace; c0205800 <ip_finish_output2+0/150>
> Trace; c0205650 <output_maybe_reroute+0/10>
> Trace; c020565b <output_maybe_reroute+b/10>
> Trace; c01f2c0b <nf_hook_slow+15b/1c0>
> Trace; c0206a1d <ip_build_xmit_slow+3ad/5b0>
> Trace; c0205650 <output_maybe_reroute+0/10>

> Trace; c0206ee8 <ip_build_xmit+2c8/420>
^^
> Trace; c02294e0 <icmp_glue_bits+0/d0>
> Trace; c0229a1b <icmp_send+2db/390>
> Trace; c02294e0 <icmp_glue_bits+0/d0>
> Trace; e0347d75 <[ipx].text.lock.af_ipx+115/150>
> Trace; e038d580 <[ipsec]SHA1Final+16790/25270>
> Trace; e03524c7 <[ipsec]ipsec_tunnel_init+f7/140>
> Trace; e034a040 <[ipx]ipx_unregister_sysctl+2270/2290>
> ...
>
> etc. The only unusual bit on this machine seems to be that there are SNAT
> rules for traffic going into ipsec interfaces, i.e. with -A POSTROUTING -o
> ipsec0. It runs 10 IPSec tunnels on 2 interfaces, 5 tunnels on each
> interface.
>
> Any ideas what might be wrong? Right now this is a critical problem for us,
> and I would be happy about any pointer what to try. I can spare some time to
> try and track it down. Currently, we try to remove the SNAT rules and work
> around that, but as we can not trigger the problem (just wait for it to
> happen, usually a few times a day), we can not reliably check if that fixes
> it.
Would recompiling with bigger stack size fix it?

[disclaimer: I am not a netfilter developer]
Cheers,
Edwin

