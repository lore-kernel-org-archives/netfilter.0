From: "Marius Mertens" <marius.mertens@gmx.de>
Subject: Re: Private traffic seen on public NATed interface - Linux
	2.6.10-11 tested
Date: Wed, 16 Mar 2005 15:36:02 +0100
Message-ID: <006a01c52a35$821191f0$4206a8c0@loki>
References: <423737E2.4050201@ednet.ns.ca>
	<42374547.7030204@fastwebnet.it><42374B1B.4090901@ednet.ns.ca>
	<4237EC2D.4050807@fastwebnet.it> <42382B40.1060108@ednet.ns.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: NetFilter <netfilter@lists.netfilter.org>

On Wednesday, March 16, 2005 1:49 PM,
James MacLean wrote:

> [...]
> May I suggest someone else even try it at home :), or on a half busy
> box? We _are_ honestly seeing this at different sites with different
> rules, but with the common SNAT for private IP space.
> [...]

Sorry I cannot provide anything to solve your problem, but maybe you want to 
check the following:
I also had (and already have, I just ignore it at the moment) a quite 
similar problem: Some packets that should have been modified by NAT were not 
processed, but in the direction "Internet --> NATted Clients" (exactly the 
opposite direction that makes problems on your setup) so that missed packets 
hit the INPUT rules of my router.
If you want to have more detailed information please see 
http://lists.netfilter.org/pipermail/netfilter/2005-January/057795.html
Now to the property you might want to check: All packets being not correctly 
processed by NAT had the state INVALID. I am not sure when/why the 
connection became INVALID, but since there has been traffic in both 
directions before, it it unlikely that it was INVALID in the first place.
Perhaps your not processed packets are also considered INVALID?
This is of course far away from a solution (since it is still unclear, why 
they become INVALID), but if we can find further criteria that applies to 
all these similar problems, maybe we are able to track it down.

Marius 


