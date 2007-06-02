From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: Re: syn DDoS attack solution
Date: Sat, 2 Jun 2007 15:07:44 -0400 (EDT)
Message-ID: <Pine.LNX.4.64.0706021446290.18235@darkstar.sysinfo.com>
References: <465EF582.4070904@bgs.hu> <015e01c7a3bf$64fbe7e0$2ef3b7a0$@COM>
	<465FEA82.709@bgs.hu> <007101c7a45d$bc50e380$34f2aa80$@COM>
	<46603D22.4020608@bgs.hu>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <46603D22.4020608@bgs.hu>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Bgs <bgs@bgs.hu>
Cc: Ric Messier <kilroy@WasHere.COM>, netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Fri, 1 Jun 2007, Bgs wrote:

>
> Sorry if my first mail was misleading, I only slept about 5-6 hours this week 
> in all :/
>
>>> How is the handling of ESTABLISHED connections implemented in the
>>> TCP/IP
>>> stack?
>> 
>> There is likely a timer somewhere to time out connections that are just
>> hanging around doing nothing. You'd have to dig around to find it and turn
>> it down. You could also use something like tcpkill to get rid of them for
>> you. 
>
> What I'd like to achieve is different from the normal tcp timeouts. I only 
> want a different (quite short in terms of everyday tcp traffic) timeout for 
> connections that have not sent any data after the tcp handshake. The 
> connections that did any traffic would become normal or 'legitimate' and the 
> usual tcp timeouts would apply.
>
>
> About the netlink approach, here is what I was thinking about. I have never 
> coded in the netlink/netfilter space so I'm completely in the dark if this 
> can be done at all or not:
>
> Client sends SYN to server. It arrives to the firewall. An info is sent to 
> the userspace portion and the SYN packet is DROPed. The user space program 
> logs the SYN packet and sends out an appropriately constructed SYN/ACK to the 
> client. Client sends the ACK. The info is sent to util which logs the packet 
> and puts the connection in allowed state as it knows from it's own db that 
> the tcp handshake was ok. At this point it either starts the next phase or 
> waits for the first data packet and starts the next phase then (allowing the 
> data packet after it). The next phase is: userland replays the SYN handshake 
> with the server thus making it receptive to the tcp stream to come. Through 
> netlinks firewall part it would allow all subsequent traffic.
>
> The main point is almost identical to the syn proxy thingie in bsd and ios, 
> the main difference would be the ability to add some policy about when and 
> how to let the traffic through to the server. For example with delayed 
> replay, connections in ESTABLISHED state but without data would be dropped 
> from the replay db stopping the culprit at the firewall.
>
> Just a thought... can it be done (technically) or should I simply go to bed 
> :)
>



DDOS attacks work against resources, the tcp/ip stack <half opens (syn's) 
left hanging>, memory <cache of data in your syn-flood db>, drive space 
<system logs with overzealous logging of packet flow in limited space, or 
how much disk is devoted to a syn-flood db>, the size of your pipe...


In any but the most simplistic low bandwith attacks there is little one 
can do in such cases but either ride out the storm or go upstream for help in 
resolution <mist often a block of the damaging traffic>.  Even an 
semi-decent firewall defense against a simple low bandwith syn flood will 
need to be totally rework for defense in the case of a simple lowbandwidth 
ping flood, etc.  And once the attack level is amplified above the flow 
capabilities of your pipe, all bets are off.  In a serious flooding attack 
the firewall simply become a stopgate from preventing work on the local 
net from being affected.  There have been and will continue to be some 
rather decently funded companies with some fairly decent pipes wiped out 
of business or their internet presence closed up due to some of these 
kinds of attacks over extended periods of time.  Goverments across the 
globe have had internet services disrupted for extended periods. 
Microsoft has had to relocate servers to new net/ip addresses to divert 
the flow from such attacks and stay somewhat online...


Best way to avoid such problems is to not get into a whose prick is bigger 
contest with some kid in IRC that controls a 10,000-100,000 or larger 
series of zombies in their botnet.

It's the nature of the game, all in the design...



Thanks,

Ron DuFresne
- -- 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         admin & senior security consultant:  sysinfo.com
                         http://sysinfo.com
Key fingerprint = 9401 4B13 B918 164C 647A  E838 B2DF AFCC 94B0 6629

...We waste time looking for the perfect lover
instead of creating the perfect love.

                 -Tom Robbins <Still Life With Woodpecker>
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)

iD8DBQFGYcADst+vzJSwZikRApiLAJ444UDiM3HZnoNLO7ECHocT31r88wCeMhmS
Zv2jS1v6fCcb3gLbx9+KqHQ=
=iZ/G
-----END PGP SIGNATURE-----

