From: "John A. Sullivan III" <jsullivan@opensourcedevelopmentcorp.com>
Subject: Re: Help with iptables script
Date: Wed, 15 Dec 2004 13:27:24 -0500
Message-ID: <1103135244.2023.33.camel@localhost>
References: <6.1.2.0.0.20041214161928.02702088@corpmail.courtesymortgage.com>
	<1103073463.2028.13.camel@localhost>
	<6.1.2.0.0.20041215090840.025e0ec0@corpmail.courtesymortgage.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <6.1.2.0.0.20041215090840.025e0ec0@corpmail.courtesymortgage.com>
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
To: Jason Williams <jwilliams@courtesymortgage.com>
Cc: Netfilter users list <netfilter@lists.netfilter.org>

On Wed, 2004-12-15 at 12:16, Jason Williams wrote:
> >Welcome to netfilter/iptables - it's a fabulous product.  You do indeed
> >seem to know what you are doing.  I'll make some comments in your text.
> 
> Thanks for the welcome. I am quite intrigued with iptables. Definitely 
> different and a new thing to learn.
> 
> <snip>

> > > #Simple NAT setup
> > >
> > > $IPTABLES -t nat -A POSTROUTING -o $INET_IFACE -j SNAT --to-source $INET_IP
> 
> This should be correct for my NAT setup on my private LAN correct? Think 
> so, just want to double check.
Yes, that looks fine.  You could further constrain it by -s $LAN_IP but
I don't think it's necessary.
> 
> > >
> > > # Accept the packets we actually want to forward
> > >
> > > $IPTABLES -A FORWARD -i $LAN_IFACE -j ACCEPT
> > > $IPTABLES -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
> > > $IPTABLES -A FORWARD -m limit --limit 3/minute --limit-burst 3 -j LOG
> > > --log-level DEBUG --log-prefix "IPT FORWARD packet died: "
> > >
> > > # INPUT chain
> > >
> > > $IPTABLES -A INPUT -p tcp -j bad_tcp_packets
> >Since you're not accepting any packets on the INPUT chain, you don't
> >need to filter bad packets unless you want to log them.  Are you sure
> >you don't want to accept RELATED,ESTABLISHED traffic on your INPUT
> >chain?
> 
> Hmm. Good point. Just to make sure I follow, even though I am not accepting 
> any packets on the input chain, traffic from the private LAN still should 
> traverse through the firewall and back correct? Assuming that is correct, 
> then the problems i would have then would be the loopback interface (stuff 
> like X windows, subsystems) and also when the host itself tries to call the 
> interent for patches, packages etc. Is that a correct assumption?
Yes, exactly.
> 
> > >
> > >
> > > # OUTPUT chain
> > >
> > > $IPTABLES -A OUTPUT -p tcp -j bad_tcp_packets
> >Are you expecting bad packets on your OUTPUT chain?
> > >
> > > #
> > > # Special OUTPUT rules to decide which IP's to allow.
> > > #
> > >
> > > $IPTABLES -A OUTPUT -p ALL -s $LAN_IP -j ACCEPT
> > > $IPTABLES -A OUTPUT -p ALL -s $INET_IP -j ACCEPT
> >I believe you can drop the -p ALL.  What about traffic on lo?
> 
> Yep. Forgot the Loopback interface.
> 
> I will be pouring over my book and how-to's today.
> just a quick question. Is there a website, other than the netfiler website 
> that has some sample table scripts? I'd like to see just a few examples of 
> simple iptable scripts so I can further wrap my head around this.
> My intentions with this first script was to put a simple firewall script 
> that would block my private lan, do NAT and of course, pass out traffic to 
> and from the private LAN.
<snip>
I've always found Oskar Andreasson's tutorial very helpful and it
includes a number of scripts
(http://iptables-tutorial.frozentux.net/iptables-tutorial.html). I think
there are some sample scripts on the Shorewall site
(http://www.shorewall.net) and there are a few slide shows on
http://iscs.sourceforge.net

Good luck - John
-- 
John A. Sullivan III
Open Source Development Corporation
Financially sustainable open source development
http://www.opensourcedevel.com


