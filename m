From: Andre Correa <andre.correa@pobox.com>
Subject: Re: Official IMQ support
Date: Mon, 12 Apr 2004 11:35:48 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <407AA944.6000604@pobox.com>
References: <20040408162803.3624.39959.Mailman@vishnu.netfilter.org> <1081447150.10056.60.camel@linux.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1081447150.10056.60.camel@linux.local>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: peter@empoweringsolutions.com
Cc: netfilter@lists.netfilter.org


Hi Peter, I'm one of the guys who are trying to keep IMQ alive. I can 
tell you that IMQ is stable in lots of scenarios and there are lots of 
people using it, but it still needs some work, that is ongoning now, 
before we really tell it is reliable.

We are still working on this issues:

- Locally generated traffic that may crash the systems
- To make IMQ work as kernel module in 2.6.x kernels
- Updating IMQ iptables patch for 2.6.x kernels

Feel free to joing our discussion list and to visit our site.

later

Andre


peter frischknecht wrote:
> Is there any chance that we will get IMQ incorporated in future releases of netfilter/kernel?
> 
> The development was picked up again (it was unmaintained).
> You can see it here:
> www.linuximq.net
> 
> They have patches for 2.4 and 2.6 kernels.
> 
> IMQ, for those who don't already know, IMQ allows for NATting AND providing Bandwidth Control up/downstream.  It Creates an Intermediate Queueing Device that can be used to do the QoS stuff, while the regular Ethernet adapter can perform the NAT.
> 
> I have been using IMQ for a very long time (Network with 500 users), and I can vouch for its stability.  It keeps me from having 2 daisy-chained routers on site.
> 
> Flames or comments are welcome...C'mon, anybody else out there uses IMQ?
> 
> Have a great day,
> 
> Peter Frischknecht
> 
> 
> 


