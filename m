From: varun <varun_saa@rediffmail.com>
Subject: Re: no ssh on eth0
Date: Wed, 02 Aug 2006 19:45:25 +0530
Message-ID: <1154528126.4933.1.camel@nirvana.aurokruti.in>
References: <1154239260.5429.2.camel@nirvana.aurokruti.in>
	<87fygje700.fsf@newton.gmurray.org.uk>
	<Pine.LNX.4.61.0607301343450.23827@yvahk01.tjqt.qr>
	<44CCA802.2090403@plouf.fr.eu.org>
	<facccfbd353e38901017e6dee5a54a99@former03.de>
	<44CCE712.4070907@plouf.fr.eu.org>
	<98ab1181f512c188a486f7e3667bb2c4@former03.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <98ab1181f512c188a486f7e3667bb2c4@former03.de>
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
To: former03 | Baltasar Cevc <baltasar.cevc@former03.de>
Cc: netfilter@lists.netfilter.org, Pascal Hambourg <pascal.mail@plouf.fr.eu.org>

Thanks all, for the detailed
discussion.

Varun


On Sun, 2006-07-30 at 19:17 +0200, former03 | Baltasar Cevc wrote:
> Hi Pascal, hi everybody,
>=20
> > Does this mean you wanted to reply to the list instead of me alone ?
> >
> >>>>> iptables -I INPUT -i eth0 -p tcp --dport 22 -j DROP
> >>>
> >>> If the goal is to prevent *incoming* SSH connections on eth0.
> >> Outgoing would be *something like*
> >>    iptables -A OUTPUT -i eth0 --dport 22 -j DROP (connections from=20
> >> the box to outerspace)
> >>    iptables -A OUTPUT -i eth0 --dport 22 -j DROP (from LAN to=20
> >> outerspace if the box routes that)
> >
> > In the second rule I think you meant FORWARD instead of OUTPUT.
> >
> >>>>     ListenAddress 192.168.222.3
> >>>
> >>> This alone is not enough to prevent connections on eth0. You can=20
> >>> connect to any host address on any interface. E.g. connect to eth1=20
> >>> address on eth0 interface and vice versa.
> >> Well, if it's the common setup of eth0 <some "real" non-private ip)=20
> >> and a private ip for eth1 it will work more or less as expected, as=20
> >> packets won't find the route to 192.168.222.3 (to keep the example=20
> >> IP), because it is just valid in private networks.
> >
> > It won't work when the client is on the same network as eth0, or can=20
> > alter the routing to the server. Your assertion relies on a third=20
> > party's (the ISP) routing and on the assumption that only packets with =

> > the public IP address can hit eth0. I wouldn't like my security to=20
> > rely on a third party. Would you ?
> >
> >> From my point of view the sshd_config solution is nicer in any case,=20
> >> you should add some rules like the followin on a WAN-LAN router to=20
> >> prevent (some) spoofed packets from entering - they will prevent the=20
> >> connection here (if SSH is bound internally only):
> >> iptables -A INPUT -i eth0 -s 192.168.0.0/16 -j DROP
> >> iptables -A INPUT -i eth0 -s 172.16.0.0/12 -j DROP (I haven't=20
> >> verified this /12 mask, you should check the RFCs to be sure)
> >
> > The /12 prefix length is correct.
> >
> >> iptables -A INPUT -i eth0 -s 10.0.0.0/8 -j DROP
> >> iptables -A INPUT -i eth1 -s <external IP> -j DROP
> >> [These routes mean that packets with local adresses should not come=20
> >> from outside and vice versa].
> >
> > But these rules don't prevent connecting from a public source address=20
> > to the private IP address on the public interface.
> You're right, of course - I thought of a firewall situation with NAT -=20
> in that case I'd add
> iptables -A INPUT -i eth0 -d 192.168.0.0/16 -j DROP.
>=20
> That said, I really thought too much about a natted link - so I correct=20
> myself and say:
> I would not only do a packet filter block but also (which was the part=20
> I forgot to say) change the listening address, to have kind of double=20
> protection.
>=20
> Baltasar
>=20
> --
> Baltasar Cevc
>=20
> _____ former 03 gmbh
> _____ infanteriestra=DFe 19 haus 6 eg
> _____ D-80797 muenchen
>=20
> _____ http://www.former03.de
>=20
>=20
>=20

