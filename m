From: Jan Engelhardt <jengelh@inai.de>
Subject: Re: IPv6 routes too much
Date: Sat, 9 Feb 2013 04:31:42 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1302090428001.25836@nerf07.vanv.qr>
References: <CAG+XuE7FaAwwSq98JTSr3SOxSP2rN1hxFYQ7O=0L_3E=9kVreg@mail.gmail.com> <alpine.LNX.2.01.1302081615450.10125@nerf07.vanv.qr> <CAG+XuE5g9jJTP4uu5ymQfzvx-O6U9SfK85XGoK+H7yqtVA6A0A@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAG+XuE5g9jJTP4uu5ymQfzvx-O6U9SfK85XGoK+H7yqtVA6A0A@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Prashant Batra <prashant0100@gmail.com>
Cc: "linux-newbie@vger.kernel.org" <linux-newbie@vger.kernel.org>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>


On Friday 2013-02-08 18:33, Prashant Batra wrote:
>
>So, any advice onto how the kernel configs specially under
>/proc/sys/net/ipv6/route/* should be controlled to get best performance.

The defaults should be good enough.

If they are not: Measure it.
