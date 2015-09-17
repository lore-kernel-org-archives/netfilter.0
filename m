From: "Tamtamis, Panagiotis" <panagiotis.tamtamis@unify.com>
Subject: RE: Kernel access of bad area
Date: Thu, 17 Sep 2015 11:25:02 +0000
Message-ID: <0D74DA672F03634EA90EB18A61E36D271E15314E@MCHP01MSX.global-ad.net>
References: <0D74DA672F03634EA90EB18A61E36D271E152FF4@MCHP01MSX.global-ad.net>
 <20150917105200.GA4674@salvia>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20150917105200.GA4674@salvia>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Thanks a lot for your input.
I will merge those patches with our current version of kernel.
It seems a good solution candidate.

-----Original Message-----
From: Pablo Neira Ayuso [mailto:pablo@netfilter.org]
Sent: Thursday, September 17, 2015 1:52 PM
To: Tamtamis, Panagiotis
Cc: netfilter@vger.kernel.org
Subject: Re: Kernel access of bad area

On Thu, Sep 17, 2015 at 08:58:55AM +0000, Tamtamis, Panagiotis wrote:
> Hello to all,
>
> We had the following dump at netfilter code:
>
>
> Unable to handle kernel paging request for data at address 0x7fe3fb80
> Faulting instruction address: 0xf15a69b4
> Oops: Kernel access of bad area, sig: 11 [#1]
> SMP NR_CPUS=2 OCC
> Modules linked in: nf_conntrack_netlink pppoe pppox ppp_generic slhc
> ppp_drv(O) msp(O) xt_nat iptable_raw xt_CT xt_mark xt_DSCP ipt_MASQUERADE
> iptable_nat nf_nat_ipv4 nf_nat xt_limit xt_TCPMSS iptable_mangle
> nfnetlink_queue nfnetlink_log nfnetlink httpk(O) nf_conntrack_ipv6
> nf_defrag_ipv6 ip6table_filter ip6_tables xt_tcpudp nf_conntrack_ipv4
> nf_defrag_ipv4 xt_pkttype xt_conntrack nf_conntrack iptable_filter ip_tables
> x_tables i2c_dev tun drv_vxt(O) avmfritz mISDN_isac mISDN_l1 falc_e1
> drv_tapi(O) tlani_fpga mISDN_core drv_ifxos(O) cma_card iomengine cma_mfc
> tdmswitch bmod_scc lsb hdlc_scc scc_core icgx common_irq board_control akse
> CPU: 1 PID: 17461 Comm: kworker/u4:0 Tainted: G           O 3.12.19-rt30 #1
> Workqueue: DSP_MGMT dsp_rsrv [msp]
> task: db91df80 ti: efb5e000 task.ti: d52ec000
> NIP: f15a69b4 LR: f15a6958 CTR: c0037aa0
> REGS: efb5fbf0 TRAP: 0300   Tainted: G           O  (3.12.19-rt30)
> MSR: 00029000 <CE,EE,ME>  CR: 28ef2324  XER: 00000000
> DEAR: 7fe3fb80, ESR: 00000000
>
> GPR00: 00000000 efb5fca0 db91df80 c0771960 c078d988 efb5e000 0000c37c
> c078d988
> GPR08: 0005b524 c0a88368 00cd5000 7fe3fb78 c0037aa0 00000000 d3cfdc00
> c5782b40
> GPR16: 00000020 ef4da618 00000001 000086dd 00000000 c0772cc0 80000000
> c37d7a2d
> GPR24: 00000014 f15b3e28 00000000 f15e5980 000030df efb5fcf4 7fe3fb78
> c0771960
> NIP [f15a69b4] ____nf_conntrack_find+0x88/0x1a8 [nf_conntrack]
> LR [f15a6958] ____nf_conntrack_find+0x2c/0x1a8 [nf_conntrack]
> Call Trace:
> [efb5fca0] [00000015] 0x15 (unreliable)
> [efb5fcc0] [f15a6b14] __nf_conntrack_find_get+0x40/0x198 [nf_conntrack]
> [efb5fce0] [f15a8b54] nf_conntrack_in+0x384/0x700 [nf_conntrack]
> [efb5fd50] [f15e42ac] ipv4_conntrack_in+0x24/0x34 [nf_conntrack_ipv4]
> [efb5fd60] [c047e364] nf_iterate+0x98/0xfc
> [efb5fd90] [c047e43c] nf_hook_slow+0x74/0x158
> [efb5fdd0] [c04857b4] ip_rcv+0x388/0x4f0

I've requested submission of these patches to -stable quite recently:

http://patchwork.ozlabs.org/patch/516773/
http://patchwork.ozlabs.org/patch/516772/
