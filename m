From: <bigman@monster-solutions.net>
Subject: Re: DHCRELAY through IPTABLES Firewall
Date: Tue, 29 Oct 2002 02:37:00 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000b01c27f1d$f805e430$8f33e40f@lsmith5953>
References: <001001c27d72$1352c350$8f33e40f@lsmith5953> <200210281054.g9SAsee08116@vulcan.rissington.net> <002c01c27e74$d989fb80$8f33e40f@lsmith5953> <200210281139.g9SBdPe08223@vulcan.rissington.net>
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
To: Antony Stone <Antony@Soft-Solutions.co.uk>, netfilter@lists.netfilter.org

here is how I ended up fixing my problem. However I have just discovered it
only works with one client. When I try to get another client to obtain an IP
it does not work. Any ideas? Is DNAT limiting me on one MAC to pass through
or something? I am lost here.


1)    turned off DHCPD and DHCRELAY on firewall
2)    iptables -t nat -A PREROUTING -i eth2 -p udp --dport 67 -j
DNAT --to-destination 192.168.1.70
3)    iptables -A FORWARD -p udp -m multiport --dport 67,68 -j ACCEPT

----- Original Message -----
From: "Antony Stone" <Antony@Soft-Solutions.co.uk>
To: <netfilter@lists.netfilter.org>
Sent: Monday, October 28, 2002 6:39 AM
Subject: Re: DHCRELAY through IPTABLES Firewall


> On Monday 28 October 2002 11:26 am, bigman@monster-solutions.net wrote:
>
> > my comments for each question are in BOLD... thanks for all of the help.
>
> > > > iptables -A FORWARD -i eth2 -o eth2 -j lan2-lan1-fwd
> > >
> > > I don't like the look of that rule !
> >
> > IT SHOULD BE -O ETH1 AND NOT -O ETH2
>
> I know.   I just thought you should check whether this was a typo in your
> email, or a typo in the original script...
>
> > > the best thing might be to add a LOGging
> > > rule just before the DROP rule in each of your lan1-lan2-fwd and
> > > lan2-lan1-fwd chains so you can see if anything's being blocked...
> >
> > SO DHCRELAY WILL USE FORWARDING INSTEAD OF OUTPUT AND INPUT FOR IT TO
WORK?
>
> No, sorry, I should have suggested adding the LOGging rules to the chains
> lan1-in lan2-in and lan1-lan2.
>
> You are correct that dhcrelay is supposed to pick up broadcasts on the
source
> network (which will come in to the firewall via the INPUT chain) and the
> dhcrelay application then generates its own packet to send to the dhcp
server
> (which will go out via the OUTPUT chain).
>
> Replies should come back in from the dhcp server through the INPUT chain,
and
> then go back out to the original client through the OUTPUT chain.
>
> No packets are expected to be FORWARDed (routed).
>
> Antony.
>
> --
>
> KDE 3.0.3 contains an important fix for handling SSL certificates.  Users
of
> Internet Explorer, which suffers from the same problem but which
> does not yet have a fix available, are also encouraged to switch to KDE
3.0.3.
>
> http://www.kde.org/announcements/announce-3.0.3.html
>


