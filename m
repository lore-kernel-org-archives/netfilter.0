From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Natted packets
Date: Sun, 14 Jan 2007 23:38:08 -0600
Message-ID: <45AB1340.3090008@riverviewtech.net>
References: <45A2BB09.90405@eternet.cc>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <45A2BB09.90405@eternet.cc>
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
To: Mail List - Netfilter <netfilter@lists.netfilter.org>

On 01/08/07 15:43, Lucas Diaz wrote:
> Is it possible to know if a packet passing through my router is (s)natted?
> And the original (s)natted IP?

I'm not sure if this applies or not, but something that I just read made 
me think about your question.

If you are wanting to prevent someone on your network from NATing 
multiple IPs behind a router, say you are a provider for a building, you 
might be able to stop them with this.

Set the TTL of packets passing back through your router to your clients 
to 1.  This will probably cause any internal router to drop packets 
seeing a TTL exceeded.

I will not say any thing to the effect that this will have on things 
like TraceRoute, other than it will probably have an effect.

Also, this would be fairly easy to get around on a capable router, say 
Linux, in such as it would be easy to detect an inbound packet with a 
TTL of 1 and set it higher.



Grant. . . .

