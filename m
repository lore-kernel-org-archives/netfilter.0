From: Jason Williams <jwilliams@courtesymortgage.com>
Subject: Re: Help with iptables script
Date: Wed, 15 Dec 2004 09:16:50 -0800
Message-ID: <6.1.2.0.0.20041215090840.025e0ec0@corpmail.courtesymortgage.com>
References: <6.1.2.0.0.20041214161928.02702088@corpmail.courtesymortgage.com>
	<1103073463.2028.13.camel@localhost>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1103073463.2028.13.camel@localhost>
References: <6.1.2.0.0.20041214161928.02702088@corpmail.courtesymortgage.com>
	<1103073463.2028.13.camel@localhost>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: "John A. Sullivan III" <jsullivan@opensourcedevelopmentcorp.com>
Cc: netfilter@lists.netfilter.org


>Welcome to netfilter/iptables - it's a fabulous product.  You do indeed
>seem to know what you are doing.  I'll make some comments in your text.

Thanks for the welcome. I am quite intrigued with iptables. Definitely 
different and a new thing to learn.


> > $IPTABLES -P INPUT DROP
> > $IPTABLES -P OUTPUT DROP
> > $IPTABLES -P FORWARD DROP
> >
>Very good start :-)

Alright...good to know. :)


> > $IPTABLES -N bad_tcp_packets
> > $IPTABLES -A bad_tcp_packets -p tcp ! --syn -m state --state NEW -j LOG
> > --log-prefix "New not syn:"
> > $IPTABLES -A bad_tcp_packets -p tcp ! --syn -m state --state NEW -j DROP
>I would be interested to see some list discussion here.  When I use
>connection tracking, I generally do not drop NEW not SYN packets.  NEW
>packets initiated from untrusted sources are generally dropped anyway
>whether they have the SYN bit flipped or not.  On the other hand, you
>may find legitimate NEW packets that are not SYN, e.g., if a session has
>been interrupted (e.g., firewall reset), the sessions may still be alive
>on the end points.  Dropping the non-SYN packets will force a time out
>or application hang and a call to the help desk.  Letting those packets
>through will renew the connection tracking state and keep the
>application alive.

I was thinking about this after you mentioned this. I may go back and look 
further into the details of this, see if I can't find something better to 
do. I am thinking, that this could be a good and bad thing, depending upon 
the connection(s). I may rethink this set of rules.


> > $IPTABLES -A bad_tcp_packets -i $INET_IFACE -s 192.168.0.0/16 -j DROP
> > $IPTABLES -A bad_tcp_packets -i $INET_IFACE -s 10.0.0.0/8 -j DROP
> > $IPTABLES -A bad_tcp_packets -i $INET_IFACE -s 172.16.0.0/12 -j DROP
>We usually take anti-spoofing one step further in the ISCS network
>security project (http://iscs.sourceforge.net).  To be good Internet
>citizens, we also want to make sure that only valid internal addresses
>are sending traffic out.  If you have and will alway have only one
>protected network, one can do this with a single inverse rule, e.g.,
>$IPTABLES -A bad_tcp_packets -i $LAN_IFACE -s ! $LAN_IP - j DROP
>
>If you have multiple protected networks, you can do this with the RETURN
>target and a separate chain, e.g.,
>$IPTABLES -N SpoofChain
>$IPTABLES -A bad_tcp_packets -i $LAN_IFACE -j SpoofChain
>$IPTABLES -A SpoofChain -s $LAN_IP1 -j RETURN
>$IPTABLES -A SpoofChain -s $LAN_IP2 -j RETURN
>$IPTABLES -A SpoofChain -j DROP

Thanks for the link and tips on rules. anything i can do to be a better 
internet citizen, I am all for. :)


> > #Simple NAT setup
> >
> > $IPTABLES -t nat -A POSTROUTING -o $INET_IFACE -j SNAT --to-source $INET_IP

This should be correct for my NAT setup on my private LAN correct? Think 
so, just want to double check.

> >
> > # Accept the packets we actually want to forward
> >
> > $IPTABLES -A FORWARD -i $LAN_IFACE -j ACCEPT
> > $IPTABLES -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
> > $IPTABLES -A FORWARD -m limit --limit 3/minute --limit-burst 3 -j LOG
> > --log-level DEBUG --log-prefix "IPT FORWARD packet died: "
> >
> > # INPUT chain
> >
> > $IPTABLES -A INPUT -p tcp -j bad_tcp_packets
>Since you're not accepting any packets on the INPUT chain, you don't
>need to filter bad packets unless you want to log them.  Are you sure
>you don't want to accept RELATED,ESTABLISHED traffic on your INPUT
>chain?

Hmm. Good point. Just to make sure I follow, even though I am not accepting 
any packets on the input chain, traffic from the private LAN still should 
traverse through the firewall and back correct? Assuming that is correct, 
then the problems i would have then would be the loopback interface (stuff 
like X windows, subsystems) and also when the host itself tries to call the 
interent for patches, packages etc. Is that a correct assumption?

> >
> >
> > # OUTPUT chain
> >
> > $IPTABLES -A OUTPUT -p tcp -j bad_tcp_packets
>Are you expecting bad packets on your OUTPUT chain?
> >
> > #
> > # Special OUTPUT rules to decide which IP's to allow.
> > #
> >
> > $IPTABLES -A OUTPUT -p ALL -s $LAN_IP -j ACCEPT
> > $IPTABLES -A OUTPUT -p ALL -s $INET_IP -j ACCEPT
>I believe you can drop the -p ALL.  What about traffic on lo?

Yep. Forgot the Loopback interface.

I will be pouring over my book and how-to's today.
just a quick question. Is there a website, other than the netfiler website 
that has some sample table scripts? I'd like to see just a few examples of 
simple iptable scripts so I can further wrap my head around this.
My intentions with this first script was to put a simple firewall script 
that would block my private lan, do NAT and of course, pass out traffic to 
and from the private LAN.

i appreciate the feedback. Nice product indeed. i like. :)

Cheers,

Jason



