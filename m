From: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Subject: Re: port-based filtering of IPsec packets?
Date: Thu, 24 Jul 2003 17:36:51 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030724213651.GD26983@cannon.eng.us.uu.net>
References: <1058988918.6068.29.camel@insomnia.ecn.purdue.edu> <20030723204240.GE23652@cannon.eng.us.uu.net> <000e01c3515e$f8320830$05001aac@breton1> <1058995435.6068.73.camel@insomnia.ecn.purdue.edu> <20030724010857.GB25253@cannon.eng.us.uu.net> <1059079825.6129.187.camel@innominate.rcs.purdue.edu>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1059079825.6129.187.camel@innominate.rcs.purdue.edu>
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
To: Rick Kennell <kennell@ecn.purdue.edu>
Cc: Ramin Dousti <ramin@cannon.eng.us.uu.net>, netfilter@lists.netfilter.org

On Thu, Jul 24, 2003 at 03:50:26PM -0500, Rick Kennell wrote:

> I'm not using a tunnel.  I'll describe what (I believe) is happening:
> 
> I have two systems that are set up with an IPsec policy that requires
> all packets sent between them to have an AH header and the payload
> encapsulated in an ESP section.  Interaction with other hosts is normal.
> 
> When the packet comes in, netfilter sees it as an ESP packet.  Even the
> INPUT chains in the mangle and filter tables see the packet as an ESP
> packet.  I don't see a reason why the INPUT chains wouldn't want to see
> a decrypted (or, as you put, decapsulated) packet.  Instead, it appears
> that the packet is decapsulated after it's out of the filter table's
> INPUT chain.  i.e. it gets decapsulated between netfilter and the
> application.
> 
> Maybe the implementation should be changed to decapsulate the packet
> just after the routing decision but before the INPUT chains?
> 
> Surely there must be some way of doing port-based filtering of ESP
> packets that are known to be bound for the local host.

Then I'm sorry. I don't know. I've always had problems with the interaction
between FreeS/WAN and netfilter. If the traffic is meant for the localhost
then, you're right, it should be visible in the clear to the INPUT chain.
The only thing I heard which is promissing is 2.5 has native IPsec support
in the kernel which is supposed to work well with the other subsystem.

Ramin

> -- 
> Rick Kennell <kennell@ecn.purdue.edu>
> Purdue University Department of Electrical and Computer Engineering

