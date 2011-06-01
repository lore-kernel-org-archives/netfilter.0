From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Bogus MAC in netfilter-queue for IF_MULTICAST_LOOPed packets.
Date: Wed, 1 Jun 2011 12:31:01 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1106011223410.19261@frira.zrqbmnf.qr>
References: <4DE6081E.7060404@lri.fr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4DE6081E.7060404@lri.fr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nicolas Cavallari <Nicolas.Cavallari@lri.fr>
Cc: netfilter@vger.kernel.org


> but in PREROUTING i also have a NFQUEUE target for incoming multicast
> packets to do MAC-based accounting/filtering/marking, and these looped
> packets are delivered with bogus source MAC addresses.
>
> I found out that this bogus MAC address is taken from the IP header. For
> example, the given looped packet :
> 45 00 00 3d 00 00 40 00 ff 11 ce 05 0a 00 01 02 e0 00 00 fb ....
> yield this sMAC : 40:00:ff:11:ce:05, as if the IP header was treated as
> a MAC header.
>
> The LOG target display these packets as having no MAC address (Indeed,
> the multicast loop code strips the MAC header).

Headers are not stripped.

The "lo" device is of type loopback, so there will be no MAC header
generated at all, because none is necessary. Subsequently, there is
nothing to strip.
