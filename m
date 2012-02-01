From: Andrew Beverley <andy@andybev.com>
Subject: Re: Dual WAN setup redux
Date: Wed, 01 Feb 2012 20:35:04 +0000
Message-ID: <1328128504.1891.38.camel@andy-laptop>
References: <201201271803.19071.dyioulos@onpointfc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <201201271803.19071.dyioulos@onpointfc.com>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1328128924;
	bh=cbXzHP7TuHcHrwnQtyB2hyc23EtN5jwWpAs/gBb29ck=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:Mime-Version:Content-Transfer-Encoding;
	b=Yle7wIJ3TSCbcRknwgYo2bRl9vu+KXePXEuG4orRkddU33cdHUVtUft/fpSzcpn4B
	 4rrVkqlM6dYSCHXsr9yRtjiKhpxjLH7qWq+ixA6wRS/5/CNPDXQinpIiFDrr3s6hWW
	 WVKCQuvkcAcMFEI0w5WAMsVV6AgWtADwxDCTrF2w=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Dimitri Yioulos <dyioulos@onpointfc.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Fri, 2012-01-27 at 18:03 -0500, Dimitri Yioulos wrote:
> I want to use WAN2 for a new Web server and test server living in the
> DMZ.
> 
> I created a new routing table called WAN2.  Here's the output of "ip route show 
> table WAN2":
> 
> 75.x.x.24/29 dev eth3  scope link  src 75.x.x.25
> default via 75.x.x.30 dev eth3

In which case you need to force traffic from/to your new webserver to
use the routing table above.

> 75.x.x.24   *               255.255.255.248 U         0 0          0 eth3

This is saying any traffic for 75... should go via eth3.

> 65.x.x.160  *               255.255.255.224 U         0 0          0 eth0
> 10.8.0.0        vpn.mydomain.c 255.255.255.0   UG        0 0          0 eth2
> 192.168.1.0     *               255.255.255.0   U         0 0          0 eth2
> 192.168.100.0   *               255.255.252.0   U         0 0          0 eth1

Likewise for these.

> default         65.x.x.161. 0.0.0.0                UG        0 0          0 eth0

And anything else should go via 65...

So, at the moment, there's nothing making traffic use eth3, unless it
happens to be on that same subnet.

> The following are probably stupid noob questions, but here goes:
> 
> I can ping the WAN2 gateway address from our firewall/router, but not from any 
> other network device (I can ping the gateway address of WAN1 just fine).

See point above.

>   Don't 
> I have to be able to do that first?

Yes.

> I'm not sure what internal ip addresses to give the new Web server and test 
> server (192.100.1.x, or 75.x.x.26-29.

You could do either. If you've been issued with a 'spare' public IP
address, then you might as well use that, as it saves SNAT.

If you're not using 75.x.x.26-29 then you could use one of these. But
you should not be assigning them all to eth3 as aliases (as per your
diagram). You only need one there.

In summary, if I understand your setup correctly, you should be able to
assign *one* of your public IP addresses to eth3, and then assign
another one to the web server, assuming they're all in the same subnet
and you get the subnets correct.

Once you've done that, as long as IP forwarding is enabled and you
ACCEPT the packets in iptables then it should work.

Andy


