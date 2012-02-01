From: Andrew Beverley <andy@andybev.com>
Subject: Re: Dual WAN setup redux
Date: Wed, 01 Feb 2012 23:32:25 +0000
Message-ID: <1328139145.1891.45.camel@andy-laptop>
References: <201201271803.19071.dyioulos@onpointfc.com>
	 <1328128504.1891.38.camel@andy-laptop>
	 <201202011708.17672.dyioulos@onpointfc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <201202011708.17672.dyioulos@onpointfc.com>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1328139161;
	bh=3Ax4129sFvMXHqAPIg41RLnahKEZlLUAmUq8cCZWu6g=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:Mime-Version;
	b=nbsrXNMLQPm63WeobDzXXv+JenyAwJpGwwa5xH8/VAhW0gk7gcZr8xAlpDSxSjd/e
	 JtLkUDNWN29PTQjvz169Pxv4+qRH49SxOnItlawKiG7wj4Z7Z1nc/OBnijNZ9wYRS1
	 5cRm+/lm6ewEV/xXfvb24xpCWNvXmYW3SU3eYSk0=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Dimitri Yioulos <dyioulos@onpointfc.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>, "DiCecca, Caitlin" <cdicecca@onpointfc.com>

On Wed, 2012-02-01 at 17:08 -0500, Dimitri Yioulos wrote:
> > In summary, if I understand your setup correctly, you should be able to
> > assign *one* of your public IP addresses to eth3, and then assign
> > another one to the web server, assuming they're all in the same subnet
> > and you get the subnets correct.
>
> Thanks for your efforts, especially as you're dealing with someone as dense as 
> me.
> 
> On the test machine (call it box 3 in the diagram), I changed the ip to be 
> 75.x.x.28, netmask 255.255.255.248, network 75.x.x.24.  I set the gateway to be 
> 75.x.x.25 (eth3 address on the firewall/router).  I can't ping anything.

What are your actual IP addresses?

> At this point, is it a firewall rule issue?  If so, what is/are the rule(s) I 
> need to add?

You'll need something like "iptables -A FORWARD -o eth3 -j ACCEPT",
assuming that your default policy is DROP. Plus the associated inbound
connection ("iptables -A FORWARD -i eth3 -j ACCEPT"). Of course, you
should tighten these up, but I'd get it working first.

> If I had my choice, though, I'd rather assign an address of 192.168.1.x to the 
> test machine (as with the rest of the devices in the DMZ),

I suggest you get it working with the public IP address first, as it's
less things to configure.

Andy


