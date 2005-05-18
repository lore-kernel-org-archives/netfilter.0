From: "Baake, Matthias" <m.baake@porta.de>
Subject: RE: smtp/pop and NAT only
Date: Wed, 18 May 2005 14:21:50 +0200
Message-ID: <201E6F5AC48C274996A5AD8304FAEF869AB9@p001ex03.porta.local>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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
Content-Type: text/plain; charset="us-ascii"
To: varun_saa@vsnl.net
Cc: "Netfilter (E-Mail)" <netfilter@lists.netfilter.org>

-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org]On Behalf Of
varun_saa@vsnl.net
Sent: Wednesday, May 18, 2005 1:44 PM
To: Rob Sterenborg
Cc: netfilter@lists.netfilter.org
Subject: Re: RE: smtp/pop and NAT only




----- Original Message -----
From: Rob Sterenborg <rob@sterenborg.info>
Date: Wednesday, May 18, 2005 3:54 pm
Subject: RE: smtp/pop and NAT only

> > Hello,
> >      My server is on FC3 (fedora3)
> > eth0 is WAN ---> DSL router ----> ISP
> > eth1 is LAN
>=20
> Not sure I understand the ASCII art : is your server the DSL router ?
The server has two ethernet card. eth0 is basically WAN.
>=20
> > I would like to that 2 client 192.168.0.253 and 192.168.0.248=20
> > are connected to " fedora3 server "
> > via NAT.
>=20
> So that they can do "anything" ?

Yes that is correct.
>=20
> > And all other clients connected to "fedora3 server"
> > are able to only send / recieve mail.
> >=20
> > Howto do that
>=20
> Something like :
>=20
> $IPT -P FORWARD DROP
>=20
> $IPT -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
> $IPT -A FORWARD -i eth1 -o eth0 -s 192.168.0.248 -j ACCEPT
> $IPT -A FORWARD -i eth1 -o eth0 -s 192.168.0.253 -j ACCEPT
> $IPT -A FORWARD -i eth1 -o eth0 -p tcp --dport 25 -j ACCEPT
> $IPT -A FORWARD -i eth1 -o eth0 -p tcp --dport 110 -j ACCEPT
>=20
> $IPT -t nat -A POSTROUTING -o eth0 -s 192.168.0.0/24 -j SNAT \
>  --to-source <inet_ip>

No static IP


>=20
> Maybe Oscars IPTables tutorial is something useful :
> http://iptables-tutorial.frozentux.net/iptables-tutorial.html
>=20
>=20
> Gr,
> Rob

Thanks a lot

I shall give it a try.

Varun
>=20
>=20
>=20

> $IPT -t nat -A POSTROUTING -o eth0 -s 192.168.0.0/24 -j SNAT \
>  --to-source <inet_ip>

No static IP

in this case this should work.

  $IPT -t nat -A POSTROUTING -o eth0 -s 192.168.0.0/24 -j MASQUERADE

Greets,
Matthias


