From: Andrew Beverley <andy@andybev.com>
Subject: Re: htb + prio trouble
Date: Sun, 20 Nov 2011 19:36:10 +0000
Message-ID: <1321817770.2382.996.camel@andybev-desktop>
References: <op.v49c0wstx1lyi3@debiandesk2.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1321817795;
	bh=sDHfBReaTgH29LWHGwSEvDcfOdv862xzfOIGMTL0o8o=;
	h=Subject:From:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-ID:Mime-Version:Content-Transfer-Encoding;
	b=Rur2chzdDV5PE7o2tFMLwpooe/LZsmEMu0UL5ukIwwdDwlAlw4kRaUsj/e6mEFpgW
	 g/y/Nc9wCk5FCXpb0wfndFIZDrgrhXsOStJhrdJKC8/6kEDLclZuIiBO1S5Lu/W2Y6
	 qvoiHvSjAqlTyXmeYFToNrX8NsXV9caIZJSfz2tQ=
In-Reply-To: <op.v49c0wstx1lyi3@debiandesk2.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Lloyd Standish <lloyd@crnatural.net>
Cc: netfilter@vger.kernel.org

On Sun, 2011-11-20 at 12:44 -0600, Lloyd Standish wrote:
> Hello All,
> 
> While configuring a load-balancing router, I have run into trouble
>  setting up traffic shaping (at least the load-balancing is working!)
> 
> I am trying to:
> (1) limit total upload speed to somewhat below the interface bandwidth
> (2) do some traffic shaping, particularly avoid queuing of VOIP packets.
> 
> To accomplish this I am trying to create a HTB qdisc on each
>  outward-facing interface, each containing a PRIO qdisc with the
>  default 3 classes.  sfq qdiscs are created for each PRIO class.
> 
> Commands to set up qdiscs and filters for outward-facing interface eth0:
> 
> + tc qdisc del dev eth0 root handle 1
> + tc qdisc del dev eth0 ingress
> + tc qdisc add dev eth0 root handle 1:0 htb
> + tc class add dev eth0 parent 1:0 classid 1:1 htb rate 3200kbit ceil 3200kbit
> + tc qdisc add dev eth0 parent 1:1 handle 2: prio
> + tc qdisc add dev eth0 parent 2:1 handle 10: sfq perturb 10 limit 3000
> + tc qdisc add dev eth0 parent 2:2 handle 20: sfq perturb 10
> + tc qdisc add dev eth0 parent 2:3 handle 30: sfq perturb 10
> + tc filter add dev eth0 protocol ip parent 2: prio 1 u32 match ip dport 5060 0xffff flowid 2:1
> + tc filter add dev eth0 protocol ip parent 2: prio 1 u32 match ip sport 5060 0xffff flowid 2:1
> + tc filter add dev eth0 protocol ip parent 2: prio 1 u32 match ip dport 53 0xffff flowid 2:1
> + tc filter add dev eth0 protocol ip parent 2: prio 1 u32 match ip dport 80 0xffff flowid 2:1

I don't think you're filtering correctly. You've attached the filter to
the prio qdisc, which is below the htb qdisc. Therefore it won't see any
traffic, as there is no filter to send traffic into the prio qdisc
itself. In fact, there is no filter at all for the htb qdisc, hence the
reason you are seeing traffic in it but nowhere else.

The filter needs to sit the level above in order to filter into classes
below it, so you'll need to do something like

tc filter add dev eth0 protocol ip parent 1:0 prio 1 \
	u32 match ip dport 80 0xffff flowid 2:1

You may also need to change the flowid (I've never played with the prio
qdisc)

Andy


