From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: problem getting uid in nfqueue
Date: Tue, 22 Jun 2010 10:03:42 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1006221003230.13935@obet.zrqbmnf.qr>
References: <1624629744.165291276781877065.JavaMail.root@zimbra6-e1.priv.proxad.net> <4C1FD0EC.6000302@free.fr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C1FD0EC.6000302@free.fr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Beluc <beluc.mailing@free.fr>
Cc: netfilter@vger.kernel.org

On Monday 2010-06-21 22:51, Beluc wrote:

> no idea ? maybe i didn't explain very well :/
>
> i saw that when using LOG target in OUTPUT policy, there is the user's uid who
> send packet.

That is not the user's uid, but the uid of the socket's creator.
