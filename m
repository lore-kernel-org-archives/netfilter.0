From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Is this possible?
Date: Thu, 22 Apr 2004 13:12:50 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404221312.50864.Antony@Soft-Solutions.co.uk>
References: <4087ACE0.1020006@uk.thalesgroup.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <4087ACE0.1020006@uk.thalesgroup.com>
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

On Thursday 22 April 2004 12:30 pm, Fisher Alex wrote:

> Hi.
>
> I'll do my best to explain what I'm trying to acheive with a linux box
> and 3 NICS.
>
> I have two sets of systems.  Each system has about 30 IP addresses
> spread across various bits of hardware.  The two systems are identical
> (ie have the same 30 IP addresses).  The addresses are all part of the
> class C subnet 192.168.0.*
>
> The IP addresses for each system are now set in stone and can't be
> changed.  Furthermore, similar addresses are already in use on our network.
>
> I would like PCs on the normal network to be able to connect with either
> system by addressing them with addresses off the 172.26.158 subnet.
> I'll assign 30 of these IPs to each system.
>
> For example. 172.26.158.10 might be mapped onto 192.168.0.2 on eth1
> whilst  172.26.158.50 might be mapped onto 192.168.0.2 on eth2
>
> Is this at all possible?  I assume I'll need to use at least DNAT but
> also apply some other trickery to route to the correct interface.  As a
> newbie to IPTables, I'm not sure how I might even begin to set up rules
> for this.

This is not really a netfilter question - sure, you need to use DNAT, but once 
your routing (to get to the correct destination system) is working, the 
netfilter bit is simple.

I cannot resist challenging your statement "The IP addresses for each system 
are now set in stone and can't be changed", since setting up sensibly 
separate subnets with independent network addresses would be the "correct" 
solution to this problem.

However, if someone is adamant that you need to set up network connectivity 
between machines with such an unfriendly combination of IP addresses, I 
suggest you simply set up multiple host-specific routes on the netflter 
machine, telling it where to find each different 192.168.0.* destination 
address, and don't have a standard 192.168.0.0/24 route on that system.

Therefore, set up the routing so that the firewall machine can find each 
required destination IP, and then netfilter will go on top without a problem.

Regards,

Antony.

-- 
How I want a drink, alcoholic of course, after the heavy chapters involving 
quantum mechanics.

 - 3.14159265358979

                                                     Please reply to the list;
                                                           please don't CC me.


