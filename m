From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: dnat with mac instead of ip address?
Date: Tue, 13 Jul 2004 13:26:35 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407131326.35933.Antony@Soft-Solutions.co.uk>
References: <OFECC7C3D2.669FB086-ONC1256ED0.003D8BE2-C1256ED0.0040B575@promon.cz>
Reply-To: netfilter <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <OFECC7C3D2.669FB086-ONC1256ED0.003D8BE2-C1256ED0.0040B575@promon.cz>
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
To: netfilter <netfilter@lists.netfilter.org>

On Tuesday 13 July 2004 12:46 pm, a.ledvinka@promon.cz wrote:

> net with dhcp + dynamic dns updates of local zone + router with masquerade
> and single external address.
>
> i am looking for regular DNAT behaviour to rewrite destination ip address
> of incoming packet but with single exception to current implementation:
> destination in rule is not explicitly ip address but hw address and i
> expect router to fetch ip address for this hw address from neighbour
> cache, etc. every time such packet comes.

Hm - that sounds the wrong way round to me - "I expect router to fetch ip 
address for this hw address from neighbour cache" - normally the router knows 
the IP address, and discovers the hardware address from the arp cache.

Where is the netfilter machine in all this setup (the one on which you're 
trying to change destination mac addresses)?

Suppose the netfilter machine can successfully change the destination mac 
address, but doesn't change the destination IP address - what's going to 
happen to the packet when it arrives at the destination mac?   Is that 
machien going to route it on to somewhere else?   If that is the case (you're 
forwarding the packet on to some other router, rather than a final 
destination machine), which not change the routing of the packet (the ROUTE 
target will let you specify an alternative gateway address to over-ride the 
default routing table)?

Regards,

Antony.

-- 
GIT/E d- s+:--(-) a+ C++++$(---) UL++++$ P+(---)>++ L+++(++++)$ !E W(-) N(-) 
o? w--(---) O !M V+++(--) !PS !PE Y+ PGP+> t- !tv@ b+++ DI++ D--- e+++(*) h++ 
5? !X- !R K--? G-

                                                     Please reply to the list;
                                                           please don't CC me.


