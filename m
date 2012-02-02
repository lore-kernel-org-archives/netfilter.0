From: Andrew Beverley <andy@andybev.com>
Subject: Re: Dual WAN setup redux
Date: Thu, 02 Feb 2012 07:35:20 +0000
Message-ID: <1328168120.18690.19.camel@andrew-desktop>
References: <201201271803.19071.dyioulos@onpointfc.com>
	 <1328128504.1891.38.camel@andy-laptop>
	 <201202011708.17672.dyioulos@onpointfc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <201202011708.17672.dyioulos@onpointfc.com>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1328168125;
	bh=G4cUFYbq+lR7NcMDrYrtTgCxie9W9n6w9AxNhJwBc2g=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:Mime-Version;
	b=t+582d/55lE4w9f4iVc1CuIWgJrC20OcmzPdR+h0NYg/J9JcWljMQBIn7ROcjKvcU
	 36+Vi7IhgPfEy2szNUgGSSNEE6MS9B9pR93sh+49nd3AHMbXzDemZm+S+uphxKB1gE
	 WmWTR3YVlf3rRKr9XLfWODaqZ7PKw1xiDZ9+20ao=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Dimitri Yioulos <dyioulos@onpointfc.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>, "DiCecca, Caitlin" <cdicecca@onpointfc.com>

On Wed, 2012-02-01 at 17:08 -0500, Dimitri Yioulos wrote:
> On the test machine (call it box 3 in the diagram), I changed the ip to be 
> 75.x.x.28, netmask 255.255.255.248, network 75.x.x.24.  I set the gateway to be 
> 75.x.x.25 (eth3 address on the firewall/router).  I can't ping anything.

I wasn't very clear in my last post. You'll need to separate out that
small block into different subnets, as they're on different interfaces.

> If I had my choice, though, I'd rather assign an address of 192.168.1.x to the 
> test machine (as with the rest of the devices in the DMZ), and make it use the 
> WAN2 connection instead of WAN1 that the other devices are using.

Actually, it's probably as easy to do this. Set the 192.168.1.x IP
address on the test machine, then try pinging eth3's IP address from the
test machine. That should work. Then try the gateway on the same subnet.
That should also work.

Once that's working, then you should be able to do a DNAT on the
firewall to send packets coming in on eth3 to the test machine
(192.168.1.x).

Andy


