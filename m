From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Filtering on bridges
Date: Wed, 21 Dec 2011 14:30:46 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1112211430010.22587@frira.zrqbmnf.qr>
References: <4EF1B216.50303@opendium.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4EF1B216.50303@opendium.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steve Hill <steve@opendium.com>
Cc: netfilter@vger.kernel.org


On Wednesday 2011-12-21 11:16, Steve Hill wrote:

>For bridged traffic (i.e. traffic that is coming in through one physical NIC,
>traversing a bridge and being sent out of another one without being routed),
>physdev still works as expected.
>
>However, for traffic that has gone through the machine's own IP stack (either
>by being routed or by being generated locally), --physdev-out is no longer
>allowed.  At the time the iptables rules are being executed, the only thing you
>know is the logical bridge interface it is being routed to rather than the
>physical NIC it will eventually be sent from.  Is there a recommended method of
>filtering this traffic based on the physical NIC it is being sent out of, now
>that the deferred rule functionality has been removed?  ebtables doesn't really
>seem to be an option since it is nowhere near as powerful as iptables when it
>comes to IP filtering.

Mark the packets leaving on brX with iptables, then use ebtables to check
for the physical interface plus the mark.
