From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: ipset kernel oops
Date: Sat, 23 Apr 2011 20:28:37 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1104232026240.23429@blackhole.kfki.hu>
References: <4DB1F58B.9080500@googlemail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4DB1F58B.9080500@googlemail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mr Dash Four <mr.dash.four@googlemail.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Fri, 22 Apr 2011, Mr Dash Four wrote:

> During loading of a (rather) large set (consisting of about 30k members) I am
> getting the following kernel error:
> 
> Apr 22 22:14:41 test1 kernel: BUG: soft lockup - CPU#0 stuck for 61s!
> [ipset:1568]
> Apr 22 22:14:41 test1 kernel: Pid: 1568, comm: ipset Not tainted
> 2.6.34.8-68.fc13.i686 #1        /      Apr 22 22:14:41 test1 kernel: EIP:
> 0060:[<d3b8c1ea>] EFLAGS: 00000283 CPU: 0
> Apr 22 22:14:41 test1 kernel: EIP is at iptreemap_list_members_size+0x7a/0xcd
> [ip_set_iptreemap]
> Apr 22 22:14:41 test1 kernel: EAX: 00000252 EBX: 000000f2 ECX: cca59de0 EDX:
> 00000001
> Apr 22 22:14:41 test1 kernel: ESI: 00000046 EDI: ffffffff EBP: cc3a7e88 ESP:
> cc3a7e64
> Apr 22 22:14:41 test1 kernel: DS: 007b ES: 007b FS: 00d8 GS: 00e0 SS: 0068
> Apr 22 22:14:41 test1 kernel: Process ipset (pid: 1568, ti=cc3a6000
> task=d0868000 task.ti=cc3a6000)
> Apr 22 22:14:41 test1 kernel: Stack:
> Apr 22 22:14:41 test1 kernel: 000000ce d07ca000 c19dc000 c1890400 cca59de0
> 000000ba d3b8d350 d3bc1000
> Apr 22 22:14:41 test1 kernel: <0> 00000005 cc3a7ebc d36c2f10 00000014 08050590
> d3b8d350 000230d8 000001a4
> Apr 22 22:14:41 test1 kernel: <0> 00000004 00000380 c09b1838 d36c3f64 d36c3f98
> 00000053 cc3a7ee4 c071e82d
> Apr 22 22:14:41 test1 kernel: Call Trace:
> Apr 22 22:14:41 test1 kernel: [<d36c2f10>] ? ip_set_sockfn_get+0x402/0x7e7
> [ip_set]
> Apr 22 22:14:41 test1 kernel: [<c071e82d>] ? nf_sockopt+0xf1/0x118
> Apr 22 22:14:41 test1 kernel: [<c071e86c>] ? nf_getsockopt+0x18/0x1a
> Apr 22 22:14:41 test1 kernel: [<c072f822>] ? ip_getsockopt+0x6c/0x99
> Apr 22 22:14:41 test1 kernel: [<c07466e0>] ? raw_getsockopt+0x20/0x95
> Apr 22 22:14:41 test1 kernel: [<c06f8f18>] ? sock_common_getsockopt+0x18/0x1d
> Apr 22 22:14:41 test1 kernel: [<c06f70b4>] ? sys_getsockopt+0x64/0x7f
> Apr 22 22:14:41 test1 kernel: [<c06f886c>] ? sys_socketcall+0x157/0x1aa
> Apr 22 22:14:41 test1 kernel: [<c07908bc>] ? syscall_call+0x7/0xb
> Apr 22 22:14:41 test1 kernel: Code: d2 74 51 40 31 d2 eb 4c 8b 75 e8 8b 34 9e
> 89 75 ec 31 f6 83 7d ec 00 75 09 85 d2 74 2e 40 31 d2 eb 29 89 4d dc 8b 4d ec
> 0f a3 31 <19> ff 85 ff 74 07 ba 01 00 00 00 eb 07 85 d2 74 03 40 31 d2 46
> Apr 22 22:14:41 test1 kernel: Call Trace:
> Apr 22 22:14:41 test1 kernel: [<d36c2f10>] ip_set_sockfn_get+0x402/0x7e7
> [ip_set]
> Apr 22 22:14:41 test1 kernel: [<c071e82d>] nf_sockopt+0xf1/0x118
> Apr 22 22:14:41 test1 kernel: [<c071e86c>] nf_getsockopt+0x18/0x1a
> Apr 22 22:14:41 test1 kernel: [<c072f822>] ip_getsockopt+0x6c/0x99
> Apr 22 22:14:41 test1 kernel: [<c07466e0>] raw_getsockopt+0x20/0x95
> Apr 22 22:14:41 test1 kernel: [<c06f8f18>] sock_common_getsockopt+0x18/0x1d
> Apr 22 22:14:41 test1 kernel: [<c06f70b4>] sys_getsockopt+0x64/0x7f
> Apr 22 22:14:41 test1 kernel: [<c06f886c>] sys_socketcall+0x157/0x1aa
> Apr 22 22:14:41 test1 kernel: [<c07908bc>] syscall_call+0x7/0xb
> 
> The machine on which this executes is not particularly powerful pentium2 box,
> so I suspect ipset hogs it and doesn't give the watchdog any room/response. Is
> there anything which could be done about this? The ipset version in question
> is 4.5

How much RAM have you got in that machine? Are the 30k addresses 
pseudo-random, i.e. don't come from several netblocks?

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
