From: Jan Engelhardt <jengelh@computergmbh.de>
Subject: Re: simple connection bridging
Date: Sun, 13 Apr 2008 09:12:57 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0804130912150.30942@fbirervta.pbzchgretzou.qr>
References: <5d97c170804121439m44ef9243r466dc7e106f0d947@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <5d97c170804121439m44ef9243r466dc7e106f0d947@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Boughton <boughtonp@gmail.com>
Cc: netfilter@vger.kernel.org


On Saturday 2008-04-12 23:39, Peter Boughton wrote:

>Hello.
>
>I have a Linux machine sitting between two WinXP machines, and I'm
>trying to figure out how to use iptables to allow the two WinXP
>machines to communicate with each other as if directly connected (a
>bridge?) whilst still allowing both machines to access the Linux one
>directly.
>
>ie:
>1 = Linux ( eth3 192.168.1.1 , eth0 192.168.0.1 )
>2 = WinXP notebook ( 192.168.1.2 )
>3 = WinXP desktop ( 192.168.0.3 )

In that case you do not need a bridge, but routing routes.
