From: Rick Kennell <kennell@ecn.purdue.edu>
Subject: Re: port-based filtering of IPsec packets?
Date: 24 Jul 2003 15:50:26 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1059079825.6129.187.camel@innominate.rcs.purdue.edu>
References: <1058988918.6068.29.camel@insomnia.ecn.purdue.edu>
	 <20030723204240.GE23652@cannon.eng.us.uu.net>
	 <000e01c3515e$f8320830$05001aac@breton1>
	 <1058995435.6068.73.camel@insomnia.ecn.purdue.edu>
	 <20030724010857.GB25253@cannon.eng.us.uu.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030724010857.GB25253@cannon.eng.us.uu.net>
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
To: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Cc: netfilter@lists.netfilter.org

On Wed, 2003-07-23 at 20:08, Ramin Dousti wrote:
> On Wed, Jul 23, 2003 at 04:23:55PM -0500, Rick Kennell wrote:
> 
> > > Once the IPsec traffic has been terminated (decapsulated) you can
> > > filter it based on the services (tcp or udp ports) prior to that
> > > you only can filter based on the outer IP header...
> > 
> > OK.  Is there a way to decapsulate an ESP packet in iptables?
> 
> No, if the IPsec tunnel terminates on your firewall then you'll see the
> decapsulated packet while it's being forwarded to its internal destination.
> If it does not terminate on your firewall then you're out of luck and must
> only rely on the outer IP header to filter...
> 
> Ramin

I'm not using a tunnel.  I'll describe what (I believe) is happening:

I have two systems that are set up with an IPsec policy that requires
all packets sent between them to have an AH header and the payload
encapsulated in an ESP section.  Interaction with other hosts is normal.

When the packet comes in, netfilter sees it as an ESP packet.  Even the
INPUT chains in the mangle and filter tables see the packet as an ESP
packet.  I don't see a reason why the INPUT chains wouldn't want to see
a decrypted (or, as you put, decapsulated) packet.  Instead, it appears
that the packet is decapsulated after it's out of the filter table's
INPUT chain.  i.e. it gets decapsulated between netfilter and the
application.

Maybe the implementation should be changed to decapsulate the packet
just after the routing decision but before the INPUT chains?

Surely there must be some way of doing port-based filtering of ESP
packets that are known to be bound for the local host.

-- 
Rick Kennell <kennell@ecn.purdue.edu>
Purdue University Department of Electrical and Computer Engineering


