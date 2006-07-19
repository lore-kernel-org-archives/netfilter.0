From: Jorge Davila <davila@nicaraguaopensource.com>
Subject: Re: FORWARD packet problem
Date: Wed, 19 Jul 2006 11:19:38 -0600
Message-ID: <1153329578.9157.2.camel@localhost.localdomain>
References: <44BE4BCE.8060509@darkstar.nom.za>
Reply-To: davila@nicaraguaopensource.com
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <44BE4BCE.8060509@darkstar.nom.za>
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
To: Paulo Andre <pandre@darkstar.nom.za>
Cc: netfilter <netfilter@lists.netfilter.org>

There is no so much information to get an answer.

What is your routing table information?

What are your firewall rules?

I'm guessing a routing problem or missed firewall rules.

Jorge.

El mi=E9, 19-07-2006 a las 17:12 +0200, Paulo Andre escribi=F3:
> I have a multiple isp fw
> eth0 =3D int
> eth1 =3D default isp
> eth2 =3D sec isp
>=20
> when I try and make a connection to and internal server via the eth2 ,=20
> the packet appears on the PREROUTING table, and then not on FORWARD ,=20
> anyone have any ideas?
>=20
> Paulo
>=20
--=20
Jorge Isaac Davila Lopez
Nicaragua Open Source
+505 808 2478
davila@nicaraguaopensource.com


