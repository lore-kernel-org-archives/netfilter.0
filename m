From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: open port to specific ip address
Date: Mon, 10 Nov 2003 15:44:57 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311101545.hAAFj6j16919@agate.rockstone.co.uk>
References: <!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAAHvCSmpkyA0+lP5YKpr7djsKAAAAQAAAAX5TmzymhnkKWYhlmn/VLAwEAAAAA@petzetakis-africa.co.za> <200311101326.hAADQXj16843@agate.rockstone.co.uk> <1068476240.1530.30.camel@valhalla>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1068476240.1530.30.camel@valhalla>
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
To: netfilter@lists.netfilter.org

On Monday 10 November 2003 2:57 pm, Chris Brenton wrote:

> On Mon, 2003-11-10 at 08:26, Antony Stone wrote:
> > I assumed (maybe wrongly?) that because Lohan specified an internal IP
> > address, the access was required from the internal network.
>
> Obviously Lohan needs to be the one to clarify, but I think your right.
> Going back through the thread, it looks like the access is internal to
> internal, with forwarding to an external.
>
> Of course this is still going to give him trouble if 10.10.10.41 is part
> of the local subnet. Systems are going to ARP for this IP, not send the
> traffic to their default gateway.

That's why I included:

ip addr add dev eth1 internal_ip

as part of the original solution I proposed.

> You might be able to use publish ARP on the internal interface of the
> firewall, but that assumes a flat subnet and starts to get real messy.

Huh?   What do you mean by a 'flat subnet'?   Either the address is on a 
local subnet, in which case arp sorts things out with the above ip addr 
command, or else it's on the other side of a router, in which case there's no 
problem because it gets forwarded anyway.

What's messy about this solution?

Antony.

-- 

Behind the counter a boy with a shaven head stared vacantly into space,
a dozen spikes of microsoft protruding from the socket behind his ear.

 - William Gibson, Neuromancer (1984)
                                                     Please reply to the list;
                                                           please don't CC me.

