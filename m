From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Howto DNAT/SNAT existing TCP session (no SYN, only PUSH/ACK)
Date: Wed, 11 Aug 2010 16:51:56 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1008111646090.2836@obet.zrqbmnf.qr>
References: <4C62AD26.1050200@aimvalley.nl>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C62AD26.1050200@aimvalley.nl>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Norbert van Bolhuis <nvbolhuis@aimvalley.nl>
Cc: netfilter@vger.kernel.org


On Wednesday 2010-08-11 16:01, Norbert van Bolhuis wrote:
>
> We have a system that looks internally like this:
>
>    eLAN
>      |
>      |
>    --------------
>    | ETH-switch |
>    --------------
>     |p1        |p2
>     |          |
> --------      --------
> |HOST_1|------|HOST_2|
> -------- iLAN --------
>   ]
> ........
> . APPs .
> ........
>
>On HOST_2 the below rule takes care of this:
>iptables -t nat -A PREROUTING -d <eLAN-IP-addr> ! -i iLAN -j DNAT
>--to-destination <iLAN-HOST_1-IP-addr>
>
>Let's say HOST_2 is active and an ESTABLISHED TCP communication is present
>between a system on the eLAN and an APP.

k,

>(of course for HOST_1 the TCP connection will be administrated as
>iLAN-HOST_1-IP-addr/port<-->eLAN-system-IP-addr/port)

What? "pcap language please."


>If the ETH-switch
>rapidly makes p1/HOST_1 active, is it possible to make sure outgoing TCP data
>(that is sent by the APP/HOST_1) is somehow source NAT'ed ?

You have ipt_SNAT at your disposal.

>I ask this because currently the outgoing data (to the system on the eLAN
>carries src-ip=iLAN-HOST_1-IP-addr while I want it to be eLAN-IP-addr.
>
>Anybody know why (TCP of) HOST_1 sends a ReSeT in this case ?

You probably evoked a problem simliar to
http://jengelh.medozas.de/images/dnat-mistake.png
