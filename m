From: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Subject: Re: Using IPTABLES, cannot go to External Interface
Date: Mon, 16 Jun 2003 10:38:12 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030616143812.GA30628@cannon.eng.us.uu.net>
References: <09B04A55822EFF4DA48D2E0BB2941D4A019284@wardrive.citadelcomputer.com.au> <1055770854.824.3.camel@elendil.intranet.cartel-securite.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1055770854.824.3.camel@elendil.intranet.cartel-securite.net>
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
To: Cedric Blancher <blancher@cartel-securite.fr>
Cc: George Vieira <georgev@citadelcomputer.com.au>, "Netfilter (E-mail)" <netfilter@lists.netfilter.org>

On Mon, Jun 16, 2003 at 03:40:54PM +0200, Cedric Blancher wrote:

> Le lun 16/06/2003 =E0 14:46, George Vieira a =E9crit :
> > You don't need to put the External IPs on the eth0 device for the
> > internal machines to be DNATed. What's the reason you have eth0:0 0:1
> > and 0:2?
>=20
> If you don't add IPs you want to DNAT to external interface, there won'=
t
> be anyone to answer ARP requests on them,

You can do proxy-arp... However, you have to have a route to those IP's...

Ramin

> as Netfilter does not. So you
> have to add them, using aliases (eth0:*) or iproute2 (ip addr add $IP
> dev eth0).
>=20
> =20
> --=20
> C=E9dric Blancher  <blancher@cartel-securite.fr>
> Consultant en s=E9curit=E9 des syst=E8mes et r=E9seaux - Cartel S=E9cur=
it=E9
> T=E9l: +33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 99
> PGP KeyID:157E98EE  FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98E=
E
>=20

