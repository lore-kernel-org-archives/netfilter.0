From: Francois LE BOURDELLES <flebourdelles@free.fr>
Subject: Re: DNAT/SNAT stuff
Date: 11 May 2003 11:20:54 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1052644854.17942.28.camel@charlebourg-2-81-57-105-138.fbx.proxad.net>
References: <1052386761.5804.5.camel@mdew>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1052386761.5804.5.camel@mdew>
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
To: mdew <mdew@orcon.net.nz>
Cc: netfilter <netfilter@lists.netfilter.org>

Hello ,

I just posted a similar question related to the same subject :
nating a full subnet (as described in the NAT howto) that doesn't seems
to work !
in fact it seems that the --to A.B.C.D/X fromat is not implemented (or
has been removed ?)

I'm waiting for a response ... from the list or the authors ....

Regards.

Le jeu 08/05/2003 =E0 11:39, mdew a =E9crit :
> current setup,=20
>=20
> $IPTABLES -t nat -A PREROUTING -i eth0 -d 210.54.175.12 -p tcp --dport
> 4661 -j DNAT --to 10.0.0.3
> $IPTABLES -t nat -A PREROUTING -i eth0 -d 210.54.175.12 -p tcp --dport
> 4662 -j DNAT --to 10.0.0.3
> $IPTABLES -t nat -A POSTROUTING -o eth0 -s 10.0.0.3 -p tcp --sport 4661
> -j SNAT --to 210.54.175.12
> $IPTABLES -t nat -A POSTROUTING -o eth0 -s 10.0.0.3 -p tcp --sport 4662
> -j SNAT --to 210.54.175.12
> $IPTABLES -t nat -A PREROUTING -i eth0 -d 210.54.175.12 -p udp --dport
> 4665 -j DNAT --to 10.0.0.3
> $IPTABLES -t nat -A PREROUTING -i eth0 -d 210.54.175.12 -p udp --dport
> 4672 -j DNAT --to 10.0.0.3
> $IPTABLES -t nat -A POSTROUTING -o eth0 -s 10.0.0.3 -p udp --sport 4665
> -j SNAT --to 210.54.175.12
> $IPTABLES -t nat -A POSTROUTING -o eth0 -s 10.0.0.3 -p udp --sport 4672
> -j SNAT --to 210.54.175.12
>=20
> i would like specify 10.0.0.x instead of 10.0.0.3, how is this done?
>=20
> and some problems i had attempting it..
>=20
> Try `iptables -h' or 'iptables --help' for more information.
> iptables v1.2.6a: Bad IP address `10.0.0.0/24'
> iptables v1.2.6a: host/network `10.0.0.3-10.0.0.8' not found
> Try `iptables -h' or 'iptables --help' for more information.
>=20
> cc: please :)
--=20
Francois LE BOURDELLES <flebourdelles@free.fr>


