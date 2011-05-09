From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Blocking in NAT
Date: Mon, 9 May 2011 11:39:26 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1105091138410.16779@obet.zrqbmnf.qr>
References: <C9EAA345.75ED%jlay@slave-tothe-box.net> <alpine.LNX.2.01.1105071653100.31190@obet.zrqbmnf.qr> <4DC7ABC0.6030304@oldum.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4DC7ABC0.6030304@oldum.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nikolay Kichukov <hijacker@oldum.net>
Cc: James Lay <jlay@slave-tothe-box.net>, Netfilter <netfilter@vger.kernel.org>

On Monday 2011-05-09 10:54, Nikolay Kichukov wrote:

>-----BEGIN PGP SIGNED MESSAGE-----
>Hash: SHA1
>
>Hi,
>
>or just block it in the -t mangle -A PREROUTING table.
>Have a look at the packet flow diagram and you will  be good to go!

Well, there is a reason the table is called "filter".
