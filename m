From: "Baake, Matthias" <m.baake@porta.de>
Subject: RE: Help!!!
Date: Thu, 23 Jun 2005 14:00:47 +0200
Message-ID: <201E6F5AC48C274996A5AD8304FAEF869B4D@p001ex03.porta.local>
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
To: radu <radu@adm.utm.md>
Cc: "Netfilter (E-Mail)" <netfilter@lists.netfilter.org>

hi

maybe your workstation is starting the connections and the packets that =
you see are just the return packets?

/matthias

> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org
> [mailto:netfilter-bounces@lists.netfilter.org]On Behalf Of radu
> Sent: Thursday, June 23, 2005 1:51 PM
> To: netfilter@lists.netfilter.org
> Subject: Help!!!
>=20
>=20
> Hello all,
>=20
>       My networck config:
>=20
>   Internet -> linux box -> My PC(192.168.50.101)
>=20
>   linux box
>   eth0 local 192.168.50.0/24
>   eth1 Internet
>  =20
>   my iptables config:
>=20
> iptables -P FORWARD DROP
> iptables -t nat -A PREROUTING -i eth1 -p tcp --dport 4662 -j=20
> DNAT --to 192.168.50.101
> iptables -I FORWARD  -d 192.168.50.101 -p tcp --dport 4662 -j ACCEPT
> iptables -I FORWARD -i eth1 -o eth0 -m state --state=20
> ESTABLISHED,RELATED -j ACCEPT
> iptables -I FORWARD -s 192.168.50.101 -j ACCEPT
> iptables -t nat -I POSTROUTING -o eth1 -j MASQUERADE
>  =20
> why I'm receiving on my PC  packages  with external ip on
> 4690,4544,4581.. ports???
>=20
> --=20
> Best regards,
>  Radu                          mailto:radu@adm.utm.md
>=20
>=20
>=20

