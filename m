From: Antonio Alvarez <aramirez@teneinformatica.com>
Subject: Re: multiple destinations
Date: Tue, 17 Aug 2004 19:58:37 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1092769116.24655.14.camel@Toshiba.Toshiba>
References: <1092768581.24655.11.camel@Toshiba.Toshiba>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1092768581.24655.11.camel@Toshiba.Toshiba>
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

El mar, 17-08-2004 a las 19:49, Antonio Alvarez escribi=F3:
> =09
>=20
> Hello=20
>=20
>=20
> how can i do.....
>=20
> iptables -t nat -A PROSROUTING -p tcp --dport 80 -d ! 192.168.0.1 (and)
> ! 192.168.0.50 (and) ! xxx.xxx.xxx.xxx -j REDIRECT 3128=20
>=20
Ok, sorry .... is PREROUTING and .... -j REDIRECT --to-ports 3128 but
the important is more than one destination.

> I need more than one destination ... may be ussing my own new chains???=
?
>=20
>=20
> Thanks in advance
>=20
>=20
>=20
>=20


