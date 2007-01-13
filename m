From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Natted packets
Date: Fri, 12 Jan 2007 23:38:09 -0600
Message-ID: <45A87041.4070500@riverviewtech.net>
References: <45A2BB09.90405@eternet.cc> <45A306C2.7000809@riverviewtech.net>
	<45A38372.7090609@eternet.cc>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <45A38372.7090609@eternet.cc>
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

On 01/09/07 05:58, Lucas Diaz wrote:
> My question is if some other router somewhere else on the net (inside my 
> lan) has NATed the traffic?
> And the original NATed IP?
> This router NATing traffic and my router are in the same network...

Ok, you are wanting to see if there is an additional NATing router 
somewhere in your LAN?

(I'll presume yes for the rest of this post)

There are some ways that you can attempt to find IP addresses with 
specific types of behavior (all beyond me) that can be indicative of 
NATed IPs.  I believe that (some of) these tests are based on the TCP 
sequence number.  More specifically, an IP stack *usually* behaves in a 
predictable way.  Thus you can look at the TCP sequence numbers of 
packets coming from an IP address to see patterns of ranges / sliding 
windows of TCP sequence numbers.  If there are multiple (fuzzy) 
definable groups, there is a good chance that each group is a given 
computer.  However, this can possibly be hidden by the NATing device.

Much beyond that and I don't know any more.  However, I do know that 
there is a lot of discussion about this on the reverse side on the net. 
  Namely I have stumbled across a lot of discussion where people were 
trying to use NATing technology on providers that did not want them to, 
i.e. they charged per device, and what they did to hide them selves from 
the provider.



Grant. . . .

