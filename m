From: Zoltan Nagy <kirk@elte.hu>
Subject: Re: kernel freeze issue
Date: Fri, 11 Nov 2005 17:17:15 +0100
Message-ID: <4374C40B.2000200@elte.hu>
References: <43692579.8000807@elte.hu> <200511091201.03783@nienna>
	<43721E94.7060806@elte.hu> <20051109224454.GA9770@samad.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20051109224454.GA9770@samad.com.au>
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
To: netfilter@lists.netfilter.org

last night, netconsole captured a trace ;)
i'm not an expert in interpreting kernel traces
any suggestions?

regard.kirk

Nov 10 19:11:45 filter netconsole: network logging started
Nov 10 23:41:47 filter Unable to handle kernel paging request
Nov 10 23:41:47 filter  at virtual address e0fd5000
Nov 10 23:41:47 filter  printing eip:
Nov 10 23:41:47 filter c03fb036
Nov 10 23:41:47 filter *pde = 1fe27067
Nov 10 23:41:47 filter *pte = 00000000
Nov 10 23:41:47 filter Oops: 0000 [#1]
Nov 10 23:41:47 filter SMP
Nov 10 23:41:47 filter
Nov 10 23:41:47 filter Modules linked in:
Nov 10 23:41:47 filter  netconsole
Nov 10 23:41:47 filter  i8xx_tco
Nov 10 23:41:47 filter
Nov 10 23:41:47 filter CPU:    0
Nov 10 23:41:47 filter EIP:    0060:[<c03fb036>]    Not tainted VLI
Nov 10 23:41:47 filter EFLAGS: 00010213   (2.6.14-alt)
Nov 10 23:41:47 filter EIP is at match+0x586/0x8b0
Nov 10 23:41:47 filter eax: 00000001   ebx: 00000800   ecx: 00000800
edx: 00000000
Nov 10 23:41:47 filter esi: e0fd3000   edi: e0fd3000   ebp: e0fbb000
esp: c04f7d8c
Nov 10 23:41:47 filter ds: 007b   es: 007b   ss: 0068
Nov 10 23:41:47 filter Process swapper (pid: 0, threadinfo=c04f6000
task=c048cbe0)
Nov 10 23:41:47 filter
Nov 10 23:41:47 filter Stack:
Nov 10 23:41:47 filter 979b87c9
Nov 10 23:41:47 filter 00000800
Nov 10 23:41:47 filter 00000048
Nov 10 23:41:47 filter e10268c6
Nov 10 23:41:47 filter c012a46d
Nov 10 23:41:47 filter c04b44a0
Nov 10 23:41:47 filter 00000282
Nov 10 23:41:47 filter 00000000
Nov 10 23:41:47 filter
Nov 10 23:41:47 filter
Nov 10 23:41:47 filter 00000020
Nov 10 23:41:47 filter 000002ee
Nov 10 23:41:47 filter e0fc8500
Nov 10 23:41:47 filter 0000001e
Nov 10 23:41:47 filter 085975c0
Nov 10 23:41:47 filter e0fbb0d8
Nov 10 23:41:47 filter e0fbd000
Nov 10 23:41:47 filter e0fd6000
Nov 10 23:41:47 filter
Nov 10 23:41:47 filter
Nov 10 23:41:47 filter 000007ff
Nov 10 23:41:47 filter 000007fe
Nov 10 23:41:47 filter 000007fe
Nov 10 23:41:47 filter e0fd3000
Nov 10 23:41:47 filter 6c025a8c
Nov 10 23:41:47 filter 6bf3acd9
Nov 10 23:41:47 filter 003d26b1
Nov 10 23:41:47 filter 00000000
Nov 10 23:41:47 filter
Nov 10 23:41:47 filter Call Trace:
Nov 10 23:41:47 filter  [<c012a46d>]
Nov 10 23:41:47 filter  notifier_call_chain+0x2d/0x50
Nov 10 23:41:47 filter
Nov 10 23:41:47 filter  [<c03f1cd8>]
Nov 10 23:41:47 filter  ipt_do_table+0x1d8/0x370
Nov 10 23:41:47 filter
Nov 10 23:41:47 filter  [<c03b3260>]
Nov 10 23:41:47 filter  ip_rcv_finish+0x0/0x270
Nov 10 23:41:47 filter
Nov 10 23:41:47 filter  [<c03f7ef6>]
Nov 10 23:41:47 filter  ipt_hook+0x36/0x40
Nov 10 23:41:47 filter
Nov 10 23:41:47 filter  [<c040cfc8>]
Nov 10 23:41:47 filter  nf_iterate+0x78/0x90
Nov 10 23:41:47 filter
Nov 10 23:41:47 filter  [<c03b3260>]
Nov 10 23:41:47 filter  ip_rcv_finish+0x0/0x270
Nov 10 23:41:47 filter
Nov 10 23:41:47 filter  [<c03b3260>]
Nov 10 23:41:47 filter  ip_rcv_finish+0x0/0x270
Nov 10 23:41:47 filter
Nov 10 23:41:47 filter  [<c040d04e>]
Nov 10 23:41:47 filter  nf_hook_slow+0x6e/0x110
Nov 10 23:41:47 filter
Nov 10 23:41:47 filter  [<c03b3260>]
Nov 10 23:41:47 filter  ip_rcv_finish+0x0/0x270
Nov 10 23:41:48 filter
Nov 10 23:41:48 filter  [<c03b3260>]
Nov 10 23:41:48 filter  ip_rcv_finish+0x0/0x270
Nov 10 23:41:48 filter
Nov 10 23:41:48 filter  [<c03b2fcb>]
Nov 10 23:41:48 filter  ip_rcv+0x40b/0x530
Nov 10 23:41:48 filter
Nov 10 23:41:48 filter  [<c03b3260>]
Nov 10 23:41:48 filter  ip_rcv_finish+0x0/0x270
Nov 10 23:41:48 filter
Nov 10 23:41:48 filter  [<c039cd78>]
Nov 10 23:41:48 filter  netif_receive_skb+0x1c8/0x270
Nov 10 23:41:48 filter
Nov 10 23:41:48 filter  [<c039ceb2>]
Nov 10 23:41:48 filter  process_backlog+0x92/0x120
Nov 10 23:41:48 filter
Nov 10 23:41:48 filter  [<c039cfd5>]
Nov 10 23:41:48 filter  net_rx_action+0x95/0x190
Nov 10 23:41:48 filter
Nov 10 23:41:48 filter  [<c0121c16>]
Nov 10 23:41:48 filter  __do_softirq+0xd6/0xf0
Nov 10 23:41:48 filter
Nov 10 23:41:48 filter  [<c0121c65>]
Nov 10 23:41:48 filter  do_softirq+0x35/0x40
Nov 10 23:41:48 filter
Nov 10 23:41:48 filter  [<c010522e>]
Nov 10 23:41:48 filter  do_IRQ+0x1e/0x30
Nov 10 23:41:48 filter
Nov 10 23:41:48 filter  [<c01039e6>]
Nov 10 23:41:48 filter  common_interrupt+0x1a/0x20
Nov 10 23:41:48 filter
Nov 10 23:41:48 filter  [<c0100db0>]
Nov 10 23:41:48 filter  default_idle+0x0/0x30
Nov 10 23:41:48 filter
Nov 10 23:41:48 filter  [<c0100dd3>]
Nov 10 23:41:48 filter  default_idle+0x23/0x30
Nov 10 23:41:48 filter
Nov 10 23:41:48 filter  [<c0100e90>]
Nov 10 23:41:48 filter  cpu_idle+0x70/0x80
Nov 10 23:41:48 filter
Nov 10 23:41:48 filter  [<c04f899f>]
Nov 10 23:41:48 filter  start_kernel+0x15f/0x180
Nov 10 23:41:48 filter
Nov 10 23:41:48 filter  [<c04f8390>]
Nov 10 23:41:48 filter  unknown_bootoption+0x0/0x1e0
Nov 10 23:41:48 filter
Nov 10 23:41:48 filter Code:
Nov 10 23:41:48 filter 84
Nov 10 23:41:48 filter 80
Nov 10 23:41:48 filter 01
Nov 10 23:41:48 filter 00
Nov 10 23:41:48 filter 00
Nov 10 23:41:48 filter 8b
Nov 10 23:41:48 filter 5c
Nov 10 23:41:48 filter 24
Nov 10 23:41:48 filter 48
Nov 10 23:41:48 filter 8b
Nov 10 23:41:48 filter 0d
Nov 10 23:41:48 filter 4c
Nov 10 23:41:48 filter f5
Nov 10 23:41:48 filter 55
Nov 10 23:41:48 filter c0
Nov 10 23:41:48 filter 8b
Nov 10 23:41:48 filter 74
Nov 10 23:41:48 filter 24
Nov 10 23:41:48 filter 4c
Nov 10 23:41:48 filter 43
Nov 10 23:41:48 filter 89
Nov 10 23:41:48 filter d8
Nov 10 23:41:48 filter 99
Nov 10 23:41:48 filter f7
Nov 10 23:41:48 filter f9
Nov 10 23:41:48 filter 83
Nov 10 23:41:48 filter 3c
Nov 10 23:41:48 filter 96
Nov 10 23:41:48 filter ff
Nov 10 23:41:48 filter 0f
Nov 10 23:41:48 filter 84
Nov 10 23:41:48 filter be
Nov 10 23:41:48 filter 00
Nov 10 23:41:48 filter last message repeated 2 times
Nov 10 23:41:48 filter 89
Nov 10 23:41:48 filter 4c
Nov 10 23:41:48 filter 24
Nov 10 23:41:48 filter 04
Nov 10 23:41:48 filter 8b
Nov 10 23:41:48 filter 7c
Nov 10 23:41:48 filter 24
Nov 10 23:41:48 filter 4c
Nov 10 23:41:48 filter b>
Nov 10 23:41:48 filter 14
Nov 10 23:41:48 filter 9f
Nov 10 23:41:48 filter 8d
Nov 10 23:41:48 filter 04
Nov 10 23:41:48 filter d5
Nov 10 23:41:48 filter 00
Nov 10 23:41:48 filter last message repeated 3 times
Nov 10 23:41:48 filter 29
Nov 10 23:41:48 filter d0
Nov 10 23:41:48 filter 8b
Nov 10 23:41:48 filter 54
Nov 10 23:41:48 filter 24
Nov 10 23:41:48 filter 38
Nov 10 23:41:48 filter 8b
Nov 10 23:41:48 filter 04
Nov 10 23:41:48 filter 82
Nov 10 23:41:48 filter 89
Nov 10 23:41:48 filter 04
Nov 10 23:41:48 filter
Nov 10 23:41:48 filter
Nov 10 23:41:48 filter Kernel panic - not syncing: Fatal exception in
interrupt
Nov 10 23:41:48 filter


