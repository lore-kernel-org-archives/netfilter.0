From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: Using IPTABLES, cannot go to External Interface
Date: 16 Jun 2003 11:15:52 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1055754951.650.38.camel@elendil.intranet.cartel-securite.net>
References: <88116A11E9DFD411870900508BEC3831803B42@CPQ01>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <88116A11E9DFD411870900508BEC3831803B42@CPQ01>
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
To: Deshwal Chand <CDD@kampsax.co.in>
Cc: "Netfilter (E-mail)" <netfilter@lists.netfilter.org>

Le lun 16/06/2003 =E0 09:51, Deshwal Chand a =E9crit :
> I am running a script for IPTABLES.
> I have assigned 3 more IP addresses to my external interface.=20
> eth0 - x.y.z.1
> eth0:0 - x.y.z.2
> eth0:1 - x.y.z.3
> eth0:2 - x.y.z.4
> I have SNATed my internal network to eth0. I can do all the things.
> But, I cannot reach to any of IP addresses x.y.z.1 - 3.

Reach them from where ? SNAT is handled through FORWARD. Local trafic is
handled though INPUT and OUTPUT. Maybe there's something to look at
there.

> Though, I can go to any host in the world, but cannot go directly to
> eth0.

Can you be a little more explicit in your setup and what you exactly
want to do ?
     =20
--=20
C=E9dric Blancher  <blancher@cartel-securite.fr>
Consultant en s=E9curit=E9 des syst=E8mes et r=E9seaux - Cartel S=E9curit=
=E9
T=E9l: +33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 99
PGP KeyID:157E98EE  FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98EE

