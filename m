From: Matevz <matevz@sloweb.net>
Subject: Re: Mail Server Behind IPTABLES
Date: 01 Sep 2004 20:12:45 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1094062361.5456.35.camel@matevz.net>
References: <7768933ECEDCA644AF7908B278CF125D021454@exchange.datec.com.fj>
	<200409011050.44393.Alistair@nerdnet.ca>
	<1094054540.5456.16.camel@matevz.net>
	<200409011227.32394.Alistair@nerdnet.ca>
Reply-To: matevz@sloweb.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200409011227.32394.Alistair@nerdnet.ca>
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
To: Alistair Tonner <Alistair@nerdnet.ca>
Cc: netfilter@lists.netfilter.org

Na 1094056052, 2004-09-01 ob 18:27, je Alistair Tonner napisal(a):
> 	CC;ed the list for consistency.
> 
> 	See inline below
> 
> On September 1, 2004 12:02 pm, Matevz wrote:
> > Na 1094050244, 2004-09-01 ob 16:50, je Alistair Tonner napisal(a):
> > > On August 31, 2004 09:01 pm, Ajen Diwakar wrote:
> > > > Hi All
> > > >
> > > > I am new to IPTABLES usage. I have linux(RH) 9.0.
> > > > The external IP address eth1 is 202.62.x.x
> > > > The internal ip address is 10.0.0.4
> > > >
> > > > My mail server IP address is 10.0.0.10
> > > >
> > > > How do I setup my iptables so that the mail to my record get transfred
> > > > to the mail server.
> > > >
> > > > Any assistance will be appreciated.
> > >
> > > 	iptables -t nat -A PREROUTING -p TCP -i {internet device} -d 202.62.x.x 
> > > \ --dport 25 -j DNAT -to 10.0.0.10
> > >
> > > 	iptables -A FORWARD -p TCP -i {internet device} -d 10.0.0.10 --dport 25 
> > > \ -j ACCEPT
> > >
> > > 	(assuming FORWARD -P DROP )
> > >
> > >
> > > 	Alistair Tonner
> >
> > Hi,
> >
> > I using this for a while and i have a problem.
> > For connctions from outside works just fine, but if i want to access
> > from my LAN dont work.
> 
> 	Because your LAN clients attempt to connect to [publlc IP of mailserver], get 
> connected by reroute through firewall.  Mailserver see's connection from 
> [LANIP] of client and replies *direct* to [LANIP] client.  Client knows NOT 
> of LANIP of mailserver and does not consider the connection valid.
> 
> 	iptables -I PREROUTING -p TCP -i [LAN device] -d [PUBLIC IP mailserver]  \ 
> --dport 25 -j DNAT -to 10.0.0.10
> 	iptables -A FORWARD -p TCP -i [LAN device] -d 10.0.0.10 -s [LAN SEGMENT]   \ 
> --dport 25  -j ACCEPT
> 	iptables -I POSTROUTING -p TCP -i [LAN device] -d 10.0.0.10 -s [LAN SEGMENT]\
>  --dport 25 -j SNAT -to 10.0.0.4
> 
> 	This makes the connection at the mailserver think your firewall is 
> connecting.  Weird, but NOW the replies from the mailserver go back through 
> the firewall, and the client will accept the connection as valid.
> 
> 	A slightly better way to do this is split DNS that tells the clients on the 
> LAN to use the LAN ip of the mailserver.  -- a different topic.
> 
> 	Possibly you want to do the same for port 110 from inside the LAN/??
> 
> 
> >
> > I have also tried without -i.
> >
> > And i was tried this with adding one new rule so it was like -i [eth
> > witch is conncted to LAN]
> >
> > In all cases sharing of internet connction stops working.
> 
> 	iptables -P FORWARD DROP
> 	
> 	iptables -A FORWARD -s [LAN_SEGMENT] -i [LAN_DEVICE] -d 0.0.0.0 -j ACCEPT
> 	iptables -A FORWARD -d [LAN_SEGMENT] -m state --state RELATED,ESTABLISHED  \
> -j ACCEPT
> 
> 	
> 	iptables -A POSTROUTING  -o [INTERNET_DEVICE] -j MASQUERADE 
> 	or
> 	iptables -A POSTROUTING -o [INTERNET_DEVICE] -j SNAT -to [internet address]
> 
> 
> 	keep in mind that you might want to review the ORDER in which the rules 
> load .... it can be critical as to what gets processed when
> 
> iptables -Lnvx 
> iptables -Lnvx -t nat
> iptables -Lnvx -t mangle.
> 
> 
> 
> 	Alistair Tonner

Thank you for ansver, but i think i will give up on this.

iptables -I POSTROUTING -p tcp -i eth0 -d 192.168.2.1 --dport 25 -j SNAT
-to 192.168.2.2

than i get this:

Bad argument `192.168.2.2'



-- 
Lep pozdrav,
Matevz
matevz@sloweb.net


