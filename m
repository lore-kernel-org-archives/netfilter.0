From: Thomas Jones <admin@buddhalinux.com>
Subject: Re: Cleanest way to deal with loopback interface?
Date: Mon, 18 Apr 2005 16:16:52 -0500
Message-ID: <1113859011.22084.85.camel@bodhittsatva>
References: <1113425449.3544.177.camel@seberino.spawar.navy.mil>
	<20050413211349.GA31336@bender.817west.com>
	<425DC2DA.7010608@riverviewtech.net>
	<20050417232709.GA28390@spawar.navy.mil>
	<1113782691.22084.23.camel@bodhittsatva>
	<1113854560.3544.215.camel@seberino.spawar.navy.mil>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1113854560.3544.215.camel@seberino.spawar.navy.mil>
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
To: Christian Seberino <seberino@spawar.navy.mil>
Cc: netfilter@lists.netfilter.org

On Mon, 2005-04-18 at 15:02, Christian Seberino wrote:
> Thomas
> 
> Thanks for the reply.  Jason at beginning of this thread
> surprised all of us by saying that Linux kernel
> drops 127.0.0.1 address from NICs already!?!
> 
> No need to filter it out from Internet traffic!
> 
> Agreed?
> 
> Chris
<snip>
Well. As I stated previously, according to the TCP/IP specifications it
shouldn't.

However, I don't think that the statement is entirely true. And this may
just be specific details but it needs to be understood. The kernel
doesn't drop the packet per se, because according to the following
standards; it is never supposed to make it to the NIC anyways. It is
stopped at the network layer and processed during routing
considerations.

Here is the relevant entries:

RFC 3330 Special-Use IPv4 Addresses --- Section 2
<code>
127.0.0.0/8 - This block is assigned for use as the Internet host
   loopback address.  A datagram sent by a higher level protocol to an
   address anywhere within this block should loop back inside the host.
   This is ordinarily implemented using only 127.0.0.1/32 for loopback,
   but no addresses within this block should ever appear on any network
   anywhere [RFC1700, page 5].
</code>

Now we review RFC 1700 IANA Assigned Numbers
<code>
(g)   {127, <any>}
Internal host loopback address.  Should never appear outside
a host.
</code>

So there we go. According to the IETF standards body, it shouldn't happen.
But, this has nothing to do with the operating system. This is protocol stack
interdependent. If a person were to completely remove the TCPIP protocol
implementation from their OS, it would behave differently due to the fact that
there would not be an intermediate structure to process the information. 

For instance if you remove the use of a particular protocol from a specific 
interface does the traffic continue to be processed and transmitted to the 
cable medium? No. Because there is no longer the capability for the stack
to transfer the traffic down to the physical layer. 

However, the kernel is intact. It is a seperate object in and of itself.

I think what Grant is saying is that even though according to the IETF standards
it shouldn't work; it still is a possibility. The "Ping-of-Death" attack does
not follow the standards either. But, everyone knows that it is/was still effective.
Source address spoofing does not follow the standards as well. However, this too
is a real-words issue at hand. Thusly, it needs to be addressed as a possible point 
of failure in the systems security posture.

BTW, as a reference.

RFC 3682 Generalized TTL Security Mechanism
<code>
   (ii)   It is common practice for many service providers to ingress
          filter (deny) packets that have the provider's loopback
          addresses as the source IP address.
</code>

Seems like it is known to be a possible issue, and is being addressed as such.

HTH.
Thomas


