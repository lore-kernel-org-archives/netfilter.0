From: Rakotomandimby Mihamina <mrakotom@free.fr>
Subject: Re: What order ? I'm confused ...
Date: Wed, 14 Jan 2004 11:00:11 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200401141100.11056.mrakotom@free.fr>
References: <200401131257.26388.mrakotom@free.fr> <200401131211.11781.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200401131211.11781.Antony@Soft-Solutions.co.uk>
Content-Disposition: inline
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

On Tuesday 13 January 2004 13:11, Antony Stone wrote:
> > If a packet arrives ( fromt the Net , ppp0 interface ) , what rule does
> > he meet first ? ( "iptables -P INPUT DROP" or "iptables -A INPUT -i ppp0
> > -m unclean -j DROP")
>
> The -P is the chain Policy, and doesn't really count as a rule. =A0 It te=
lls
> the system what to do with a packet which doesn't match any of the rules.
>
> The -A means Append, and therefore the rules you have listed above will be
> held in the chain in the order you have shown them (a quick "iptables -L
> INPUT -n -v" will confirm this).
>
> Packets are tested against each rule in turn in a chain, starting with the
> first, until it matches, and then the target for rule is used (eg ACCEPT).

Great ! :-) ... i got it .

> That depends on what you want to log.

The best is to log the packets that are going to be dropped either to repor=
t a=20
disfunction of the FW or to be aware of new kinds of "attacks" ( why not )=
=20
and so that i can send my logs to developpers ...

> If on the other hand, you want to log packets which didn't get matched by
> any of the rules, then you put the LOG rule at the end, and it sees all t=
he
> packets which didn't match your rules (just before they are dealt with by
> the default policy DROP).

so that i keep that philosophy ...=20

> I disagree. =A0 The effect of this is that you are accepting all packets =
for
> TCP ports 20, 21, 25, 80, etc.... whether they are unclean or not. =A0 I
> think it is better to throw out the unclean packets before ACCEPTing the
> clean packets going to the ports you want.

Well , i disagree too , but as well as i did not know the "order" i did not=
=20
put it the right place . :-)
Now i know so i put it where it should :-)=20

Thanks for your quick answers

I give you my final script for i single box with ppp0 connected to the net =
,=20
with no routing nor nat  , but serving http on all the open ports you see .

What's your comments ? ( be nice :-)   )

#=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
#!/bin/zsh

#echo "1" >| /proc/sys/net/ipv4/ip_forward

# REMISE a ZERO des regles de filtrage
iptables -F
iptables -X

# Je veux que les connexions entrantes soient bloqu=E9es par d=E9faut
iptables -P INPUT DROP

# here i DROP all unclean so that i can sleep quietly ;-)
iptables -A INPUT -i ppp0 -m unclean -j DROP

# Je veux que les connexions destin=E9es a etre forwardees
# soient bloqu=E9es par d=E9faut
iptables -P FORWARD DROP

# Je veux que les connexions sortantes soient rejet=E9es par d=E9faut
iptables -P OUTPUT DROP

iptables -A INPUT -i lo -j ACCEPT
#iptables -A INPUT -i eth0 -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT
iptables -A OUTPUT -o eth0 -j ACCEPT


iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -m state --state RELATED,ESTABLISHED -j ACCEPT


# i got an FTP server , is it worth to open 21 ?

iptables -A INPUT -p tcp --dport 20 -j ACCEPT
iptables -A INPUT -p tcp --dport 21 -j ACCEPT

iptables -A INPUT -p tcp --dport 25 -j ACCEPT
iptables -A OUTPUT -p tcp --sport 25 -j ACCEPT

#all these are my HTTP serving ports
# 1 Apache , 3 Zope and 1 Icecast
iptables -A INPUT -p tcp --dport 80 -j ACCEPT
iptables -A INPUT -p tcp --dport 8090 -j ACCEPT
iptables -A INPUT -p tcp --dport 8080 -j ACCEPT
iptables -A INPUT -p tcp --dport 10080 -j ACCEPT
iptables -A INPUT -p tcp --dport 9000 -j ACCEPT


iptables -A INPUT -p icmp -j ACCEPT

#with these , i allow my dyndns updating
#the 4 adresses are my ISP DNS adresses=20
#
#I dont know what port to put here , i tried with 80
#and it worked , so i kept it .

iptables -A OUTPUT -p tcp --dport 80 -j ACCEPT
iptables -A OUTPUT -d 193.252.19.4 -p ALL -j ACCEPT ;
iptables -A OUTPUT -d 193.252.19.3 -p ALL -j ACCEPT ;
iptables -A OUTPUT -d 80.10.246.1 -p ALL -j ACCEPT
iptables -A OUTPUT -d 80.10.246.132 -p ALL -j ACCEPT

iptables -A INPUT -j LOG --log-level info --log-prefix "dropped : "

iptables -A INPUT -j REJECT

#needed or not ? should it be sooner in the rules or=20
#is it OK here ?
iptables -A INPUT -p tcp --syn -m limit --limit 1/s -j ACCEPT
#=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D

What about that last line ? it's about DoS Attacks ... is it good , accordi=
ng=20
to you ?




=2D-=20
Rakotomandimby Mihamina Andrianifaharana
Tel : +33 2 38 76 43 65
http://stko.dyndns.info/site_principal/Members/mihamina


