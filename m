From: "Alexis" <alexis@attla.net.ar>
Subject: Re: Firewall four nics, two separate routes
Date: Mon, 26 Jan 2004 23:37:30 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000f01c3e47e$830e4ab0$0200000a@heretic>
References: <KMS-272302109-548@mail.espgroup.net> <002f01c3e47a$7a6f3f80$0200000a@heretic>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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

its too late at night, i drive so many kms today, i cant write.

this is the real message


think lan1 lan2 wan1 wan2

the firewall box, must have NO default route

ip rule add from lan1 lookup table 5
ip rule add from lan2 lookup table 6
ip route add default via wan1 table 5
ip route add default via wan2 table 6

sorry


----- Original Message ----- 
From: "Alexis" <alexis@attla.net.ar>
To: "netfilter" <netfilter@lists.netfilter.org>
Sent: Monday, January 26, 2004 11:08 PM
Subject: Re: Firewall four nics, two separate routes


> think lan1 lan2 wan1 wan2
>
> the firewall box, must have NO defaul route
>
> ip rule add from lan1 lookup table 5
> ip rule add from lan2 lookup table 6
> ip route add default via wan1 table 5
> ip route add default via wan1 table 6
>
> thats it.
>
>
>
> ----- Original Message ----- 
> From: "Ryan Johnson" <rjohnson@espgroup.net>
> To: <netfilter@lists.netfilter.org>
> Sent: Monday, January 26, 2004 2:49 PM
> Subject: Firewall four nics, two separate routes
>
>
> Hi all,
>
> I have a firewall with four nics, two external nics with two public ips
and
> two internal nics with private ips (two different networks). What I would
> like to do is force all traffic from each internal network to its
> corresponding external nic. I believe the only solution to this is to use
> iproute2, but I have had to luck. So traffic from internal net1 will be
> routed out external nic1, then the other side, internal net2 will be
routed
> out the external nic2. Internal net1 traffic should never go out external
> nic2 and internal net2 traffic should never go out external nic1.
>
>
> Thank you in advance,
> Ryan
>
> Ryan Johnson
> Security Architect
> ESP Group
>
>
>
>
>
>



