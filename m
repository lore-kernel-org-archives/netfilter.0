From: Alessandro Vesely <vesely@tana.it>
Subject: Re: Extending an IPv4 filter to IPv6
Date: Sat, 19 Aug 2023 11:53:19 +0200
Message-ID: <3a010f66-7229-54f9-9f9c-b5bb81b44ea5@tana.it>
References: <9d98b203-b22a-898c-1a4f-c83e706bc411@tana.it>
 <ZOAe3rziTGTkTyfi@slk15.local.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=tana.it;
        s=epsilon; t=1692438799;
        bh=f4HkZXA69EwMK9HMHt0DTfRncBhE0j8cwmvcqefwfS0=;
        h=Author:Date:Subject:To:References:From:In-Reply-To;
        b=lP/LHFoHj4syj36r4SwQl7WrNuU+3UKb3lsK/i7SAKQmYIg7pORrASJxiwa1bI4ET
         ibWfm0pO81QvxGBRbn8Bw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tana.it; s=delta;
        t=1692438799; bh=f4HkZXA69EwMK9HMHt0DTfRncBhE0j8cwmvcqefwfS0=;
        h=Date:Subject:To:References:From:In-Reply-To;
        b=BVhomxoSYDbSPsVZrCYCJki5jW7LJFdMwZUZ51il848gEwu+FyZaarN1gF2+ooMVa
         R9FYxvb5ltti1e3kSq33ZPt0SAJEE8FsrH271VzLkK97YQKRfuJM6cdRpGqke47Wt2
         KsSS8CElClCGhXoQJf9hZBUmf7aU6zztJr8Ubm0xpQCqeLEwc/soUXsbxhHdH
Subject: Re: Extending an IPv4 filter to IPv6
Content-Language: en-US, it-IT
In-Reply-To: <ZOAe3rziTGTkTyfi@slk15.local.net>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: netfilter@vger.kernel.org

Hi Duncan, thank you for your reply.

On Sat 19/Aug/2023 03:46:06 +0200 Duncan Roe wrote:
> On Fri, Aug 18, 2023 at 12:56:38PM +0200, Alessandro Vesely wrote:
>>
>> I have an old program (ipqbdb) which filters IPv4 packets using
>> libnetfilter_queue.  I want to extend it to also filter IPv6, now that at
>> last I can use some of those addresses. [...]
>>
>> There is a big DEPRECATED in the documentation, and the generated doc for
>> nfq_bind_pf() parameters says "This call is obsolete, Linux kernels from=
 3.8
>> onwards ignore it" (which is obviously false).
>> https://netfilter.org/projects/libnetfilter_queue/doxygen/
>>
>> So, the first question: Can I keep using these functions?  What is the a=
lternative?
>>
>> Second question: Is there a "mixed mode" parameter, besides PF_INET and
>> PF_INET6, that allows to capture both types?  In that case, can a queue
>> receive either packet?
>
> There are 2 separate APIs in libnetfilter_queue, examplified by
> utils/nfqnl_test.c (your program) and examples/nf-queue.c (newer, has fun=
ctions
> for packet mangling).


Only the latter is included in the Debian package.


> DEPRECATED was an unfortunate choice of label for the older API: the func=
tions
> are not deprecated but the underlying library that they currently use is
> deprecated. In answer to your questions:


In fact it still works.


> 1a Can I keep using these functions?: Certainly.
>=20
> 1b What is the alternative?: No need to change if your current program do=
es all
> you need. I assume here that you don't access the IPv4 header fields: the=
 new
> API has functions for that (and IPv6) but the old API has nothing of that
> nature.


I have nfq_set_mode(qh, NFQNL_COPY_PACKET, 20), where a copy_range of 20 is=
=20
enough to see the IP addresses =E2=80=94which is what it filters.

I think I'll go for the alternative anyway.


> 2 ...can a queue receive either packet?: Yes. utils/nfqnl_test.c works fi=
ne
> with IPv6. nfq_bind_pf() really *is* obsolete - I'll explain:
>=20
> In libnetfilter_queue:
>    In libnetfilter_queue.c:
>      493 int nfq_bind_pf(struct nfq_handle *h, uint16_t pf)
>      494 {
>      495         return __build_send_cfg_msg(h, NFQNL_CFG_CMD_PF_BIND, 0,=
 pf);
>      496 }
>=20
> In Linux kernel:
>    In net/netfilter/nfnetlink_queue.c
>      1380     case NFQNL_CFG_CMD_PF_BIND:
>      1381     case NFQNL_CFG_CMD_PF_UNBIND:
>      1382       break;
>      1383     default:
>      1384       ret =3D -ENOTSUPP;
>      1385       goto err_out_unlock;


Heck, I see.  In particular, the cmd->pf argument is never used.  That mean=
s=20
that the type of packet a filter receives only depends on what iptables of =
nft=20
are shoving at its queue, irrespective of compile and runtime config.  Corr=
ect?


Best
Ale
--=20
















