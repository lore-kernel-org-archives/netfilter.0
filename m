From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: iptables DNAT question with pppoe
Date: Tue, 4 May 2004 18:16:32 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405041816.32297.Alistair@nerdnet.ca>
References: <20040504213152.GA681@mail.ravecomm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040504213152.GA681@mail.ravecomm.com>
Content-Disposition: inline
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

On May 4, 2004 05:31 pm, Ed Thomson wrote:
> Hi-
>
> A little background first: I'm currently using iptables (linux kernel
> 2.4.25) on my router with 5 ethernet segments.   eth0 is inbound from my
> ISP, eth1 and eth2 are routable IP space assigned by my provider, eth3 and
> eth4 are private-numbered NATs.
>
> I just got a DSL from my telco and I'm using PPPoE to connect it (eth5 on
> the router) so that I can put a machine in for backup DNS and MX and manage
> it out of this machine room.  We have 5 static IPs from our DSL provider,
> which if it makes a difference, appears to really be a /29 by watching
> tcpdump on the ppp interface.
>
> The PPP is working, and the routes are correct so that the DSL IP addresses
> are routed out properly from the DSL.  (ie, I can ping the DSL IP and ssh
> to it.)
>
> I have inbound port forwarding setup with DNAT rules on my primary
> provider's interface, which work fine.  However, I'm trying to setup DNAT
> rules for my DSL address and failing.
>
> Here's what I'm trying to do:
>
> iptables -A INPUT -i ppp0 --protocol tcp --destination-port 587 -j ACCEPT
> iptables -A FORWARD -i ppp0 --protocol tcp --destination-port 587 -j ACCEPT
> iptables -t nat -A PREROUTING --protocol tcp -i ppp0 --destination <dslip>
> --destination-port 587 -j DNAT --to <mailserver>:587
>
	
	I don't see the need for the port number in the --to switch.
	You aren't changing the dport, (I could be wrong about the requirement)

	Why the INPUT rule? You are NOT accepting the packet locally ... you 
	intend to FORWARD it to the other network.

	Possible issue --- mailserver default gateway being on primary ISP
	address -- the packet is coming in dslip and being replied to via 
	primary ISP address space.

	(possible cure, SNAT the dslip packets so that the <mailserver> knows where
	to reply to *other* than the default gateway)

> <dslip> is the IP address assigned to my DSL by the remote server
> <mailserver> is the IP address of my mail server which is on eth1
>
> Then, from a random machine not on my network, I can ping <dslip>, but when
> I telnet to <dslip> port 587, the connection times out.  If I run tcpdump
> on ppp0, I do see the inbound packet to port 587 from the remote machine. 
> If I run tcpdump on eth1, I never see any packets to port 587.

	Sounds like a routing issue ... The packet comes in ppp but doesn't get
	moved out eth1....  If you put a LOG rule above and below the FORWARD 
	rule do you see the packets logged?

	I'd suggest the LOG rules and posting your routing table (sanitized for 
	public consumption of course, but with sufficient detail to decode)
>
> I don't know if the input and forward ACCEPT rules are required, but I've
> tried with and without.  The default rule for OUTPUT on the router is
> ACCEPT.

	The ACCEPT rules should be needed in a properly secured environment, 
	as the suggested policy for FORWARD table is DROP.
>
> I'm stumped, because this syntax works perfectly on the ethernet interface
> from my primary provider.  This may be a routing problem, but I don't see
> it. Is there any better diagnostics I can be doing to try to clear this up?

	LOG rules in FORWARD and POSTROUTING? 

>
> Thanks for any input.
>
> Sincerely,
> Ed Thomson <ethomson@ravecomm.com>

