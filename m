From: Ramin Alidousti <ramin@cannon.eng.us.uu.net>
Subject: Re: Source-based routing and DNAT
Date: Fri, 14 Jun 2002 21:53:19 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020615015319.GB7958@cannon.eng.us.uu.net>
References: <3D0A7CD7.2000204@go2guys.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <3D0A7CD7.2000204@go2guys.com>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Graves <dgraves@go2guys.com>
Cc: netfilter@lists.samba.org

On Fri, Jun 14, 2002 at 04:31:35PM -0700, David Graves wrote:

> I have a firewall with two internet connections. I use source-based 
> routing as described in the section 4.2.1 of the Advanced Routing & 
> Traffic Control HOWTO to ensure that the correct next-hop is chosen for 
> outgoing packets. This much works well.
> 
> The problem arises when I use a DNAT'ed connection to an internal 
> webserver. Using tcpdump I see that the syn+ack packet from the 
> webserver is un-NAT'ed correctly, but sent to the wrong next hop. 
> Something happens that prevents my "ip rule" from triggering.
> 
> Please do not reply and tell me that I can simply use a different 
> internal IP address to correspond to the different external IP address. 
> This is the "common workaround" and it is not acceptable for my purposes.
> 
> Does anyone have the right answer to this? Does "PREROUTING" not mean 
> pre-routing?

PREROUTING means pre-routing, yes, but the direction is very important.
At your external interface in pre-routing the DNAT rule will be applied.
This is when the SYN comes in. Then when your server replies (the src
is still not de-DNATted) the routing decision is made. Right before
the packet is being sent out through an interface the src will be de-DNATted.

So, if your question was whether the DNAT and de-DNAT are both done in
pre-routing, the answer is no. DNAT is done in pre-routing and de-DNAT
is done in post-routing.

So, if you have an ip rule which selects a next hop based on the src, then
you cannot rely on the fact that the replies will go through that ip rule
with the correct src (as your gateway would send out).

Ramin

> Or is the ip rule that selects a route table run before 
> PREROUTING?
> 
> Even if the answer is, "it can't be done", can anyone definitively say 
> so and why?
> 
> Thanks for your great work guys!
> -David Graves
> 
> 
> 

