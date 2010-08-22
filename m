From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Forced lladdr change with bridge - or not?
Date: Sun, 22 Aug 2010 23:24:15 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1008222321290.21206@obet.zrqbmnf.qr>
References: <alpine.LSU.2.01.1008221812200.22261@obet.zrqbmnf.qr> <4C715667.9070008@pandora.be> <alpine.LSU.2.01.1008221927430.3855@obet.zrqbmnf.qr> <4C718E30.1090908@plouf.fr.eu.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C718E30.1090908@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: Bart De Schuymer <bdschuym@pandora.be>, netfilter@vger.kernel.org


On Sunday 2010-08-22 22:53, Pascal Hambourg wrote:
>>>> # ip a
>>>> 196: tap1: <BROADCAST,MULTICAST> mtu 1500 qdisc noop state DOWN qlen 500
>>>>    link/ether 9a:17:c4:65:e9:76 brd ff:ff:ff:ff:ff:ff
>>>> 197: tap2: <BROADCAST,MULTICAST> mtu 1500 qdisc noop state DOWN qlen 500
>>>>    link/ether ce:61:28:5a:b7:93 brd ff:ff:ff:ff:ff:ff
>>>> 198: br0: <BROADCAST,MULTICAST> mtu 1500 qdisc noop state DOWN     link/ether
>>>> 9a:17:c4:65:e9:76 brd ff:ff:ff:ff:ff:ff
>>>>
>>>> Is this behavior normal that the lladdrs of all but the first brport
>>>> remain unchanged? If so, what is the purpose of changing the lladdr on the
>>>> first brport?
>>>>  
>>> I don't understand your question,
>
>Me neither : according to your output, the MAC address of neither port
>has changed.

Well.. rerun `ip a` before enslaving tap to br and you see.

>> but the Linux bridge code assigns the MAC
>>> address of its first-added port to the virtual bridge device.
>> 
>> 1. Why does it do that,
>
>The bridge interface must have a MAC address, so why not pick up one in
>thoses of its ports ?

Why not remain with the one it had right after "addbr" creation?

>> 2. Why only the first port?
>
>IME, the bridge picks up the lowest MAC address of its ports.

Seems logical to me at last.
