From: Antonio Alvarez <aramirez@teneinformatica.com>
Subject: RE: multiple destinations
Date: Tue, 17 Aug 2004 20:19:11 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1092770351.24655.17.camel@Toshiba.Toshiba>
References: <D5C9032B2B09C64EA2409D6214E91AC9051299@asimail2.alphanumeric.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <D5C9032B2B09C64EA2409D6214E91AC9051299@asimail2.alphanumeric.com>
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
To: netfilter <netfilter@lists.netfilter.org>

El mar, 17-08-2004 a las 20:12, Jason Opperisano escribi=F3:
> > iptables -t nat -A PROSROUTING -p tcp --dport 80 -d ! 192.168.0.1 (an=
d)
> > ! 192.168.0.50 (and) ! xxx.xxx.xxx.xxx -j REDIRECT 3128
> >
> > I need more than one destination ... may be ussing my own new chains?=
???
> >
> >
> > Thanks in advance
>=20
> you can use ACCEPT, or your own chain (which would use ACCEPT):
>=20
> iptables -t nat -A PREROUTING -p tcp -d 192.168.0.1 --dport 80 -j ACCEP=
T
> iptables -t nat -A PREROUTING -p tcp -d 192.168.0.50 --dport 80 -j ACCE=
PT
> iptables -t nat -A PREROUTING -p tcp -d xxx.xxx.xxx.xxx --dport 80 -j A=
CCEPT
> [ ... ]
> iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to-port 3=
128
>=20
Ahhh... Ok  :-)
the ACCEPT in the table stop the chains ...=20
thanks a lots

> -j
>=20
>=20
>=20
>=20
>=20


