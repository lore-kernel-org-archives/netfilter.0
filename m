From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: UDP for HTTP forwarding??? Prerouting, postrouting, output
Date: Thu, 6 Nov 2003 18:53:48 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311061853.hA6Irqj14157@agate.rockstone.co.uk>
References: <BEA73FB6B8F62545A5B2818724D0DF2902E70868@u.library.Arizona.EDU>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <BEA73FB6B8F62545A5B2818724D0DF2902E70868@u.library.Arizona.EDU>
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
To: netfilter@lists.netfilter.org

On Thursday 06 November 2003 5:54 pm, Han, Yan wrote:

> I am confused with the IPTables. Please see attachment for the script.
> Some input will be greatly appreciated for one of these questions. (I know
> these are long questions!)
>
> Basically, we want to forward packets from [$Fido] to [$AtlasDev], the
> script works, but my questions remain:
>
> 1. Why do we need UDP for forwarding the HTTP packets?  (I tried to disable
> Udp lines, but then the script will not work!)

I find this very hard to believe.   The lines you refer to specifically 
relate to port 80, and HTTP simply does not use UDP port 80.

The only thing I can think which you might need UDP for is DNS, but that 
works on port 53.

I can't believe you need the UDP port 80 rules for HTTP to work.

Same thing applies for your SSH rules - it does not use UDP, so you only need 
the TCP rules on port 22 for this to work.

> 2. What the purpose of PREROUTING, POSTROUTING and OUTPUT?

PREROUTING allows you to perform Destination NAT on packets coming in to the 
machine, before it has been decided whether they are going to the machine 
with the netfilter rules on, or being routed to somewhere else.

POSTROUTING allows you to perform Source NAT on packets leaving the machine, 
after they have been routed from some other source.

OUTPUT is both a normal filtering chain, which allows you to control what 
packets are allowed out of your machine (originating from the machine itself, 
not being routed through it from somewhere else), and also a nat chain for 
doing some special Destination NAT if you don't want to tell local 
applications the real IP address they should connect to.

> (We need all of
> them in the script to make the HTTP work, but ssh only needs PREROUTING and
> POSTROUTING. We guess that HTTP need to send packets back to the client,
> while SSH builds up a channel so no need for OUTPUT. Is this guessing
> correct? )

No.   Both HTTP and SSH are TCP-based protocols, so work in fundamentally the 
same way - a client connects to a server, and the server replies.   If you 
are DNATting packets between client and server, netfilter will automagically 
do the corresponding SNAT for you on the reply packets.   You do not need 
explicit rules to perform this (and indeed if you look at the packet counters 
with "iptables -L -n -v" and "iptables -L -n -v -t nat" you will see that the 
reply packets do not actually pass through your rules anyway - they are 
handled transparently in the background).

I think the rules you have listed are more than you need - try setting the 
counters to zero, send & receive some HTTP / SSH packets, then look at the 
counters.   Any which are still zero tells you the rule did nothing.

Regards,

Antony.

-- 

Software development can be quick, high-quality, or low-cost.

The customer gets to pick any two out of three.
                                                     Please reply to the list;
                                                           please don't CC me.

