From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: PaX killing conntrackd (strange "execution attempt")
Date: Mon, 17 Nov 2008 13:44:36 +0100
Message-ID: <49216734.9080505@netfilter.org>
References: <20081113100309.GH26975@bla.fasel.org>, <491D6927.3010701@netfilter.org>, <20081114150908.GV26975@bla.fasel.org> <491D9AED.12969.1657939B@pageexec.freemail.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <491D9AED.12969.1657939B@pageexec.freemail.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: pageexec@freemail.hu
Cc: netfilter@vger.kernel.org, Wolfram Schlich <lists@wolfram.schlich.org>

pageexec@freemail.hu wrote:
> On 14 Nov 2008 at 16:09, Wolfram Schlich wrote:
> 
>> Here's the log entry:
>> --8<--
>> 11-14 14:25:20 +01:00; hafw2; kern.err; kernel: PAX: From 10.10.10.249: execution attempt in: <NULL>, 00000000-00000000 00000000
>> 11-14 14:25:20 +01:00; hafw2; kern.err; kernel: PAX: terminating task: /usr/sbin/conntrackd(conntrackd):7543, uid/euid: 0/0, PC: 0000000000000000, SP: 00007fffffffb398
>> 11-14 14:25:20 +01:00; hafw2; kern.err; kernel: PAX: bytes at PC: ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ??
>> 11-14 14:25:20 +01:00; hafw2; kern.err; kernel: PAX: bytes at SP-8:
>> --8<--
> 
> ok, here's the rest of the story:
> 
> (gdb) x/16x $sp
> 0x7fffffffb398: 0xf7ba28b5      0x00007fff      0x00000001      0x00000000
> (gdb) x/8i 0x00007ffff7ba28b5-3
> 0x7ffff7ba28b2 <__build_protoinfo+450>: callq  *(%rdx,%rax,8)
> 0x7ffff7ba28b5 <__build_protoinfo+453>: mov    $0x1,%eax
> 0x7ffff7ba28ba <__build_protoinfo+458>: mov    %ebp,%ecx
> 0x7ffff7ba28bc <__build_protoinfo+460>: shl    %cl,%rax
> 0x7ffff7ba28bf <__build_protoinfo+463>: or     %eax,(%r14,%rbx,4)
> 0x7ffff7ba28c3 <__build_protoinfo+467>: cmp    $0x37,%r12d
> 0x7ffff7ba28c7 <__build_protoinfo+471>: jle    0xfffffffff7ba287f
> 0x7ffff7ba28c9 <__build_protoinfo+473>: mov    0x10(%rsp),%rdx
> (gdb) i r rdx rax
> rdx            0x7ffff7db5000   140737351733248
> rax            0x37     55
> (gdb) x/8x $rdx+8*$rax
> 0x7ffff7db51b8: 0x00000000      0x00000000      0xf7ba9468      0x00007fff
> 0x7ffff7db51c8: 0xf7ba94b1      0x00007fff      0xf7ba9505      0x00007fff
> 
> so that's a null function pointer in whatever structure __build_protoinfo dereferences
> there. is it of any help to you or do you need me to dig out more?

Hm, that code belongs to libnetfilter_conntrack (src/conntrack/build.c). 
The annoying thing is that I see no structure with function pointers in 
that piece of bits. There are only calls to libnfnetlink functions to 
build the netlink message that is sent to kernel-space.

@Wolfram: that code is only reachable during a fail-over - ie. when the 
external cache commits the entries or if you have CacheWriteThrough 
enabled (you shouldn't unless you know what you're doing). I'm telling 
this because otherwise I don't see a way to reach that code - 
considering the posibility of having a memory corruption so that this 
backtrace becomes useless.

BTW, thank you for the detailed report.

-- 
"Los honestos son inadaptados sociales" -- Les Luthiers
