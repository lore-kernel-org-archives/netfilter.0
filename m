From: Peggy Kam <ppkam@n-dsi.com>
Subject: Re: iptables rules
Date: Thu, 15 Sep 2005 11:37:09 -0400
Message-ID: <1126798629.4790.26.camel@ndspc131.p.n-dsi.com>
References: <1123184190.21749.34.camel@ndspc131.p.n-dsi.com>
	<Pine.LNX.4.61.0508050832310.20623@yvahk01.tjqt.qr>
	<1123704837.3708.1.camel@ndspc131.p.n-dsi.com>
	<1126649450.4790.5.camel@ndspc131.p.n-dsi.com>
	<1126797736.4790.24.camel@ndspc131.p.n-dsi.com>
	<432992C0.2000404@mnemon.de>
Reply-To: ppkam@n-dsi.com
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <432992C0.2000404@mnemon.de>
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
To: =?ISO-8859-1?Q?J=F6rg?= Harmuth <harmuth@mnemon.de>
Cc: netfilter@lists.netfilter.org

did the manpage gets changed recently?  the iptables manpage that I see
states that:

--port [port[,port]]
        Match if the both the source and destination ports are equal to
        each other and to one of the given ports.


On Thu, 2005-09-15 at 17:26 +0200, J=F6rg Harmuth wrote:
> Peggy Kam wrote:
> > Hi,
> >=20
> > I have defined the following firewall rule in iptables:
> >=20
> > iptables -I FORWARD -s 192.168.22.102 -d 192.168.1.112 -p tcp -m tcp =
-m
> > multiport --ports 22,23,24,25 -j ACCEPT
> >=20
> > why were the packets able to get to 192.168.1.112 on port 22 when the
> > packets does not even come from ports 22,23,24 or 25?
>=20
> man iptables:
>=20
> --ports [!] port[,port[,port:port...]]
>                Match if either the source or destination
>                ports are equal to one
>                of the given ports.
>=20
> So, this is expected behaviour, provided that there are no other rules=20
> in the way.
>=20
> HTH,
>=20
> Joerg
>=20
>=20


