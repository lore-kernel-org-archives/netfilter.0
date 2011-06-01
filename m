From: Nicolas Cavallari <Nicolas.Cavallari@lri.fr>
Subject: Re: Bogus MAC in netfilter-queue for IF_MULTICAST_LOOPed packets.
Date: Wed, 01 Jun 2011 14:05:21 +0200
Message-ID: <4DE62B01.7070707@lri.fr>
References: <4DE6081E.7060404@lri.fr> <alpine.LNX.2.01.1106011223410.19261@frira.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.01.1106011223410.19261@frira.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org

>> The LOG target display these packets as having no MAC address (Indeed,
>> the multicast loop code strips the MAC header).
>
> Headers are not stripped.
>
> The "lo" device is of type loopback, so there will be no MAC header
> generated at all, because none is necessary. Subsequently, there is
> nothing to strip.

The multicast loopback code does not use the lo device, it uses netif_rx 
on the output interface.

see ip_dev_loopback_xmit() at net/ipv4/ip_output.c:118. it does a
skb_reset_mac_header() and a __skb_pull(skb_network_offset()).
