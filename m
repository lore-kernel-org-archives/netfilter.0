From: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Subject: Re: NAT setup
Date: Fri, 19 Dec 2003 19:30:51 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031220003051.GI17702@cannon.eng.us.uu.net>
References: <1071872488.2427.76.camel@localhost>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1071872488.2427.76.camel@localhost>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ben Becker <bbecker2@cfl.rr.com>
Cc: netfilter@lists.netfilter.org

Hi Ben,

Very interesting concept. There are two major parts to this:

1) Outbound packets from those static IP's to your gateway.
   this can be done by enabling proxy-arp on your gateway
   to answer to any arp request. This way the clients would
   hand over their traffic to your gateway. Subsequently
   your gateway would SNAT them and throw it on the Internet.

2) Inbound reply packets coming from the outside. This is a bit
   tricky because, once they're in and de-SNATed, your gateway
   must know where to send them to.  Since your gateway has only
   one default route and no knowledge about those static IP's
   behind it, it would automatically send the reply packets back
   to the Internet. You might overcome this by blindly forwarding
   these ESTABLISHED incoming packets through your internal interface
   but you still need to somehow do an ARP for an IP outside your
   LAN segment. At this point I don't have any simple solution
   for that. But there are some very sharp ARP people here on the
   list who could hack something together for you or give you
   a pointer to an already hacked solution.


Ramin


On Fri, Dec 19, 2003 at 05:21:29PM -0500, Ben Becker wrote:

> Hello everybody,
> 
> I'm trying to figure out a way to set up basic NAT, but with the ability
> to allow users on the local side to use any static IP configuration. 
> Quick Example: somebody has a static IP configured on their laptop,
> stays at a hotel with Internet access, and will be able to browse the
> Internet without changing their IP settings.
> 
> My first question is: does anybody know what this feature is called? 
> Second question: Is it possible to do this with netfilter?  I'm thinking
> this would require creating a new virtual interface for each user's
> configuration to match their gateway (among other things), but I'm
> hoping netfilter has some magical way of doing this (hoping).  If not,
> does anybody know of any software that can do this?
> 
> 	Regards,
> 	Ben Becker
> 

