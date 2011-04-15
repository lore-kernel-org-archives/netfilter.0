From: Andrew Beverley <andy@andybev.com>
Subject: Re: Fwd: iptables redirect inbound traffic to tun
Date: Fri, 15 Apr 2011 18:05:41 +0100
Message-ID: <1302887141.4938.69.camel@andybev-desktop>
References: <BANLkTim2+_Q967uPAU1HA-VO939OMk6GPg@mail.gmail.com>
	 <BANLkTinzSaZbJSWEfW7+Hn4RDgsh-RYJ2w@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1302887141; bh=u9N/WeZRp2QOKv05VR3N+fVET4chWMyoApsB0
	XxXS2Q=; h=Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:Message-ID:Mime-Version:Content-Transfer-Encoding; b=f6mfOBM7
	rDIMMA7MOJ0PFlUt1N5t390XrDRDGKkhEn4MMLdujmVLjH57Cih0rCXtp3l6jURE5+s
	fiwuJgrSPj4nqJgrVcxIPJJeS/ntvCzFUYfZsTbMtnkMHRzctoMOLzQU9yY8LHUnXte
	8UPL1kgc5VALNNpc+/Hh1SU+g1LFE=
In-Reply-To: <BANLkTinzSaZbJSWEfW7+Hn4RDgsh-RYJ2w@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: JOSE FELIX HERNANDEZ BARRIO <jose.hernandez@isthari.com>
Cc: netfilter@vger.kernel.org

On Fri, 2011-04-15 at 18:51 +0200, JOSE FELIX HERNANDEZ BARRIO wrote:
> 
> My problem is when traffic source is B when the packet come back to B
> its destination ip matches local IP so it's not redirected to tun1
> ands it's not processed. Incoming packets on local ip are not
> processed by prerouting chain.
> 
> what i use to redirect its:
> iptables -A PREROUTING -t mangle -i eth0 -t tcp -j MARK --set-mark 1
> iptables -A PREROUTING -t mangle -i eth0 -j ACCEPT
> 
> ip rule add fwmark 1 table 100
> ip route add default dev tun0 table 100

Have you tried marking the packets in the mangle table of OUTPUT?
Looking at the kernel packet flow diagram[1], packets get a reroute
check after that table.

> 
> someone suggested to use iptables -j ROUTE to force routing even in
> this case. But there's no way to use this patch on recent kernel.

I believe that functionality was moved into iproute2.

Andy

[1] http://upload.wikimedia.org/wikipedia/commons/3/37/Netfilter-packet-flow.svg


