From: Jan Engelhardt <jengelh@computergmbh.de>
Subject: Re: iptables error limit match: invalid size
Date: Fri, 29 Feb 2008 12:35:34 +0100 (CET)
Message-ID: <Pine.LNX.4.64.0802291232510.15270@fbirervta.pbzchgretzou.qr>
References: <5db5e03e0802200617t9bf4d03ufe27fec5c80bf0bd@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <5db5e03e0802200617t9bf4d03ufe27fec5c80bf0bd@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org


>idoru:~# iptables -I INETIN -p icmp --icmp-type 8 -m limit --limit
>1/sec --limit-burst 5 -j ACCEPT
>iptables: Invalid argument
>
>And in the kernel messages (dmesg) appears this:
>
>ip_tables: limit match: invalid size 40 != 32
>
>This is on a Debian (etch) mips (SGI O2) machine, exactly the same
>command on another Debian (etch) machine (x86) gives no problem.

According to git, requires kernel 2.6.19-rc1 as minimum.
