From: Jason Opperisano <opie@817west.com>
Subject: Re: Multiple subnets of the same IP space, different VLANs,
	same box...
Date: Tue, 15 Feb 2005 17:03:56 -0500
Message-ID: <20050215220356.GA20635@bender.817west.com>
References: <42122E91.2000707@joyner.ws>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <42122E91.2000707@joyner.ws>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Tue, Feb 15, 2005 at 12:17:05PM -0500, Aaron S. Joyner wrote:
> Okay, first let me admit that what I'm trying to do is a bit on the 
> weird side,

nah--this request comes up weekly...

> and stems from some historical requirements that I can not 
> easily change.  Having said that, here's the scoop.
> 
> I have numerous subnets, which are all identical.  Each has devices in 
> the 10.1.1.0/24 range that need to talk to a server at 10.1.1.1.  All 
> subnets for the sake of argument will be Class C ranges.  (1)  They are 
> all connected through Cisco switches, via 802.1q VLANs, back to a single 
> Linux box.  Each subnet comes in on a virtual interface (courtesy of 
> vconfig), such as eth1.10, eth1.11, etc.  I need to be able to respond 
> to each of those interfaces as 10.1.1.1, with (so far) only ICMP and UDP 
> traffic.

i can't *believe* i'm actually going to link to this, but the last
time someone asked something similar (k--so it was over a week ago),
i posted this:

  http://marc.theaimsgroup.com/?l=netfilter&m=110737820716813&w=2

it doesn't exactly match your situation, but the concept is the same--as
long as the machine in question only has to respond to requests you can
MARK the connection as it comes in, and route the reply based on the
mark, which is restored using CONNMARK.

as the OP never responded as to whether this suggestion worked, or ate
his dog, i still have no idea as to whether it works or not; as i never
tried it myself...so YMMV.

as someone else already suggested, you can also do this using NETMAP to
nat entire subnets to something unique.

IIRC--there was someone that asked about this, and i came up with:

  http://marc.theaimsgroup.com/?l=netfilter&m=110027573811157&w=2

again--no idea if this works or not...  but you should be able to get
the general idea of what's involved in this sort of chicanery.

-j

--
"Me lose brain? Uh, oh! Ha ha ha! Why I laugh?"
        --The Simpsons

