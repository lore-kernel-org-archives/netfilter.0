From: pageexec@freemail.hu
Subject: Re: PaX killing conntrackd (strange "execution attempt")
Date: Thu, 20 Nov 2008 13:48:00 +0200
Message-ID: <49255C80.8215.1C8E5CB2@pageexec.freemail.hu>
References: <20081113100309.GH26975@bla.fasel.org>, <491D9AED.12969.1657939B@pageexec.freemail.hu>, <49216734.9080505@netfilter.org>
Reply-To: pageexec@freemail.hu
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-reply-to: <49216734.9080505@netfilter.org>
Content-description: Mail message body
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org, Wolfram Schlich <lists@wolfram.schlich.org>

On 17 Nov 2008 at 13:44, Pablo Neira Ayuso wrote:

> > ok, here's the rest of the story:
> > 
> > (gdb) x/16x $sp
> > 0x7fffffffb398: 0xf7ba28b5      0x00007fff      0x00000001      0x00000000
> > (gdb) x/8i 0x00007ffff7ba28b5-3
> > 0x7ffff7ba28b2 <__build_protoinfo+450>: callq  *(%rdx,%rax,8)
> > 0x7ffff7ba28b5 <__build_protoinfo+453>: mov    $0x1,%eax
> > 0x7ffff7ba28ba <__build_protoinfo+458>: mov    %ebp,%ecx
> > 0x7ffff7ba28bc <__build_protoinfo+460>: shl    %cl,%rax
> > 0x7ffff7ba28bf <__build_protoinfo+463>: or     %eax,(%r14,%rbx,4)
> > 0x7ffff7ba28c3 <__build_protoinfo+467>: cmp    $0x37,%r12d
> > 0x7ffff7ba28c7 <__build_protoinfo+471>: jle    0xfffffffff7ba287f
> > 0x7ffff7ba28c9 <__build_protoinfo+473>: mov    0x10(%rsp),%rdx
> > (gdb) i r rdx rax
> > rdx            0x7ffff7db5000   140737351733248
> > rax            0x37     55
> > (gdb) x/8x $rdx+8*$rax
> > 0x7ffff7db51b8: 0x00000000      0x00000000      0xf7ba9468      0x00007fff
> > 0x7ffff7db51c8: 0xf7ba94b1      0x00007fff      0xf7ba9505      0x00007fff
> > 
> > so that's a null function pointer in whatever structure __build_protoinfo dereferences
> > there. is it of any help to you or do you need me to dig out more?
> 
> Hm, that code belongs to libnetfilter_conntrack (src/conntrack/build.c). 
> The annoying thing is that I see no structure with function pointers in 
> that piece of bits. There are only calls to libnfnetlink functions to 
> build the netlink message that is sent to kernel-space.

sorry, gdb used the wrong symbols, i decoded it by hand now and the failing
code is nfct_copy calling through copy_attr_array[] and it so happens that
the array has no function defined for index ATTR_HELPER_NAME, the last entry
in enum nf_conntrack_attr so i guess it was added without the person being
aware of its uses elsewhere... maybe check your tree for similar issues and
also add some big fat comment to the enum definition to remind yourselves to
update other places when adding a new enum there ;)

