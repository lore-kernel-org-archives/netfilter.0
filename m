From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Port forwarding - what's wrong with my setup?
Date: Fri, 22 Dec 2006 13:53:11 +0100
Message-ID: <458BD537.1040808@plouf.fr.eu.org>
References: <458B87EF.6060007@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <458B87EF.6060007@gmail.com>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

Hello,

Nandan Bhat a =E9crit :
>=20
> I intend to have clients connect to 192.168.1.6 on port 11002=20
> (arbitrary) and have such traffic to be forwarded to 192.168.0.10 on=20
> port 110. Likewise on 192.168.1.6:25000 to 192.168.0.10:25.
[...]
> I expected to be able to telnet 192.168.1.6 on port 11002 and be shown=20
> the response of 192.168.0.10 for the POP server. But I get connection=20
> refused. Any pointers?

Is the connection refused immediately or does it hangs and fail ?
Do you see related lines in the reject logs ?
Did you try from this box or from hosts in the internal network ? NAT=20
rules in the PREROUTING chain do not work with locally generated packets.

> 07 INTIP=3D"192.168.1.6/24"

A single IP address has a /32 prefix length or no prefix length. Here I=20
think 192.168.1.6/24 is equivalent to 192.168.1.0/24 (bits beyond the=20
prefix length are ignored) so it makes -s/-d matches broader than they=20
should be.

> 27 $IPTABLES -A INPUT -i lo -s $UNIVERSE -d $UNIVERSE -j ACCEPT

My advice is don't overload the rules with useless matches. If a rule=20
does not care about a given packet parameter (source/destination=20
address/port, protocol, ICMP type, state...), just don't put the match.=20
It will make your rules shorter and more readable.

> 30 $IPTABLES -A INPUT -i $EXTIF -p ICMP -s $UNIVERSE -d $EXTIP -j ACCEP=
T

If you don't trust the external network, you don't want to accept all=20
ICMP types on the external interface.

> 39 $IPTABLES -A INPUT -i $INTIF -s $INTNET -d $INTIP -m state --state N=
EW \
> 40  -m tcp -p tcp --dport 21 -j ACCEPT
> 41 $IPTABLES -A INPUT -i $INTIF -s $INTNET -d $INTIP -m state --state N=
EW \
> 42  -m tcp -p tcp --dport 22 -j ACCEPT
> 43 $IPTABLES -A INPUT -i $INTIF -s $INTNET -d $INTIP -m state --state N=
EW \
> 44  -m tcp -p tcp --dport 25 -j ACCEPT
> 45 $IPTABLES -A INPUT -i $INTIF -s $INTNET -d $INTIP -m state --state N=
EW \
> 46  -m tcp -p tcp --dport 80 -j ACCEPT
> 47 $IPTABLES -A INPUT -i $INTIF -s $INTNET -d $INTIP -m state --state N=
EW \
> 48  -m udp -p udp --dport 137 -j ACCEPT
> 49 $IPTABLES -A INPUT -i $INTIF -s $INTNET -d $INTIP -m state --state N=
EW \
> 50  -m udp -p udp --dport 138 -j ACCEPT
> 51 $IPTABLES -A INPUT -i $INTIF -s $INTNET -d $INTIP -m state --state N=
EW \
> 52  -m tcp -p tcp --dport 139 -j ACCEPT
> 53 $IPTABLES -A INPUT -i $INTIF -s $INTNET -d $INTIP -m state --state N=
EW \
> 54  -m tcp -p tcp --dport 445 -j ACCEPT
> 55 $IPTABLES -A INPUT -i $INTIF -s $INTNET -d $INTIP -m state --state N=
EW \
> 56  -m tcp -p tcp --dport 3306 -j ACCEPT

You can replace all this with two rules with the 'multiport' match. Or=20
you can "factorize" the common matches "-i $INTIF -s $INTNET -d $INTIP=20
-m state --state NEW" with a user defined chain to make the rules=20
shorter (thus more readable). :-)

> 69 $IPTABLES -A FORWARD -i $INTIF -o $EXTIF -j ACCEPT
> 70
> 71 $IPTABLES -A FORWARD -i $INTIF -p tcp -s $INTNET --sport 11002 \
> 72  -d 192.168.0.10 --dport 110 -j ACCEPT
> 73 $IPTABLES -A FORWARD -i $INTIF -p tcp -s $INTNET --sport 25000 \
> 74  -d 192.168.0.10 --dport 25 -j ACCEPT

There is no reason that the source port of the DNATed packets would be=20
equal to the original destination port, so these two rules would not=20
match. However they are unused because the rule in line #69 accepts the=20
packets before.

> 77 $IPTABLES -t nat -A PREROUTING -p tcp -i $INTIF -d $INTIP \
> 78  --dport 11002 -j DNAT --to 192.168.0.10:110
> 79 $IPTABLES -t nat -A PREROUTING -p tcp -i $INTIF -d $INTIP \
> 80  --dport 25000 -j DNAT --to 192.168.0.10:25

Isn't there a MASQUERADE rule in the POSTROUTING chain for packets=20
leaving $EXTIF from $INTNET ? The server 192.168.0.10 may refuse=20
communications from this netblock.

