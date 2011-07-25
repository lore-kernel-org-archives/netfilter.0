From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: about iptables option --goto
Date: Mon, 25 Jul 2011 21:25:59 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1107252125410.12473@frira.zrqbmnf.qr>
References: <E8EB29BAE3D8487DB30D601B81B21E5A@poweredge1800>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <E8EB29BAE3D8487DB30D601B81B21E5A@poweredge1800>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Julio A. Romero" <julioarr@fisica.uh.cu>
Cc: netfilter@vger.kernel.org

On Monday 2011-07-25 20:21, Julio A. Romero wrote:

> hi all,
>
> in man page says:
>
> -g, --goto chain
>             This  specifies  that  the  processing  should  continue in a user
> specified chain.
>             Unlike the --jump option return will not continue  processing in
> this  chain  but
>             instead in the chain that called us via --jump.
>
> What happen when option return will not continue processing in a built-in chain
> (INPUT, OUTPUT, FORWARD), the built-in chain policy?

Naturally.
