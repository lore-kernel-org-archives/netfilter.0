From: "John Jones" <jjones@merlintechnologies.com>
Subject: RE: Help needed understanding what I am doing wrong.
Date: Mon, 3 Jun 2002 18:15:49 -0700
Sender: netfilter-admin@lists.samba.org
Message-ID: <005101c20b65$5de498a0$6301a8c0@JJONES1>
References: <200206040040.g540eeA01426@Networker.rockstone.co.uk>
Reply-To: <jjones@merlintechnologies.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <200206040040.g540eeA01426@Networker.rockstone.co.uk>
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
To: Iptables <netfilter@lists.samba.org>

> Remember there are two type of NAT: DNAT and SNAT.
> 
> DNAT changes the destination address of a packet, and leaves 
> the source 
> address alone.   You can only DNAT in the PREROUTING chain, 
> before any 
> routing decisions (which are based on the destination 
> address, of course).
> 
> SNAT changes the source address of a packet, and leaves the 
> destination 
> address alone.   You can only SNAT in the POSTROUTING chain, 
> just before the 
> packet leaves the machine.

Right, knew that.  I -did- read all the docs, believe it or not. ;)

> Therefore if your new IPtables firewall is doing DNAT on 
> packets to port 53, 
> the source address of those packets will be just the same as 
> it always was, 
> and the DNS server will try to reply to it (by whatever route 
> it thinks it 
> knows for an arbitrary source address - in this case your old 
> IPchains 
> firewall.....)

Understood, and agreed.

> As a bit of a workaround, you could do both DNAT and SNAT on 
> the new IPtables 
> firewall, to make sure that the replies from your DNS server 
> go back the way 
> the initial enquiry came:
> 
> iptables -A PREROUTING -t nat -i eth1 -p tcp --dport 53 -j 
> DNAT --to 10.0.0.10
> iptables -A PREROUTING -t nat -i eth1 -p udp --dport 53 -j 
> DNAT --to 10.0.0.10
> iptables -A POSTROUTING -t nat -o eth1 -j SNAT --to 66.38.133.120
> iptables -A POSTROUTING -t nat -o eth0 -j SNAT --to 10.0.0.2
> 
> This last rule will make sure that any packets going to 
> 10.0.0.10 have a 
> source address of 10.0.0.2, therefore when the DNS server 
> replies, they'll go 
> back through this firewall (which will automatically reverse 
> translate them 
> back to their original source (now destination) address), and 
> you might even 
> find that the system works :-)

Okay, let's try it...

echo 1 > /proc/sys/net/ipv4/ip_forward
iptables -A PREROUTING -t nat -i eth1 -p tcp --dport 53 -j DNAT --to
10.0.0.10 
iptables -A PREROUTING -t nat -i eth1 -p udp --dport 53 -j DNAT --to
10.0.0.10 
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT 
iptables -A FORWARD -p tcp --dport 53 -j ACCEPT 
iptables -A FORWARD -p udp --dport 53 -j ACCEPT 
iptables -t nat -A POSTROUTING -o eth1 -j SNAT --to 66.38.133.120
iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to 10.0.0.3

HOLY ^%^$&!!  You already know this, but you're a genius.  Feel free to
store that someplace for a day when you need a pick-me-up. ;)
 
> Look on the bright side: you're learning about more than just 
> IPtables.

Yes, I have learned a lot today.  I thought I knew IPTABLES, but this
proves that you -can- teach an old dog new tricks!  Thank you, Antony, I
really appreciate it!
 
> By the way, I have a notice on the wall of my office:
> 
> 90% of networking problems are routing problems.
> 9 of the remaining 10% are routing problems, but in the other 
> direction.
> The final 1% might not be routing, but check it anyway.

While impossibly true, in my job, I don't have the luxury of depending
on that as a rule of thumb. ;) I wish I could. :/

Thanks again.  I am sure that from here out, with the basic
structure/rules set up, the individual rules for the rest of the
services will be simple.  Thanks everyone for their help.


John  


