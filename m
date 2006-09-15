From: gabrix <gabrix@gabrix.ath.cx>
Subject: Re: netfilter Digest, Vol 26, Issue 11
Date: Fri, 15 Sep 2006 03:53:30 +0200
Message-ID: <450A079A.6050104@gabrix.ath.cx>
References: <20060914120926.896829AC14@mail.gabrix.ath.cx>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20060914120926.896829AC14@mail.gabrix.ath.cx>
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
To: netfilter@lists.netfilter.org

netfilter-request@lists.netfilter.org wrote:
> Send netfilter mailing list submissions to
> 	netfilter@lists.netfilter.org
>
> To subscribe or unsubscribe via the World Wide Web, visit
> 	https://lists.netfilter.org/mailman/listinfo/netfilter
> or, via email, send a message with subject or body 'help' to
> 	netfilter-request@lists.netfilter.org
>
> You can reach the person managing the list at
> 	netfilter-owner@lists.netfilter.org
>
> When replying, please edit your Subject line so it is more specific
> than "Re: Contents of netfilter digest..."
>
>
> Today's Topics:
>
>    1. NAT to one net, bridge to another (Mike Williams)
>    2. list down? (Mike Wright)
>    3. RE: Question on Layer 7 filtering (Maxime Ducharme)
>    4. connrate and Linux 2.6.14 and 2.6.16 (Pablo Sanchez)
>    5. Can iptables/ip6tables start and work in parallel (fwd)
>       (Vidya Ravipati)
>    6. Re: NAT to one net, bridge to another (Jan Engelhardt)
>    7. Re: need help with ipset (Jozsef Kadlecsik)
>    8. Re: Can iptables/ip6tables start and work in parallel (fwd)
>       (Pascal Hambourg)
>    9. iptables and Limewire (Sherwyn Greene)
>   10. How to detect the net flow for any given ip ? (Bo Yang)
>   11. Re: NAT to one net, bridge to another (Pascal Hambourg)
>   12. FW: iptables and Limewire (Sherwyn Greene)
>
>
> ----------------------------------------------------------------------
>
> Message: 1
> Date: Fri, 8 Sep 2006 12:50:29 +0100
> From: Mike Williams <mike@v6.gaima.co.uk>
> Subject: NAT to one net, bridge to another
> To: netfilter@lists.netfilter.org
> Message-ID: <200609081250.32329.mike@v6.gaima.co.uk>
> Content-Type: text/plain;  charset="us-ascii"
>
> Hey,
>
> Sometime in the next couple months we're going to be replacing a large part of 
> our infrastructure to increase the already excellent reliability (dual nics 
> and psus everywhere, etc).
> I'm just speccing up some kit for quote, and I'm slightly undecided as to the 
> best things I can do with the firewalls.
>
> At the moment I'm looking at NATting stuff to 3 different zones (private 
> networks), and hopefully bridging to a 4th zone.
> It'll have 10 nics, all paired off into round-robin bonds, so 5 usuable 
> interfaces. 1 colo facing, 3 private, 1 "public".
>
> Can you DNAT packets to IPs X, and Y, Z assigned to a bridge, while bridging 
> those IPs not assigned to it?
> (There is probably going to be a small amount of firewalling on the bridged 
> IPs)
>
> Thanks
>
>   
How can i give an ack window size = 0 by iptables without using the
patch o matic tarpit ?(II time!)

