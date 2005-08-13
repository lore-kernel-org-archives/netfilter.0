From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Transparent proxy where source IP address remains unchanged --
 possible?
Date: Sat, 13 Aug 2005 01:40:57 -0500
Message-ID: <42FD95F9.4070504@riverviewtech.net>
References: <20050809012914.GA23108@bostoncoop.net>	<Pine.LNX.4.61.0508110741110.28320@yvahk01.tjqt.qr>	<20050811130700.GA15463@bostoncoop.net>	<Pine.LNX.4.61.0508112117380.23117@yvahk01.tjqt.qr>	<42FBB957.30003@rosi-kessel.org>	<42FC2D70.7000701@riverviewtech.net>
	<42FC9F1B.4060204@rosi-kessel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42FC9F1B.4060204@rosi-kessel.org>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

> Different subnets.

Hmm, this complicates things.  I will have to think on how to accomplish this on different subnets.  I would look in to the possibility of tunneling.  I think you would need to establish an IP-in-IP or GRE tunnel between the fake target and the real target so that you could pass traffic back and forth with out worrying about some intermediary router deciding that there is a better route for the traffic to take back to the original source system thus breaking the unDNATing that would be done by the fake target.

> Another complication is that some of the packets coming into realtarget
> will be coming in directly from their original source, so I couldn't
> just route *all* traffic back through faketarget.

*nod*  Yes this does complicate things.

> But is there some way I could tag packets coming in from faketarget, so
> that realtarget knows that all traffic returning back with that tag goes
> through faketarget?

Possibly.  Is the traffic in question traffic that is destined to a particular service or set of services or is the traffic just random port traffic directed at the faketarget?  If it is the former you could do the old ""Up and Over (and down) trick.  I mean you could DNAT the fraffic that was originaly destined to 22 to a different port on the realtarget thus allowing the realtarget to be inteligent in how it handled the traffic.  Namely realtarget would have to DNAT the traffic back down to it's original port (known by the fact that we are only DNATing traffic that was destined to the particular port in the first place) and MARK the connections.  This MARK value could then be used by an ip route rule on the real target to decide which routing table to use.

However if you use a tunnel to connect the fake target to the real target you would not need to do the up and over trick as you could just decide what to do / how to mark the packets based on which interface they came in to.  Then you are back to the mark value to decide which routing table to use to route the traffic correctly.



Grant. . . .

