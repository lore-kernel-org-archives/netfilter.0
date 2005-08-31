From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: Filter Question: Only allow telnet, DNS, DHCP in
Date: Wed, 31 Aug 2005 11:47:51 -0500
Message-ID: <200508311147.51697.rob0@gmx.co.uk>
References: <EFBC01AFAA255D4FBABF7756DE4AFD2355A9@seattle-mail1.nffc.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <EFBC01AFAA255D4FBABF7756DE4AFD2355A9@seattle-mail1.nffc.local>
Content-Disposition: inline
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

On Wednesday 2005-August-31 10:57, Michael Ellerbeck wrote:
> Trying to setup rules that will only allow connections in on telnet,
> DNS, and DHCP Also the telnet rule should only allow connections that
> are destined for 10.0.0.1

Is this a local IP of the machine? Complete information gets better 
answers. See, if that is so, perhaps you are wanting to restrict telnet 
to a LAN which is under your control. The best way to do that is not by 
IP, because IP's can be spoofed. Control it by incoming interface.

You should also only bind your telnetd to the internal interface. It's 
poor practice to rely solely on your firewall for security.

> So setting all initials chains to drop
> {$IPTABLES} -P INPUT DROP

That doesn't look like good shell syntax to me. "${IPTABLES}"? Why the 
curly braces at all?

> {$IPTABLES} -P OUTPUT DROP

Why this?

> {$IPTABLES} -P FORWARD DROP
>
> $IPTABLES -A INPUT -p tcp -i eth1 -d 10.0.0.1 --dport 23 -m state
> --state NEW,ESTABLISHED -j ACCEPT

The "-i eth1" is what I was talking about above. You don't need the 
state matching here.

> Is it OK to do this on the INPUT?

Not knowing if 10.0.0.1 is a local IP, how are we to know?

> This box is also a router, will the 
> iptables happen before any routing happens.

That's answered in "man iptables" section "TABLES". No, routed packets 
will never hit your filter table INPUT chain.

> I guess my question is 
> one of order. When a packet comes in will it be handled by the
> iptables INPUT first?

If destination IP is local (bound to a local interface), yes. Otherwise 
see above.

> How can I safely allow outgoing packets?

What is "safely"? I do very little filtering of OUTPUT. My choice for 
safety and functionality is "iptables -P OUTPUT ACCEPT".

> To allow DNS and DHCP in can I do something like
>
> $IPTABLES -A INPUT -p tcp -i eth1 --dport 53 -m state --state
> NEW,ESTABLISHED -j ACCEPT #DNS

What about UDP?

[word wrapping fixed ]
> $IPTABLES -A INPUT -p tcp -i eth1 
> --dport 67 -m state --state NEW,ESTABLISHED -j ACCEPT #DHCP
> $IPTABLES -A INPUT -p tcp -i eth1 --dport 68 -m state 
> --state NEW,ESTABLISHED -j ACCEPT #DHCP

Useless. Or to be precise, DHCP does not use TCP.
$ grep ^bootp /etc/services
bootps           67/tcp    dhcps        #Bootstrap Protocol Server
bootps           67/udp    dhcps        #Bootstrap Protocol Server
bootpc           68/tcp    dhcpc        #Bootstrap Protocol Client
bootpc           68/udp    dhcpc        #Bootstrap Protocol Client

That's a lie. These are only UDP. You need to allow 67/udp coming in.

> How can I allow these ports out?

See above. Also please see the Packet Filtering HOWTO which, for me, 
made it all start to make sense. You also have to know something about 
the services you are running: what ports and protocols they need.

> Thank you for your help!

I tried to read your mind ... probably tried too hard.
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

