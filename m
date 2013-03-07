From: Jan Engelhardt <jengelh@inai.de>
Subject: Re: Connection tracking counters increasing
Date: Thu, 7 Mar 2013 17:29:13 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1303071726260.2529@nerf07.vanv.qr>
References: <assp.17785d9ff5.5138BC91.9060903@amfes.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <assp.17785d9ff5.5138BC91.9060903@amfes.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Daniel L. Miller" <dmiller@amfes.com>
Cc: Netfilter-Users <netfilter@vger.kernel.org>

On Thursday 2013-03-07 17:13, Daniel L. Miller wrote:

> I've noticed that my connection tracking counters keep increasing -

Which counters?


> and will do so until failure.
> I've tried a few different timeout settings to see if that fixes it - but so
> far nothing helps except increasing the maximums and then rebooting prior to
> failure.
>
> I'm assuming I'm doing something wrong - but I don't even know where to look.
> The only things that helps is NOT using iptables - which isn't a good answer!
