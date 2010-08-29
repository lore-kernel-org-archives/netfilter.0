From: Marek Kierdelewicz <marek@piasta.pl>
Subject: Re: using iptables with tun/tap interfaces? no rule sees tun/tap
 interface traffic
Date: Sun, 29 Aug 2010 14:21:46 +0200
Message-ID: <20100829142146.5c8119ed@catus>
References: <4C7A3E75.5020202@wpkg.org>
	<20100829131559.23abd652@catus>
	<4C7A4972.4020304@wpkg.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C7A4972.4020304@wpkg.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Tomasz Chmielewski <mangoo@wpkg.org>
Cc: netfilter@vger.kernel.org

Hi,

>Using 2.6.35 kernel.
>Should I use ebtables for this? iptables seem more flexible here.

Iptables should work great. Try matching interface with
physdev-in/physdev-out instead of -i/-o as described here:
http://bwachter.lart.info/linux/bridges.html

If it doesn't help try using ip address matching rules to narrow down
the problem and see if you get any hits.

I hope you're using kernel bridge for bridging. I don't think you'll be
able to filter traffic bridged with userspace tools like vde.

Best regards,
Marek
