From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: netfilter: add xt_cpu match
Date: Mon, 9 Aug 2010 21:52:36 +0200
Message-ID: <AANLkTi=ffogSPifiTg7tofEvbpFcpAsfM_bm2DCASvs1@mail.gmail.com>
References: <201008042011.o74KBSlB026488@hera.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:sender:received
         :in-reply-to:references:date:x-google-sender-auth:message-id:subject
         :from:to:cc:content-type:content-transfer-encoding;
        bh=+CLQKZR4noVpW/HWOHBd/HDAkBvStfRwC50pUGHpueA=;
        b=I9tZsyhXwFzjRttelM0JdzdDxTNA7M26O8ZaX81D5cqSs+xWOaA2dPOnSZmgZkahZ5
         MXx09NEwdba6MbRxFcg9AcLb3L6+hllDbjxdJI3bf7/5MbU1ppd7MqdJXPXxJAaoMWpd
         eC0+PfKyB6VyC20hYxzvrvZHS50b7+kOVcaCk=
In-Reply-To: <201008042011.o74KBSlB026488@hera.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Eric Dumazet <eric.dumazet@gmail.com>, Patrick McHardy <kaber@trash.net>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, netfilter@vger.kernel.org

On Wed, Aug 4, 2010 at 22:11, Linux Kernel Mailing List
<linux-kernel@vger.kernel.org> wrote:
> Gitweb: =C2=A0 =C2=A0 http://git.kernel.org/linus/e8648a1fdb54da1f683=
784b36a17aa65ea56e931
> Commit: =C2=A0 =C2=A0 e8648a1fdb54da1f683784b36a17aa65ea56e931
> Parent: =C2=A0 =C2=A0 7f1c407579519e71a0dcadc05614fd98acec585e
> Author: =C2=A0 =C2=A0 Eric Dumazet <eric.dumazet@gmail.com>
> AuthorDate: Fri Jul 23 12:59:36 2010 +0200
> Committer: =C2=A0Patrick McHardy <kaber@trash.net>
> CommitDate: Fri Jul 23 12:59:36 2010 +0200
>
> =C2=A0 =C2=A0netfilter: add xt_cpu match
>
> =C2=A0 =C2=A0In some situations a CPU match permits a better spreadin=
g of
> =C2=A0 =C2=A0connections, or select targets only for a given cpu.

> --- a/net/netfilter/Kconfig
> +++ b/net/netfilter/Kconfig
> @@ -663,6 +663,15 @@ config NETFILTER_XT_MATCH_CONNTRACK
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0To compile it as a module, choose M=
 here. =C2=A0If unsure, say N.
>
> +config NETFILTER_XT_MATCH_CPU
> + =C2=A0 =C2=A0 =C2=A0 tristate '"cpu" match support'
> + =C2=A0 =C2=A0 =C2=A0 depends on NETFILTER_ADVANCED
> + =C2=A0 =C2=A0 =C2=A0 help
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 CPU matching allows you to match packet=
s based on the CPU
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 currently handling the packet.

Shouldn't this depend on SMP? Or does it make sense to have it on UP, t=
oo?

Gr{oetje,eeting}s,

=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0=C2=A0 -- Linus Torvalds
