From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: RELATED emulation without ip_conntrack
Date: Thu, 24 Oct 2002 12:55:08 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200210241155.g9OBtEe04312@vulcan.rissington.net>
References: <200210231602.00745.roy@karlsbakk.net> <200210231518.g9NFI4L02942@vulcan.rissington.net> <200210241245.52685.roy@karlsbakk.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200210241245.52685.roy@karlsbakk.net>
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
To: Netfilter mailinglist <netfilter@lists.netfilter.org>

On Thursday 24 October 2002 11:45 am, Roy Sigurd Karlsbakk wrote:

> On Wednesday 23 October 2002 17:17, Antony Stone wrote:
> > On Wednesday 23 October 2002 3:02 pm, Roy Sigurd Karlsbakk wrote:
> > > hi
> > >
> > > I've got this video server streaming @ ~250Mbps, so I really don't want
> > > to waste cpu cycles on ip_conntrack.
> > >
> > > how can I test for tcp flags to allow me to do a poor-man's-conntrack?
> >
> > Treat packets with SYN set, and ACK, FIN and RST clear as NEW
> > connections. Treat packets with SYN and ACK set, FIN and RST clear as NEW
> > replies. Treat packets with ACK set, SYN, FIN and RST clear as
> > ESTABLISHED connections.
> > Treat packets with FIN or RST set (probably ACK too) as terminating
> > connections.
>
> ok. My system has a private network and a public network. the private is
> open to everyone connected on it. The public is open only to the video
> service (tcp/1234) and icmp. Does the following look reasonable?
>
> iptables -I INPUT -i eth0 -j ACCEPT
> iptables -I INPUT -i eth1 -p icmp -j ACCEPT
> iptables -I INPUT -i eth1 -p tcp --dport 1234 --tcp-flags SYN,ACK,FIN,RST \
> 	SYN -j ACCEPT
> iptables -I INPUT -i eth1 -p tcp --dport 1234 --tcp-flags SYN,ACK,FIN,RST \
> 	SYN ACK -j ACCEPT
> iptables -I INPUT -i eth1 -p tcp --dport 1234 --tcp-flags SYN,ACK,FIN,RST \
> 	FIN,RST -j ACCEPT
> iptables -I INPUT -i eth1 -p tcp --dport 1234 --tcp-flags SYN,ACK,FIN,RST \
> 	ACK,FIN,RST -j ACCEPT
> iptables -I INPUT -j LOG --log-prefix "Illegal packet" --limit 5/second \
> 	--limit-burst 10
> iptables -I INPUT -j DROP

I think all these rules should be in the FORWARD chain, not the INPUT chain - 
I mean, these are for packets being routed through the netfilter box, right ? 
The netfilter machine is neither of the endpoints of your connection ?

Also there's no rule to allow packets in from eth1 which have ACK only set - 
the majority of packets in that direction !

Remember the way TCP sets up, maintains, and shuts down a connection:

SYN only - initial contact
SYN + ACK - reply
ACK - connection established
ACK - all further data packets
FIN + ACK - shut down
ACK - acknowledge shutdown
(last two generally happen in both directions)

Also, since your main requirement is for speed of processing packets, make 
sure you place them in the correct order, so the rule which will match the 
most packets comes first etc.

You might want to set up the rules and let some traffic flow, then use
iptables -L FORWARD -n -v -x
to see how many packets / bytes have matched each rule, and adjust the order 
so the most-used ones come before the least-used ones.

Antony.

-- 

In science, one tries to tell people
in such a way as to be understood by everyone
something that no-one ever knew before.

In poetry, it is the exact opposite.

 - Paul Dirac

