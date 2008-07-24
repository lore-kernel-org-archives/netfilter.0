From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: [CONFIG] Block port when listening socket is closed?
Date: Thu, 24 Jul 2008 03:15:41 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0807240315050.23410@fbirervta.pbzchgretzou.qr>
References: <8e8818110807231710k6f15cfb3n694a409f83e2833f@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <8e8818110807231710k6f15cfb3n694a409f83e2833f@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ibramo addison <ibramo5050@gmail.com>
Cc: netfilter@vger.kernel.org


On Thursday 2008-07-24 02:10, ibramo addison wrote:

>Hi
>
>Would you happen to know a way to control system behaviour when
>connection requests are received on TCP or UDP ports where there is no
>socket listening? I know this can be done using net.inet.tcp.blackhole
>or net.inet.udp.blackhole in FreeBSD but I'm not aware of anything
>similar in Linux, so I thought iptables would be the only possibility.

-m socket, but the tproxy guys have not yet merged that code :-/
