From: "Robert Botha" <flash@flash.za.org>
Subject: Re: opening a port..
Date: Wed, 8 Jan 2003 15:02:28 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <00b001c2b716$3415e990$53153b0a@nednet.co.za>
References: <1042027958.606.7.camel@nirvana> <1042029237.4335.2.camel@india>
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
To: mdew <mdew@mdew.dyndns.org>
Cc: netfilter <netfilter@lists.netfilter.org>

Check if the service is listening..and if it's listening on *:4662 or on a
specific interface.
netstat -tupln|grep ":4662"

----- Original Message -----
From: "Dharmendra.T" <dharmu@nsecure.net>
To: "mdew" <mdew@mdew.dyndns.org>
Cc: "netfilter" <netfilter@lists.netfilter.org>
Sent: Wednesday, January 08, 2003 2:33 PM
Subject: Re: opening a port..


>
>
> On Wed, 2003-01-08 at 17:42, mdew wrote:
> >
> > Hi,
> > Just *testing* this out..
> >
> > iptables -A INPUT -i eth0 -p tcp --dport 4662 -j ACCEPT
> > iptables -A INPUT -i eth0 -p udp --dport 4662 -j ACCEPT
> > iptables -A INPUT -i eth1 -p udp --dport 4662 -j ACCEPT
> > iptables -A INPUT -i eth1 -p tcp --dport 4662 -j ACCEPT
> > iptables -A INPUT -i eth1 -p tcp --sport 4662 -j ACCEPT
> > iptables -A INPUT -i eth1 -p udp --sport 4662 -j ACCEPT
> > iptables -A INPUT -i eth0 -p udp --sport 4662 -j ACCEPT
> > iptables -A INPUT -i eth0 -p tcp --sport 4662 -j ACCEPT
> >
> > iptables -A FORWARD -o eth0 -p tcp --dport 4662 -j ACCEPT
> > iptables -A FORWARD -o eth1 -p tcp --dport 4662 -j ACCEPT
> > iptables -A FORWARD -o eth1 -p udp --dport 4662 -j ACCEPT
> > iptables -A FORWARD -o eth0 -p udp --dport 4662 -j ACCEPT
> > iptables -A FORWARD -o eth0 -p udp --sport 4662 -j ACCEPT
> > iptables -A FORWARD -o eth1 -p udp --sport 4662 -j ACCEPT
> > iptables -A FORWARD -o eth1 -p tcp --sport 4662 -j ACCEPT
> > iptables -A FORWARD -o eth0 -p tcp --sport 4662 -j ACCEPT
> >
> > yet, when i try to telnet to it,
> >
> > mdew:~# telnet 127.0.0.1 4662
> > Trying 127.0.0.1...
> > telnet: Unable to connect to remote host: Connection refused
> >
> > Yeah I know I have lots of unnessary rules, but im only testing 'em...it
> > just seems a little strange that i cant see 4662 (Edonkey port) on the
> > router.
> >
> > -mdew
> >
> >
> Note:
> telnet 127.0.0.1 port
>
>  This will not go through any of the interfaces(eth*). You should allow
> this through -i lo.
>
> Here some how you are getting connected and you are getting the response
> connection refused. Probably you are not running the service on the
> router!.
>
> --
> Dharmendra.T
> Linux Enthu
>
>
>
>
>


