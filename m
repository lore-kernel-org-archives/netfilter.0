From: "verito verito" <edhju_21@hotmail.com>
Subject: Re: help me with firewall+drop by default
Date: Thu, 04 Mar 2004 21:33:26 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <BAY7-F91wfLCvGxxyV80003c01a@hotmail.com>
Mime-Version: 1.0
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
Content-Transfer-Encoding: quoted-printable
To: netfilter@lists.netfilter.org




>From: Antony Stone <Antony@Soft-Solutions.co.uk>
>To: netfilter@lists.netfilter.org
>Subject: Re: help me with firewall+drop by default
>Date: Fri, 5 Mar 2004 01:37:26 +0000
>
>On Friday 05 March 2004 1:24 am, verito verito wrote:
>
> > Firewall was  denied , Just for default I'm sending,  the (setting up)
> > that is  able to  access into the web , but  I can't access into the=20
>mail
> > server (POP), and some web pages that requiered the  Ports
> > (443,21,23,25,110), I hope. I will clear , if there is any question just
> > replying me , Thanks
>
>Where are you tryuing to access the POP3 server from and to?
>
>In other words, where is your client (compared to eth0 adn eth1 in your
>rules), and is the server running on the machine with these rules, or on=20
>some
>other server being routed through this one?
****************************************************
eth0=3Dlan
eth1=3Dinternet
The server pop3 is external I must open the ports 110 and 25
Since I use the outlook as client of mail in order that it could send and=20
receive post office
***********************************************************************
> > iptables -P INPUT DROP
> > iptables -P OUTPUT DROP
> > iptables -P FORWARD DROP
> > iptables -t nat -A PREROUTING -t tcp --dport 80 -j REDIRECT --to-port=20
>8080
> > iptables -t nat -A POSTROUTING -o eth1 -j MASQUERADE
> > echo "1" > /proc/sys/net/ipv4/ip_forward
> > iptables -A INPUT -i eth0 -s 0/0 -d 0/0 -j ACCEPT
> > iptables -A -i lo -s 0/0 -d 0/0 -j ACCEPT
> > iptables -A FORWARD -i eth1 -o eth0 -m state --state ESTABLISHED,RELATE=
D=20
>-j
> > ACCEPT
> > iptables -A INPUT -i eth1 -m state --state ESTABLISHED,RELATED -j ACCEPT
> > iptables -A FORWARD -i eth0 -o eth1 -j ACCEPT
> > iptables -A OUTPUT -j ACCEPT
>
>Antony.
>
>--
>90% of networking problems are routing problems.
>9 of the remaining 10% are routing problems in the other direction.
>The remaining 1% might be something else, but check the routing anyway.
>
>                                                      Please reply to the =

>list;
>                                                            please don't C=
C=20
>me.
>
>

_________________________________________________________________
MSN Amor: busca tu =BD naranja http://latam.msn.com/amor/


