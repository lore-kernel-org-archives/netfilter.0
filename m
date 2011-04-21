From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: How can I get rules with all resolved IPs for FQDN?
Date: Thu, 21 Apr 2011 12:40:36 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1104211240100.5504@obet.zrqbmnf.qr>
References: <ED3A8D81130D4C0CB0D9B98DA81D188F@brianlu>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <ED3A8D81130D4C0CB0D9B98DA81D188F@brianlu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Brian Lu <lyt0112@gmail.com>
Cc: netfilter@vger.kernel.org


On Thursday 2011-04-21 11:04, Brian Lu wrote:

> [root@localhost iptables-1.3.5]# nslookup www.facebook.com
> Server:         168.95.1.1
> Address:        168.95.1.1#53
>
> Non-authoritative answer:
> Name:   www.facebook.com
> Address: 66.220.146.25
>
> How can I get rules with all resolved IPs for this kind of FQDN?

Using modern tools like iptables 1.4.10 - and host(8) FWIW.
