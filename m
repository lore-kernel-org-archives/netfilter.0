From: "Sergio Basurto" <basurto@canada.com>
Subject: Re: static IP to dynamic IP (kate)
Date: Mon, 18 Oct 2004 15:12:53 -0700 (PDT)
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20041018151259.16874.h002.c009.wm@mail.canada.com.criticalpath.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

netfilter-request@lists.netfilter.org wrote:

> 
> Send netfilter mailing list submissions to
>  netfilter@lists.netfilter.org
> 
> To subscribe or unsubscribe via the World Wide Web,
> visit
> 
https://lists.netfilter.org/mailman/listinfo/netfilter
> or, via email, send a message with subject or body
> 'help' to
>  netfilter-request@lists.netfilter.org
> 
> You can reach the person managing the list at
>  netfilter-owner@lists.netfilter.org
> 
> When replying, please edit your Subject line so it is
> more specific
> than "Re: Contents of netfilter digest..."
> 
> 
> Today's Topics:
> 
>    1. Re: firewall rules for subinterfaces (Cedric
> Blancher)
>    2. Re: Limiting access to some number from random
> users.
>       (Jason Opperisano)
>    3. OT - rule based system for a fire wall (Ishwar
> Rattan)
>    4. Re: OT - rule based system for a fire wall (John
> A. Sullivan III)
>    5. Re: pptp (K. Shantanu )
>    6. static IP to dynamic IP (kate)
>    7. ipsec troubles (Peter Marshall)
>    8. Re: ipsec troubles (Jason Opperisano)
>    9. Re: static IP to dynamic IP (kate)
>   10. RE: static IP to dynamic IP (Rob Sterenborg)
>   11. Re: static IP to dynamic IP (Jason Opperisano)
> 
> 
>
----------------------------------------------------------------------
> 
> Message: 1
> Date: Fri, 15 Oct 2004 16:44:56 +0200
> From: Cedric Blancher <blancher@cartel-securite.fr>
> Subject: Re: firewall rules for subinterfaces
> To: Andre Correa <andre.correa@pobox.com>
> Cc: netfilter@lists.netfilter.org
> Message-ID:
> 
<1097851496.2705.16.camel@anduril.intranet.cartel-securite.net>
> Content-Type: text/plain; charset=iso-8859-15
> 
> Le ven 15/10/2004 ? 16:25, Andre Correa a ?crit :
> > Hi, there is really no meaning on setting rules for
> subinterfaces, If 
> > you need to segment your network and can't plug new
> NICs look for VLANs. 
> > You can apply rules indicating VLAN interfaces (-i
> and -o) like this: 
> > eth0.100, eth0.200, etc...
> 
> Definitly true.
> Different IP addresses spaces on the same ethernet
> segment are a joke to
> fool.
> 
> > Somebody correct me if I'm wrong but this was made
> possible under >= 2.6 
> > kernel versions, on 2.4.x you can't do it too.
> 
> VLAN support is available for kernel >= 2.4.14 and
2.6.
> Otherwise, you
> can find patches for >=2.2.13 at :
> 
>  http://www.candelatech.com/~greear/vlan.html
> 
> You can also find a "Linux VLAN + Cisco" HOWTO at :
> 
> 
http://www.candelatech.com/~greear/vlan/cisco_howto.html
> 
> 
> -- 
> http://www.netexit.com/~sid/
> PGP KeyID: 157E98EE FingerPrint:
> FA62226DA9E72FA8AECAA240008B480E157E98EE
> >> Hi! I'm your friendly neighbourhood signature
virus.
> >> Copy me to your signature file and help me spread!
> 
> 
> 
> ------------------------------
> 
> Message: 2
> Date: Fri, 15 Oct 2004 11:33:54 -0400
> From: Jason Opperisano <opie@817west.com>
> Subject: Re: Limiting access to some number from
random
> users.
> To: "Rio Martin." <rio@martin.mu>
> Cc: netfilter@lists.netfilter.org
> Message-ID: <20041015153354.GA7143@bender.817west.com>
> Content-Type: text/plain; charset=us-ascii
> 
> On Fri, Oct 15, 2004 at 10:48:28AM +0000, Rio Martin.
> wrote:
> > Folks,
> > I need to know how to limit access to some number
> from bulk random users.
> > Let say, i have 256 PCs connecting to Internet
daily. 
> > I want to limit my users accessing to Internet only
> for 100 users during peak 
> > time. But these 100users must be selected in random.
> > 
> > Need a fresh idea how to do that with iptables.
> Should i apply special 
> > patches?
> 
> iptables -N random
> iptables -A FORWARD -j random
> 
> --- BEGIN PERL CODE TO GENERATE LIST OF 100 RANDOM IPs
> ---
>   #!/usr/bin/perl
> 
>   use strict;
> 
>   my %ips = ();
>   my $ip;
>   my $randomIP;
> 
>   while ( scalar(keys(%ips)) < 100) {
>     $randomIP = int( rand(254)) + 1;
>     if ( exists($ips{$randomIP}) ) {
>       next;
>     } else {
>       $ips{$randomIP} = $randomIP;
>     }
>   }
> 
>   foreach $ip (sort {$a <=> $b} keys %ips) {
>     print "$ip\n";
>   }
> --- END PERL CODE ---
> 
> iptables -F random
> 
> for i in `./random_ips.pl`; do
>   iptables -A random -s 192.168.1.${i} -j ACCEPT
> done
> 
> -j
> 
> -- 
> Jason Opperisano <opie@817west.com>
> 
> 
> 
> ------------------------------
> 
> Message: 3
> Date: Fri, 15 Oct 2004 12:16:58 -0400 (EDT)
> From: Ishwar Rattan <ishwar@pali.cps.cmich.edu>
> Subject: OT - rule based system for a fire wall
> To: netfilter@lists.netfilter.org
> Message-ID:
> <Pine.LNX.4.56.0410151216210.2188@pali.cps.cmich.edu>
> Content-Type: TEXT/PLAIN; charset=US-ASCII
> 
> It is a little off-topic but some one here may
> know something about.
> 
> I have seen an idea being floated:
> 
> - A firewall uses a set of rules to filter packets (a
> fact)
> 
> - Proposal: possibility of desigaingn a rule based
> system
>   (call it rule-system) that will insert correct rules
> in the
>   firewall (sounds ambiguous)
> 
> - Is there such a thing out there? if the propser
won't
>   part with any more details, what kind of gusses can
be
>   made?
> 
>   1. Rule-system can interact with a user and then
> insert
>      rules in the firewall -- I think this has already
> been
>      accomplished??
> 
>   2. Rule-system could look at logged information
> (firewall
>      logs) and come up with better/new rules?
> 
>   3. Is there any other facet/issue that I am missing
> here..
> 
> It still bugs me to think of a rule-system that will
> insert
> rules into another rule based system :-|
> 
> Any feedback will be appreciated.
> 
> -ishwar
> 
> 
> 
> 
> ------------------------------
> 
> Message: 4
> Date: Fri, 15 Oct 2004 12:20:15 -0400
> From: "John A. Sullivan III"
> <jsullivan@opensourcedevelopmentcorp.com>
> Subject: Re: OT - rule based system for a fire wall
> To: Ishwar Rattan <ishwar@pali.cps.cmich.edu>
> Cc: Netfilter users list
<netfilter@lists.netfilter.org>
> Message-ID: <1097857214.2746.28.camel@localhost>
> Content-Type: text/plain
> 
> On Fri, 2004-10-15 at 12:16, Ishwar Rattan wrote:
> > It is a little off-topic but some one here may
> > know something about.
> > 
> > I have seen an idea being floated:
> > 
> > - A firewall uses a set of rules to filter packets
(a
> fact)
> > 
> > - Proposal: possibility of desigaingn a rule based
> system
> >   (call it rule-system) that will insert correct
> rules in the
> >   firewall (sounds ambiguous)
> > 
> > - Is there such a thing out there? if the propser
> won't
> >   part with any more details, what kind of gusses
can
> be
> >   made?
> > 
> >   1. Rule-system can interact with a user and then
> insert
> >      rules in the firewall -- I think this has
> already been
> >      accomplished??
> > 
> >   2. Rule-system could look at logged information
> (firewall
> >      logs) and come up with better/new rules?
> > 
> >   3. Is there any other facet/issue that I am
missing
> here..
> > 
> > It still bugs me to think of a rule-system that will
> insert
> > rules into another rule based system :-|
> > 
> > Any feedback will be appreciated.
> > 
> > -ishwar
> I'm not entirely sure I understand you.  Are you
> looking for something
> that will dynamically change a running rule set based
> upon events or a
> user interface to alter an existing rule set?
> 
> There are some very good rule configurators available
> such as fwbuild
> (http://www.fwbuilder.org), shorewall
> (http://www.shorewall.net) and
> several other that have been recommended on this
list. 
> For a policy
> rather than rules based approach, take a look at ISCS
> (http://iscs.sourceforge.net).  Hope this helps - John
> -- 
> John A. Sullivan III
> Open Source Development Corporation
> Financially sustainable open source development
> http://www.opensourcedevel.com
> 
> 
> 
> 
> ------------------------------
> 
> Message: 5
> Date: Fri, 15 Oct 2004 11:25:41 -0500
> From: "K. Shantanu " <shantanu-fw@bjjhumit.com>
> Subject: Re: pptp
> To: netfilter@lists.netfilter.org
> Message-ID:
> <20041015162541.GA23125@plain.ev1servers.net>
> Content-Type: text/plain; charset=us-ascii
> 
> * Jason Opperisano <opie@817west.com> [041015 11:15]:
> > yes--if your are performing SNAT/MASQ for your
entire
> internal network
> > on your gateway, it won't work.  there is a PPTP
> conntrack and nat module
> > in POM for this situation, but it will only compile
> against a 2.4 kernel.
> 
> Yes, I am performing MASQ for entire network. Is there
> no way I can get
> it to work against 2.6 series? I will have a lot of
> troble downgrading
> the kernel. It is a live server.
> 
> > one option would be to give the PPTP client a
> dedicated public IP and
> > perform a one-to-one SNAT/DNAT for that client and
> allow TCP 1723 and
> > IP protocol 47 outbound from that client and IP
> protocol 47 inbound to
> > that client from the PPTP server.
> 
> Can you please give an example of this to be on safe
> side?  Is this something 
> like,
> * I add eth0:1 on Linux box and give it an public IP.
> * redirect all traffic to that IP from ouside to the
> client having pptp 
> client? Will something like below help,
> iptables -A PREROUTING -d <ext ip> -p tcp -m tcp
> --dport 47 -j DNAT --to-destination 192.168.10.99
> iptables -A PREROUTING -d <ext ip> -p tcp -m tcp
> --dport 1723 -j DNAT --to-destination 192.168.10.99
> 
> Respects,
> Shantanu
> 
> 
> 
> ------------------------------
> 
> Message: 6
> Date: Fri, 15 Oct 2004 10:44:56 -0700 (PDT)
> From: kate <kate7234@yahoo.com>
> Subject: static IP to dynamic IP
> To: netfilter@lists.netfilter.org
> Message-ID:
> <20041015174456.20376.qmail@web21523.mail.yahoo.com>
> Content-Type: text/plain; charset=us-ascii
> 
> Hi, I am trying to modify a fw script that would work
> for my small lan, except I need to change references
> of static IP and SNAT. to eth0 and MASQUERADE, - but
> when I run the script it gives me Bad argument `eth0'
> 
> The script is below, with my notes on changes I've
> made so far. Any help greatly appreciated.
> 
> #(1) Policies (default) - modified with notation
> iptables -P INPUT DROP
> iptables -P OUTPUT DROP
> iptables -P FORWARD DROP
> 
> # (2) User defined chain for ACCEPTed TCP packets
> iptables -N okay
> iptables -A okay -p TCP --syn -j ACCEPT
> iptables -A okay -p TCP -m state --state
> ESTABLISHED,RELATED -j ACCEPT
> iptables -A okay -p TCP -j DROP
> 
> # (3) INPUT chain rules
> 
> # Rules for incoming packets from LAN
> iptables -A INPUT -p ALL -i eth1 -s 192.168.0.0/16 -j
> ACCEPT
> iptables -A INPUT -p ALL -i lo -s 127.0.0.1 -j ACCEPT
> iptables -A INPUT -p ALL -i lo -s 192.168.1.1 -j
> ACCEPT
> iptables -A INPUT -p ALL -i lo -s -i eth0 -j ACCEPT
> ## WAS -> ... 123.45.67.89 -j ACCEPT
> iptables -A INPUT -p ALL -i eth1 -d 192.168.0.255 -j
> ACCEPT
> 
> # Rules for incoming packets from Internet
> # Packets for established connections
> iptables -A INPUT -p ALL -d -i eth0 -m state --state
> ESTABLISHED,RELATED -j ACCEPT
> ## WAS - > ... -d 123.45.67.89 -m...
> 
> # TCP Rules (edit as services needed)
> iptables -A INPUT -p TCP -i eth0 -s 0/0
> --destination-port 21 -j okay
> iptables -A INPUT -p TCP -i eth0 -s 0/0
> --destination-port 22 -j okay
> iptables -A INPUT -p TCP -i eth0 -s 0/0
> --destination-port 80 -j okay
> iptables -A INPUT -p TCP -i eth0 -s 0/0
> --destination-port 443 -j okay
> 
> # UDP Rules
> # iptables -A INPUT -p UDP -i eth0 -s 0/0
> --destination-port 53 -j okay
> # iptables -A INPUT -p UDP -i eth0 -s 0/0
> --destination-port 2074 -j okay
> 
> # ICMP rules
> iptables -A INPUT -p ICMP -i eth0 -s 0/0 --icmp-type 8
> -j ACCEPT
> iptables -A INPUT -p ICMP -i eth0 -s 0/0 --icmp-type
> 11 -j ACCEPT
> 
> # (4) FORWARD chain rules
> # Accept the packets we want to forward
> iptables -A FORWARD -i eth1 -j ACCEPT
> iptables -A FORWARD -m state --state
> ESTABLISHED,RELATED -j ACCEPT
> 
> # (5) OUTPUT chain rules
> # Only output packets with local addresses (no
> spoofing)
> iptables -A OUTPUT -p ALL -s 127.0.0.1 -j ACCEPT
> iptables -A OUTPUT -p ALL -s 192.168.1.1 -j ACCEPT
> iptables -A OUTPUT -p ALL -s -i eth0 -j ACCEPT
> ## WAS -> ... 123.45.67.89 -j ACCEPT
> 
> # (6) POSTROUTING chain rules
> iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
> ## was -> ... -j SNAT --to-source 123.45.67.89
> 
> 
> 
>   
> __________________________________
> Do you Yahoo!?
> Yahoo! Mail Address AutoComplete - You start. We
finish.
> http://promotions.yahoo.com/new_mail 
> 
> 
> 
> ------------------------------
> 
> Message: 7
> Date: Fri, 15 Oct 2004 15:00:03 -0300
> From: "Peter Marshall" <peter.marshall@caris.com>
> Subject: ipsec troubles
> To: <netfilter@lists.netfilter.org>
> Message-ID:
<0f2001c4b2e0$cbd8fbb0$49caa8c0@caris.priv>
> Content-Type: text/plain; charset="iso-8859-1"
> 
> Hi everyone.  I have two firewalls, internal and
> external.  I have a vpn
> server in the middle on a routeable internet IP
> address.  The remote vpn
> server is a rh9 linux box.  When I make the local one
a
> rh9 box, everything
> is great, however when the local one is an openbsd
box,
> I get the following
> error in my firewall logs on my internal firewall. 
> Does anyone know what it
> means.
> 
> Note: E.F.G.33 is a routeable internet IP address
> 
> Oct 15 14:53:43 radium kernel: FORWARD REJECT IN=eth1
> OUT=eth0
> SRC=E.F.G.33 DST=192.168.201.22 LEN=56 TOS=0x00
> PREC=0x00 TTL=254
> ID=25774 PROTO=ICMP TYPE=3 CODE=4 [SRC=192.168.201.22
> DST=10.0.0.2 LEN=1500
> TOS=0x00 PREC=0x00 TTL=126 ID=18062 DF PROTO=TCP
> INCOMPLETE [8 bytes] ]
> MTU=1444
> 
> 
> Thanks,
> Peter
> 
> 
> 
> 
> ------------------------------
> 
> Message: 8
> Date: Fri, 15 Oct 2004 14:10:25 -0400
> From: Jason Opperisano <opie@817west.com>
> Subject: Re: ipsec troubles
> To: netfilter@lists.netfilter.org
> Message-ID: <20041015181025.GA7564@bender.817west.com>
> Content-Type: text/plain; charset=us-ascii
> 
> On Fri, Oct 15, 2004 at 03:00:03PM -0300, Peter
> Marshall wrote:
> > Hi everyone.  I have two firewalls, internal and
> external.  I have a vpn
> > server in the middle on a routeable internet IP
> address.  The remote vpn
> > server is a rh9 linux box.  When I make the local
one
> a rh9 box, everything
> > is great, however when the local one is an openbsd
> box, I get the following
> > error in my firewall logs on my internal firewall. 
> Does anyone know what it
> > means.
> > 
> > Note: E.F.G.33 is a routeable internet IP address
> > 
> > Oct 15 14:53:43 radium kernel: FORWARD REJECT
IN=eth1
> OUT=eth0
> > SRC=E.F.G.33 DST=192.168.201.22 LEN=56 TOS=0x00
> PREC=0x00 TTL=254
> > ID=25774 PROTO=ICMP TYPE=3 CODE=4
[SRC=192.168.201.22
> DST=10.0.0.2 LEN=1500
> > TOS=0x00 PREC=0x00 TTL=126 ID=18062 DF PROTO=TCP
> INCOMPLETE [8 bytes] ]
> > MTU=1444
> 
> ICMP Type 3 Code 4 = Destination Unreachable,
> Fragmentation Needed and
> Don't Fragment was Set.
> 
> lower the MTU (or MSS) of your IPSec traffic.  you can
> do this with the
> "-j TCPMSS --set-mss X" target in iptables.
> 
> mathematically speaking, the maximum value of X in
> these situations
> would be 1440, derived as:
> 
> 1500 (MTU of ethernet) - 20 (bytes in IPSec header) =
> 1480
> 
> MSS is defined as MTU - 40; or 1480 - 40 = 1440.
> 
> -j
> 
> -- 
> Jason Opperisano <opie@817west.com>
> 
> 
> 
> ------------------------------
> 
> Message: 9
> Date: Fri, 15 Oct 2004 11:14:45 -0700 (PDT)
> From: kate <kate7234@yahoo.com>
> Subject: Re: static IP to dynamic IP
> To: kate <kate7234@yahoo.com>,
> netfilter@lists.netfilter.org
> Message-ID:
> <20041015181445.16647.qmail@web21524.mail.yahoo.com>
> Content-Type: text/plain; charset=us-ascii
> 
> 
> --- kate <kate7234@yahoo.com> wrote:
> 
> > Hi, I am trying to modify a fw script that would
> > work
> > for my small lan, except I need to change references
> > of static IP and SNAT. to eth0 and MASQUERADE, - but
> > when I run the script it gives me Bad argument
> > `eth0'
> 
> It is Linux kernel 2.6 FC2
> Thanks in advance
> kate
> 
> 
>   
> 
> 
> 
> 
> ------------------------------
> 
> Message: 10
> Date: Fri, 15 Oct 2004 20:21:03 +0200
> From: "Rob Sterenborg" <rob@sterenborg.info>
> Subject: RE: static IP to dynamic IP
> To: <netfilter@lists.netfilter.org>
> Message-ID: <20041015182103.C200A295@sterenborg.info>
> Content-Type: text/plain; charset="us-ascii"
> 
> netfilter-bounces@lists.netfilter.org wrote:
> > --- kate <kate7234@yahoo.com> wrote:
> > 
> >> Hi, I am trying to modify a fw script that would
> work for my small
> >> lan, except I need to change references of static
IP
> and SNAT. to
> >> eth0 and MASQUERADE, - but when I run the script it
> gives me Bad
> >> argument `eth0'
> > 
> > It is Linux kernel 2.6 FC2
> > Thanks in advance
> > kate
> 
> Do you have and did you load the module
ipt_MASQUERADE ?
> 
> 
> Gr,
> Rob
> 
> 
> 
> 
> ------------------------------
> 
> Message: 11
> Date: Fri, 15 Oct 2004 14:22:53 -0400
> From: Jason Opperisano <opie@817west.com>
> Subject: Re: static IP to dynamic IP
> To: netfilter@lists.netfilter.org
> Message-ID: <20041015182253.GA7592@bender.817west.com>
> Content-Type: text/plain; charset=us-ascii
> 
> On Fri, Oct 15, 2004 at 10:44:56AM -0700, kate wrote:
> > Hi, I am trying to modify a fw script that would
work
> > for my small lan, except I need to change references
> > of static IP and SNAT. to eth0 and MASQUERADE, - but
> > when I run the script it gives me Bad argument
`eth0'
> 
> in general--you can find the line where any bash
script
> blows up by
> running:  bash -x script.sh
> 
> > The script is below, with my notes on changes I've
> > made so far. Any help greatly appreciated.
> > 
> > #(1) Policies (default) - modified with notation
> > iptables -P INPUT DROP
> > iptables -P OUTPUT DROP
> > iptables -P FORWARD DROP
> > 
> > # (2) User defined chain for ACCEPTed TCP packets
> > iptables -N okay
> > iptables -A okay -p TCP --syn -j ACCEPT
> > iptables -A okay -p TCP -m state --state
> > ESTABLISHED,RELATED -j ACCEPT
> > iptables -A okay -p TCP -j DROP
> > 
> > # (3) INPUT chain rules
> > 
> > # Rules for incoming packets from LAN
> > iptables -A INPUT -p ALL -i eth1 -s 192.168.0.0/16
-j
> > ACCEPT
> > iptables -A INPUT -p ALL -i lo -s 127.0.0.1 -j
ACCEPT
> > iptables -A INPUT -p ALL -i lo -s 192.168.1.1 -j
> > ACCEPT
> > iptables -A INPUT -p ALL -i lo -s -i eth0 -j ACCEPT
> 
> but i can tell you that the above line is the one
> blowing up.  you have
> specified "-s" with no IP address following
it...you've
> also specified
> "-i" twice--which doesn't make any sense--a packet
only
> has one inbound
> interface.
> 
> > ## WAS -> ... 123.45.67.89 -j ACCEPT
> > iptables -A INPUT -p ALL -i eth1 -d 192.168.0.255 -j
> > ACCEPT
> > 
> > # Rules for incoming packets from Internet
> > # Packets for established connections
> > iptables -A INPUT -p ALL -d -i eth0 -m state --state
> > ESTABLISHED,RELATED -j ACCEPT
> > ## WAS - > ... -d 123.45.67.89 -m...
> 
> k--i guess i see your pattern here...you need to
figure
> out what
> your IP address actually is earlier in the script and
> just use the IP
> address--there's no magic "substitute the IP of the
> interface" variable
> with iptables (except for MASQ which we get to
later). 
> one of the 8
> million (i've counted) ways to do this would be:
> 
> ETH0_IP=`ip -4 -o addr sh eth0 | awk '{print $4}' |
cut
> -d"/" -f1`
> 
> and then reference $ETH0_IP wherever you need the IP
> address of eth0.
> 
> [ snip ]
> 
> > # (6) POSTROUTING chain rules
> > iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
> > ## was -> ... -j SNAT --to-source 123.45.67.89
> 
> yes--MASQ is the proper way to SNAT with a dynamic IP.
> 
> -j
> 
> -- 
> Jason Opperisano <opie@817west.com>
> 

> --- kate <kate7234@yahoo.com> wrote:
> 
> > Hi, I am trying to modify a fw script that would
> > work
> > for my small lan, except I need to change references
> > of static IP and SNAT. to eth0 and MASQUERADE, - but
---
This error is send because a malformed rule. If you
tell what exactly are you trying to do will be better
in order to help you.

for example a good rule with eth0 could be:

iptables -A INPUT -i eth0 -s 192.168.0.0/16 -d
0.0.0.0/0 -j ACCEPT

> iptables -A OUTPUT -p ALL -s -i eth0 -j ACCEPT
> ## WAS -> ... 123.45.67.89 -j ACCEPT
what are you trying to tell to your firewall in the
line above??.

iptables -A OUTPUT -p ALL -s 192.168.0.0/16 -d
0.0.0.0/0 -j ACCEPT
where 192.168.0.0/16 is you internal network and 0/0 is
the universe of ip's.

for example if I want to allow anyone access my web
server I will put a rule like:

iptables -A INPUT -i eth0 -m state --state
NEW,ESTABLISHED,RELATED -p tcp -s 0.0.0.0/0 -d
192.168.0.1 --dport 80 -j ACCEPT

If you provide more details I will be pelased to help
you.
Regards.


--
Sergio Basurto J.

If I have seen further it is by standing on the 
shoulders of giants. (Isaac Newton)
--
--

