From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Help needed understanding what I am doing wrong.
Date: Tue, 4 Jun 2002 01:40:39 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206040040.g540eeA01426@Networker.rockstone.co.uk>
References: <004d01c20b5f$147b78b0$6301a8c0@JJONES1>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <004d01c20b5f$147b78b0$6301a8c0@JJONES1>
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
To: 'Iptables' <netfilter@lists.samba.org>

On Tuesday 04 June 2002 1:30 am, John Jones wrote:

> You have confirmed my suspicions, believe it or not!  (Actually, -I-
> can't believe I was thinking correctly after these last three days of
> mind-numbing hell!)
>
> We see the packets hitting .120, because of the counters on the IPTABLES
> output.  However, we are not seeing any sort of response back.  I
> suspected this, but assumed that since the IPTABLES machine (.120) is
> supposedly NAT'ing those incoming packets, they would be 'sourced' (from
> the DNS server's POV) from 10.0.0.3 (the internal interface of .120).
> Is this not how it works?  Does the DNS server not respond to the NAT'ed
> IP back to 10.0.0.3?  If not, that is where my assumption failed, and I
> kept looking for IPTABLES issues.

Remember there are two type of NAT: DNAT and SNAT.

DNAT changes the destination address of a packet, and leaves the source 
address alone.   You can only DNAT in the PREROUTING chain, before any 
routing decisions (which are based on the destination address, of course).

SNAT changes the source address of a packet, and leaves the destination 
address alone.   You can only SNAT in the POSTROUTING chain, just before the 
packet leaves the machine.

Therefore if your new IPtables firewall is doing DNAT on packets to port 53, 
the source address of those packets will be just the same as it always was, 
and the DNS server will try to reply to it (by whatever route it thinks it 
knows for an arbitrary source address - in this case your old IPchains 
firewall.....)

As a bit of a workaround, you could do both DNAT and SNAT on the new IPtables 
firewall, to make sure that the replies from your DNS server go back the way 
the initial enquiry came:

iptables -A PREROUTING -t nat -i eth1 -p tcp --dport 53 -j DNAT --to 10.0.0.10
iptables -A PREROUTING -t nat -i eth1 -p udp --dport 53 -j DNAT --to 10.0.0.10
iptables -A POSTROUTING -t nat -o eth1 -j SNAT --to 66.38.133.120
iptables -A POSTROUTING -t nat -o eth0 -j SNAT --to 10.0.0.2

This last rule will make sure that any packets going to 10.0.0.10 have a 
source address of 10.0.0.2, therefore when the DNS server replies, they'll go 
back through this firewall (which will automatically reverse translate them 
back to their original source (now destination) address), and you might even 
find that the system works :-)

Look on the bright side: you're learning about more than just IPtables.

By the way, I have a notice on the wall of my office:

90% of networking problems are routing problems.
9 of the remaining 10% are routing problems, but in the other direction.
The final 1% might not be routing, but check it anyway.



Antony.

