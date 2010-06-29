From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: ebtables mac update
Date: Tue, 29 Jun 2010 19:03:01 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1006291902280.1124@obet.zrqbmnf.qr>
References: <1277808205.3791.17.camel@casper.meteor.dp.ua> <4C29E8B4.5060205@plouf.fr.eu.org> <4C2A0703.5040007@riverviewtech.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C2A0703.5040007@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Grant Taylor <gtaylor@riverviewtech.net>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>


On Tuesday 2010-06-29 16:45, Grant Taylor wrote:
>
>The only thing that I would wonder about is is it possible that
>Linux is seeing the link go down on the physical NIC that is
>connected to the bridge, thus taking the logical port in the bridge
>down there by causing it's learned MAC addresses associated with
>that port to be lost.

Sure it does just that, seems like a sensible thing. If one bridge
port is down, there is no point in keeping a now-stale entry for
some MAC address.
