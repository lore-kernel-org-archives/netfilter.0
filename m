From: Kjetil Andreas Laasby <list@laasby.com>
Subject: Re: about bridge firewall
Date: 14 Oct 2002 08:45:46 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1034577946.30258.27.camel@Wiggum>
References: <F189nwO1VwJhnD0Ez860000b8a7@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <F189nwO1VwJhnD0Ez860000b8a7@hotmail.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="utf-8"
To: SB CH <chulmin2@hotmail.com>
Cc: netfilter@lists.netfilter.org

NAT and bridge are working on different levels in the IP stack - so
you can't compare them like that. Bridges are faster, yes, because
they work at level 2, NAT works at level 3 + an extra header.

If you want to explore netfilter and bridges, check out from the=20
"Ethernet Bridge+Netfilter HOWTO". One link is :
http://www.think-future.de/DOCUMENTATION/Ethernet-Bridge-netfilter-HOWTO/Et=
hernet-Bridge-netfilter-HOWTO.html


Cheers,
Kjetil Laasby


>=20
> Hello, all.
>=20
> As you know, I heard that bridge is more speedy than NAT method, right?
> so I would like to setup brideg firewall using iptables.
> then, Do you know that any good reference or documents about bridge=20
> firewall using iptables?(As I know, the bridge firewall is availabe only=20
> ipchains.)
>=20
> Always so thanks in advance. ;)
>=20
>=20
>=20
>=20
> _________________________________________________________________
> =EC=A0=84 =EC=84=B8=EA=B3=84 =EC=96=B4=EB=94=94=EC=84=9C=EB=82=98 =EB=AA=
=A8=EB=93=A0 PC=EC=97=90=EC=84=9C =EB=82=B4 PC=EC=B2=98=EB=9F=BC =EC=82=AC=
=EC=9A=A9=ED=95=A0 =EC=88=98 =EC=9E=88=EB=8A=94 =EC=98=A8=EB=9D=BC=EC=9D=B8=
=EC=83=81=EC=9D=98 =ED=95=98=EB=93=9C, MSN=20
> =EC=9B=B9=ED=95=98=EB=93=9C=EB=A5=BC =ED=81=B4=EB=A6=AD=ED=95=98=EC=84=B8=
=EC=9A=94. http://msn.webhard.co.kr
>=20
>=20


