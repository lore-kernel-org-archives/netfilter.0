From: Jason Cooper <jason@lakedaemon.net>
Subject: Re: Bridging / VLANs / ebtables
Date: Tue, 16 Dec 2014 21:41:46 -0500
Message-ID: <20141217024146.GV967@titan.lakedaemon.net>
References: <20141216213425.GU967@titan.lakedaemon.net>
 <31506370.345790.1418766419268.JavaMail.root@rockbochs.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lakedaemon.net;
	s=mail; t=1418784106;
	bh=cy/XDIQULviZnJCTN3kNGx7Vd4l+eLBi/S8EV3n9vJY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=juzbSykNb8BES1iTy0GtxegqxdcC9QCNvG8v7Mg1MwQThd84/+fB5fC26wpRBgwr/
	 6wzJJWUCDhYwEXtlnWf1jWdyjufs5SmSMFNCbLqtbzfJ/pB9XjawB9sp/yBhoraeYU
	 SZZIHgW3EHDp9lMLL0UYkda5XAFMcvqOPT+CqAymQ8Hjvcb1BQ1VZ+tOIXHnk9AlKi
	 qCUuLfu7PKNAt96rDyU8VUENTngeyMJS1fQvcv2/p4lod+v716v3l6p3V+CUVmIOk8
	 7cNM620R8DhKUzpBDAYsn7QtTU3lCBpSCuRwRulzHDJn3REE6tFTQnrTAHherds0ra
	 SFx+IT3zky1Dg==
Content-Disposition: inline
In-Reply-To: <31506370.345790.1418766419268.JavaMail.root@rockbochs.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tim Nelson <tnelson@rockbochs.com>
Cc: netfilter@vger.kernel.org

On Tue, Dec 16, 2014 at 03:46:59PM -0600, Tim Nelson wrote:
> ----- Original Message -----
> > iiuc, you have the following types of packets on eth0:
> > 
> > 	x.x.x.x/24
> > 	y.y.y.y/24
> > 	z.z.z.z/24
> > 	vlan2:a.a.a.a/24
> > 	vlan3:b.b.b.b/24
> > 
> > So, you need x.x.x.x/24, y.y.y.y/24, and z.z.z.z/24 to get routed
> > into vlan3.  Does traffic need to go the other way?  Is there
> > broadcast or multicast traffic to worry about?
> > 
> 
> Greetings Jason-
> 
> Specifically, I have:
> 
> eth0: x.x.x.x/24
> eth0.2: y.y.y.y/29
> eth0.3: z.z.z.z/24
> 
> After bridging eth0 and eth0.3, devices on eth0.3 will utilize the
> same address space as that present on eth0 native (x.x.x.x/24). Of
> course, traffic to/from eth0.2 would continue to be functional.
> Traffic *does* need to operate in both directions, and yes there will
> be broadcast traffic originating from eth0.3, as a DHCP request, which
> would be answered by a DHCP server on the eth0 native connected
> network.

I'm sure I'm missing something, but a quick test in a VM worked:

[root@triton] # brctl show
bridge name     bridge id               STP enabled     interfaces
br0             8000.00163e1c9a87       no              eth126
                                                        eth126.3

eth126.3 did not have an ip address.  eth126 did, but you have to set
both interfaces promiscuous and 0.0.0.0.  Then, assign an IP in the
range z.z.z.z/24 to br0.

hth,

Jason.
