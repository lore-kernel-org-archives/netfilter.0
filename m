From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Redirect mirrored traffic to userspace app.
Date: Thu, 21 Oct 2010 07:45:34 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1010210744260.6279@obet.zrqbmnf.qr>
References: <AANLkTikKCEBEv61415CCoM8uBzd1jL6+TDF7Gswh5+Ys@mail.gmail.com> <alpine.LNX.2.01.1010210017290.19350@obet.zrqbmnf.qr> <AANLkTin=WwAwPWjLq_nY7AZqr3hgkDSciEQEWZBwfJym@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTin=WwAwPWjLq_nY7AZqr3hgkDSciEQEWZBwfJym@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mateus Caruccio <mateus@caruccio.com>
Cc: netfilter@vger.kernel.org

On Thursday 2010-10-21 03:57, Mateus Caruccio wrote:

>Unfortunately I'm not able to run any command on production servers :(
>All I could get was a physical port mirror, using an ethernet cable in
>the switch.
>
>Since I do have a copy of the packet on my own box, why can't I change
>it, inside my own box, to match my own IP addr and route it to my own
>userspace app (no matter interface)?

Because you can route it to the userspace program without having to 
change the address.

>For me this should be simple:
>
>1 - a pkt reached my interface with prod-server-dst-addr;
>2 - before it get routed, rewrite its dst-addr to my interface's addr;
>3 - let the kernel delivery it to my interface's local addr:port.
