From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: binding nntp to one interface
Date: Thu, 12 Sep 2002 11:22:20 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200209121022.g8CAMTv09831@vulcan.rissington.net>
References: <5.1.0.14.2.20020912090056.012e6d48@linda>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <5.1.0.14.2.20020912090056.012e6d48@linda>
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
To: netfilter@lists.samba.org

On Thursday 12 September 2002 8:05 am, Rasmus Reinholdt Nielsen wrote:

> Hi
>
> I have two different internet connections, to two different ISP's, set up
> as load balancing.
>
> My problem is that both my isp's have ip restricted their newsservers, so I
> need to bind all outgoing trafic on port 119 to a specific interface or ip.
> Anybody knows how to do this?

I'm not sure I understand the problem.

You have an nntp server set up to connect to your ISP's nntp server (either 
one, or both, of your ISPs).

Because your ISPs systems are very close (in network hops) to your external 
interface, surely your routing makes sure that requests to ISP A's nntp 
server go through the connection to ISP A, and requests to ISP B's nntp 
server go through the connection to ISP B ?

Then you just need to decide whether your nntp server is going to connect 
only to one, or to both, of your ISPs.

Alternatively, if your routing doesn't automatically determine which way to 
get to either of your ISPs servers, a few iproute2 commands should fix this.

I don't think you need to do anything with netfilter (in fact I don't think 
you can) because this sounds like a routing issue, not a filtering problem.

Antony.

-- 

Anyone that's normal doesn't really achieve much.

 - Mark Blair, Australian rocket engineer

