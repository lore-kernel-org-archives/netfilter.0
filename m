From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Help with alias interfaces
Date: Wed, 23 Jun 2004 15:53:01 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200406231553.01584.Antony@Soft-Solutions.co.uk>
References: <FLECICIIDHIEIENHHOOLIEFNCCAA.esanz@minorplanetusa.com>
Reply-To: <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <FLECICIIDHIEIENHHOOLIEFNCCAA.esanz@minorplanetusa.com>
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
To: netfilter@lists.netfilter.org

On Wednesday 23 June 2004 4:31 pm, Erick Sanz wrote:

> All,
>
> 	I tried the suggested solution with no luck...  Also,
> I did not hear from anybody hosting DNS...

Multiple IPs on a single interface are nothing special for netfilter.

The deprecated way to get multiple IPs results in pseudo-interface names such 
as eth1:0, eth1:1 etc as you discussed.   The recommended way to assign 
multiple IPs on one interface (ip addr add a.b.c.d dev eth1) simply results 
in multiple IPs on the interface - no strange new names appear, therefore I 
think it is a much more obvious and clear way of doing it.

Either way, once you are configuring your netfilter rules, you simply refer to 
the simple interface name (eg eth1).   It makes no difference to netfilter 
which method you used to get the multiple addresses assigned.

Also, I see nothing wrong with your DNS rules - there's nothing special about 
getting packets to a DNS server NATted and FORWARDed (so long as you remember 
it uses both UDP and TCP, which you have).   Other than that, it's just the 
same as doing this for a web server, mail server, etc.

Do you have other such servers which *are* working properly with NAT and 
FORWARDing?   If so, is there any obvious difference about the rules, the 
routing, or the machines which can / cannot access the appropriate servers?

Regards,

Antony.

> 	Original post below.
>
> Best regards,
> Erick Sanz
>
> > 	All,
> >
> > 	I have multiple interfaces in a system (eth1, eth1:0,
> > eth1:1 and eth1:2),
> > and I need to forward things for several ports to them.
> >
> > 	Since IPtables do not understand eth1:1, my rules look
> > something like
> > this:
> >
> > # Ftp server
> >     iptables -t nat -A PREROUTING -p tcp -d $FTP_IPADDR --dport
> > 21 -j DNAT --to $FTP_SERVER
> >     iptables -A FORWARD -i eth1 -p tcp -d $FTP_SERVER --dport 21
> > -m state --state NEW -j ACCEPT
> >
> > # Web server
> >     iptables -t nat -A PREROUTING -p tcp -d $WEB_IPADDR --dport
> > 80 -j DNAT --to $WEB_SERVER
> >     iptables -A FORWARD -i eth1 -p tcp -d $WEB_SERVER --dport 80
> > -m state --state NEW -j ACCEPT
> >
> > 	eth1 is my WAN interface... Is this correct?
> >
> > 	Also, for the life of my I don't seem to be able to get DNS
> > resulution to my
> > DNS server; my rules are as follows:
> >
> >     iptables -t nat -A PREROUTING -p udp -d $DNS_1 --dport 53 -j
> > DNAT --to $DNS_SERVER1
> >     iptables -t nat -A PREROUTING -p tcp -d $DNS_1 --dport 53 -j
> > DNAT --to $DNS_SERVER1
> >
> >     iptables -t nat -A PREROUTING -p udp -d $DNS_2 --dport 53 -j
> > DNAT --to $DNS_SERVER2
> >     iptables -t nat -A PREROUTING -p tcp -d $DNS_2 --dport 53 -j
> > DNAT --to $DNS_SERVER2
> >
> >     iptables -A FORWARD -i eth1 -p udp -d $DNS_SERVER1 --dport 53
> > -m state --state NEW -j ACCEPT
> >     iptables -A FORWARD -i eth1 -p tcp -d $DNS_SERVER1 --dport 53
> > -m state --state NEW -j ACCEPT
> >
> >     iptables -A FORWARD -i eth1 -p udp -d $DNS_SERVER2 --dport 53
> > -m state --state NEW -j ACCEPT
> >     iptables -A FORWARD -i eth1 -p tcp -d $DNS_SERVER2 --dport 53
> > -m state --state NEW -j ACCEPT
> >
> > 	Besides those rules, I also allow ping to those interfaces.
> >
> > 	Does anybody host their own DNS, if so, could you share
> > your rules (without
> > IP addresses, to protect the identity of the inocent...)    ;)
> >
> > 	Beforehand, thank you for your help!
> >
> > Best regards,
> > Erick Sanz
>
> This email message has been scanned for viruses.

-- 
"There is no reason for any individual to have a computer in their home."

 - Ken Olsen, President of Digital Equipment Corporation (DEC, later consumed 
by Compaq, later merged with HP)

                                                     Please reply to the list;
                                                           please don't CC me.


