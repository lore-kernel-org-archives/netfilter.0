From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: newbie question about port blocking
Date: 17 Apr 2003 17:05:11 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1050591911.740.36.camel@elendil.intranet.cartel-securite.net>
References: <003901c304e8$24b56fa0$2d64a8c0@murrahboy>
	 <200304171622.51239.kimj@dawn.dk>
	 <004701c304ee$4176fb30$2d64a8c0@murrahboy>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <004701c304ee$4176fb30$2d64a8c0@murrahboy>
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
To: kenn murrah <kenn@thebytebusiness.com>
Cc: netfilter@lists.netfilter.org

Le jeu 17/04/2003 =E0 16:33, kenn murrah a =E9crit :
> BTW, i *AM* using squid, and my iptables already includes:
> iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j
> REDIRECT --to-port 3128
> so, will the setup you describe be the only thing i need to add in orde=
r to
> block non-http ports?

If you want to block everything else, than desactivate routing :

	echo 0 > /proc/sys/net/ipv4/ip_forward

You can also set FROWARD chain policy to DROP :

	iptables -P FORWARD DROP

This way, everything is denied, unless you use HTTP proxy.

--=20
C=E9dric Blancher  <blancher@cartel-securite.fr>
Consultant en s=E9curit=E9 des syst=E8mes et r=E9seaux - Cartel S=E9curit=
=E9
T=E9l: +33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 99
PGP KeyID:157E98EE  FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98EE

