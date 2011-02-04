From: Andrew Beverley <andy@andybev.com>
Subject: Re: shaping vlans - revisited
Date: Fri, 04 Feb 2011 02:59:16 +0000
Message-ID: <1296788356.7587.70.camel@andybev>
References: <20110203152944.635b42e8@pulsar.inexo.com.br>
	 <1296759048.7587.3.camel@andybev>
	 <20110203180118.62970fb1@pulsar.inexo.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1296788358; bh=qA2yRbcfkk+8tgW3y7QaWC9G4PTDrIPFF1f7E
	96hemk=; h=Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:Message-ID:Mime-Version:Content-Transfer-Encoding; b=iQzPQZOf
	J+g+sBozPhWL5okVCICTLtoB/xM042r/XbrnTa4eMMzX68t8+hcl96eXM6dBNG1Bhnp
	hfOyVYFo/iBg+7BuXKp0fjj1alXO7Fjykpu0fvIyDJ1qDJ3TitGhUPKYEJKllypN+Dj
	7Eat2Bsz54WorWUbTI5aQAofa/Crc=
In-Reply-To: <20110203180118.62970fb1@pulsar.inexo.com.br>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Ethy H. Brito" <ethy.brito@inexo.com.br>
Cc: netfilter@vger.kernel.org

> > Are you sure you are marking packets correctly *both* ways? Just because
> > they are being marked in one direction, doesn't mean that they are being
> > marked in the other direction.
> 
> Andrew 
> 
> If you see my first post you will find the filter rule I use to insert the
> packet in each flowid according to its IPMARK. 
> 
> The marks is performed by these four lines:
> 
> /usr/sbin/iptables -t mangle -A POSTROUTING -o eth0 -m mark ! --mark 0 \
> 	-j IPMARK --addr dst --and-mask 0xffff --or-mask 0x20000
> /usr/sbin/iptables -t mangle -A POSTROUTING -o eth0 -m mark --mark 0 \
> 	-j IPMARK --addr dst --and-mask 0xffff --or-mask 0x0
> /usr/sbin/iptables -t mangle -A POSTROUTING -o eth1 -m mark ! --mark 2 \
> 	-j IPMARK --addr src --and-mask 0xffff --or-mask 0x0
> /usr/sbin/iptables -t mangle -A POSTROUTING -o eth1 -m mark --mark 2 \
> 	-j IPMARK --addr src --and-mask 0xffff --or-mask 0x40000
> 
> and since it is working for eth0 I assume they are correct for both
> interfaces.

Okay.

> 
> The script does the same thing to both eth0 and eth1 interfaces.
> 
> One extra detail is: this setup was working (just as it is for eth0) until
> two weeks ago when then we created the vlans and splited the traffic among
> them.
> 
> > 
> > If you add an iptables rule to LOG your traffic on that interface, then
> > you will be able to see the mark value.
> 
> This is a problem! 
> 
> If I run: iptables -I FORWARD -o eth1 -j LOG
> I see NO traffic at all!! Nothing!!
> 
> But: iptables -I FORWARD -o vlan+ -j LOG
> gives me tons of logs!!
> 
> iptables only see the traffic through vlans and not through eth1.
> 

I have to admit I've never played with vlans and iptables, so I was just
guessing based on non-vlan experience.

Stupid question - can you not just attach your qdisc to the vlan
interface and mark the traffic on the vlan interface as well, as if it
was eth1?

Alternatively, if the root qdisc is seeing all the packets but it's the
marking that's not working, then can you not just mark on the vlan
interface rather than eth1?

Andy


