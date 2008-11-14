From: Wolfram Schlich <lists@wolfram.schlich.org>
Subject: Re: PaX killing conntrackd (strange "execution attempt")
Date: Fri, 14 Nov 2008 16:54:03 +0100
Message-ID: <20081114155403.GX26975@bla.fasel.org>
References: <20081113100309.GH26975@bla.fasel.org> <20081113132723.GK26975@bla.fasel.org> <20081113174138.GM26975@bla.fasel.org> <20081113201042.GN26975@bla.fasel.org> <491D6927.3010701@netfilter.org> <20081114150908.GV26975@bla.fasel.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=bla.fasel.org; h=date:from
	:to:subject:message-id:references:mime-version:content-type:
	in-reply-to; s=mx; bh=0sU20fxum3ZYl2E+/3N/s3XTtFs=; b=WbN6Aq2ON8
	irWlQ8KUL1msa4oztD1ZY2Sp0Fy7Bbl6X5rld8enD2kxs1n7qcYA68pCBpBv5Yj5
	lKMUP0/HOE3QRBC2U1rgpC1c42I90Q2JbAldIEUsdr2+DlPllmDWyaKguGQZX2wq
	FdTulLYvsEsKQ/bzXv2zgcv9HblKJy3QE=
Content-Disposition: inline
In-Reply-To: <20081114150908.GV26975@bla.fasel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

* Wolfram Schlich <lists@wolfram.schlich.org> [2008-11-14 16:09]:
> Now I got a core, after more than a day, but it doesn't look good :(

Here's the reply of the PaX team (I sent in the conntrackd binary
along with the coredump):

* pageexec@freemail.hu <pageexec@freemail.hu> [2008-11-14 16:48]:
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

Pablo, is this sufficient information for you?
-- 
Regards,
Wolfram Schlich <wschlich@gentoo.org>
Gentoo Linux * http://dev.gentoo.org/~wschlich/
