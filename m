From: Alaios <alaios@yahoo.com>
Subject: Re: Plz i need help.... or i ll be fired :(
Date: Tue, 27 Sep 2005 08:38:37 -0700 (PDT)
Message-ID: <20050927153837.33971.qmail@web54712.mail.yahoo.com>
References: <433962D1.6010107@mnemon.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <433962D1.6010107@mnemon.de>
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
Content-Type: text/plain; charset="iso-8859-1"
To: =?unknown-8bit?q?J=F6rg?= Harmuth <harmuth@mnemon.de>, netfilter@lists.netfilter.org

I have just tested but still i cant see any packets to
the eth0 interface

--- J=F6rg Harmuth <harmuth@mnemon.de> wrote:

> Alaios wrote:
> > Hi plz take a look at the following example
> >=20
> > The laptop has 2 ethernet interfaces
> > To eth1 comes traffic from src 143.233.222.253
> > The eth0 has ip address 10.2.4.2 and it is
> connected
> > back to back with eth1 of other pc with ip address
> > 10.2.4.1
> > I want to forward the traffic with src
> 143.233.222.253
> > to the 10.2.4.1 pc=20
>=20
> [SNIP]
>=20
> > i have also set the
> > /proc/sys/net/ipv4/ip_forward to 1
>=20
> Ok.
>=20
> [SNIP]
>=20
> > I have also tested this one
> > iptables -t nat -A PREROUTING -p tcp -d
> 143.233.222.77
> > (laptop eth1 card) --dport 22453 (i have cheched
> dst
> > port with tcpdump) 00 -j DNAT --to-destination
> > 10.2.4.1
> > this still doesnt work
> > Every time i try to apply a new rule i use first
> > the iptables -F
> > iptables -t nat -F command
>=20
>=20
> Your PREROUTING rule is probably ok, provided that
> 143.233.222.77 is the=20
> IP of eth1. But I think, if the simple approach
> doesn't work you=20
> shouldn't it make more complicated. Keep it small
> and simple and when=20
> you understand all the details, you may go deeper.
> So, may be you would=20
> like to start like this:
>=20
> ## Rewrite destination address
> iptables -t nat -A PREROUTING -i eth1 -s
> 143.233.222.253 \
>           -j DNAT --to 10.2.4.1
>=20
> ## Allow packets to pass FORWARD
> iptables -A FORWARD -m state --state
> ESTABLISHED,RELATED \
>           -j ACCEPT
> iptables -A FORWARD -i eth1 -s 143.233.222.253 \
>           -j ACCEPT
>=20
> ## Now, SNAT outgoing packets
> iptables -t nat -A POSTROUTING -o eth1 -j SNAT --to
> 143.233.222.77
>=20
> If this is a dial-up connection replace the SNAT
> part with MASQUERADE.=20
> BTW, you only need the FORWARD rules if your FORWARD
> policy is DROP or=20
> REJECT. And if you have other policies in filter
> table set to DROP or=20
> REJECT enable loopback. And finally, set all
> policies in nat and mangle=20
> to ACCEPT (and in raw, if you have that). This
> should get you started.
>=20
> HTH,
>=20
> Joerg
>=20
>=20
>=20


__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around=20
http://mail.yahoo.com=20

