From: "Paul Cousins" <paul@pimper.fsnet.co.uk>
Subject: Re: [iptables] Help Required
Date: Wed, 30 Jul 2003 16:28:26 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <002301c356af$3d7d1920$0300a8c0@frodo>
References: <20030730093120.M51327@vfmindia.biz> <000901c356a6$f990eb90$0300a8c0@frodo>
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
To: netfilter@lists.netfilter.org

iptables -t -A PREROUTING -i eth1 -p TCP --dport 1494 -j DNAT --to
192.168.0.1:1494
iptables -A FORWARD -i eth1 -o eth0 -p TCP -d 192.168.0.1 --dport 1494 -j
ACCEPT

opps wrong dest port :)


----- Original Message ----- 
From: "Paul Cousins" <paul@pimper.fsnet.co.uk>
To: <netfilter@lists.netfilter.org>
Sent: Wednesday, July 30, 2003 3:29 PM
Subject: Re: [iptables] Help Required


> iptables -t -A PREROUTING -i eth1 -p TCP --dport 1494 -j DNAT --to
> 192.168.0.1:1494
> iptables -A FORWARD -i eth1 -o eth0 -p TCP -d 192.168.0.1 --dport 22 -j
> ACCEPT
>
> of course your -i and -o interfaces may have different names. -i being the
> external and -o being the internal in this scenario. an dof course the
> address will be different but you should get the idea.
> ------------------------------------------------
> Paul Cousins
> Canterbury Computer Services
> paul@canterburycomputerservices.co.uk
>
>
> ----- Original Message ----- 
> From: "Sridhar Murthy" <sridhar@vfmindia.biz>
> To: <netfilter@lists.netfilter.org>
> Sent: Wednesday, July 30, 2003 10:40 AM
> Subject: [iptables] Help Required
>
>
> >
> >
> > Hi Team,
> >
> > I require help to my following setup:
> >
> > I have a Redhat 8 Server with squid,smtp & pop3 with iptables running.
> >
> > My requirement is we have a citrix server with local LAN ipaddress.
People
> > from Internet will have to access this server from outside(my firewall
is
> > having a public ipaddress which is dynamic assigned). I want to know
what
> is
> > the rules that i have to add to allow the traffic which uses port number
> > 1494, to get into my network and access my citrix server which is having
> LAN
> > ip. Should any nat be added.
> >
> > Thanks in advance.
> >
> > Regards,
> >
> > Sridhar
> >
> >
> >
>
>
>
>



