From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: shaping vlans - revisited
Date: Fri, 4 Feb 2011 04:28:04 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1102040426340.6124@obet.zrqbmnf.qr>
References: <20110203152944.635b42e8@pulsar.inexo.com.br> <1296759048.7587.3.camel@andybev> <20110203180118.62970fb1@pulsar.inexo.com.br>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20110203180118.62970fb1@pulsar.inexo.com.br>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Ethy H. Brito" <ethy.brito@inexo.com.br>
Cc: Andrew Beverley <andy@andybev.com>, netfilter@vger.kernel.org


On Thursday 2011-02-03 21:01, Ethy H. Brito wrote:
>
>The marks is performed by these four lines:
>
>/usr/sbin/iptables -t mangle -A POSTROUTING -o eth0 -m mark ! --mark 0 \
>	-j IPMARK --addr dst --and-mask 0xffff --or-mask 0x20000
>/usr/sbin/iptables -t mangle -A POSTROUTING -o eth0 -m mark --mark 0 \
>	-j IPMARK --addr dst --and-mask 0xffff --or-mask 0x0
>/usr/sbin/iptables -t mangle -A POSTROUTING -o eth1 -m mark ! --mark 2 \
>	-j IPMARK --addr src --and-mask 0xffff --or-mask 0x0
>/usr/sbin/iptables -t mangle -A POSTROUTING -o eth1 -m mark --mark 2 \
>	-j IPMARK --addr src --and-mask 0xffff --or-mask 0x40000
>
>BTW "mark 2" is there in the iptable LOG.
>IN=eth0 OUT=vlan3 SRC=...blablabla ... ACK PSH URGP=0 MARK=0x2
>
>But where can I find IPMARK??

The IPMARK target controls the nfmark (MARK= field).
