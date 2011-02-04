From: Marek Kierdelewicz <marek@piasta.pl>
Subject: Re: shaping vlans - revisited
Date: Fri, 4 Feb 2011 08:43:21 +0100
Message-ID: <20110204084321.73d69426@catus>
References: <20110203152944.635b42e8@pulsar.inexo.com.br>
	<1296759048.7587.3.camel@andybev>
	<20110203180118.62970fb1@pulsar.inexo.com.br>
	<1296788356.7587.70.camel@andybev>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1296788356.7587.70.camel@andybev>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andrew Beverley <andy@andybev.com>
Cc: netfilter@vger.kernel.org

>then can you not just mark on the vlan interface rather than eth1?

Andrew is right. Thats the best option. Ethy, just change eth1 to vlan+
in following rules:

/usr/sbin/iptables -t mangle -A POSTROUTING -o eth1 -m mark ! --mark 2 \
	-j IPMARK --addr src --and-mask 0xffff --or-mask 0x0
/usr/sbin/iptables -t mangle -A POSTROUTING -o eth1 -m mark --mark 2 \
	-j IPMARK --addr src --and-mask 0xffff --or-mask 0x40000

Best regards,
Marek Kierdelewicz
