From: Jason Opperisano <opie@817west.com>
Subject: RE: Port forwarding
Date: Fri, 17 Sep 2004 09:33:55 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1095428035.1886.36.camel@wolfpack.ljm.dom>
References: <20040917132253.B6B1E6A5@mail.817west.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20040917132253.B6B1E6A5@mail.817west.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset=; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

On Fri, 2004-09-17 at 09:23, KUCKAERTZ R=C3=A9gis - NVISION wrote:
> $ iptables -vnxL -t nat; iptables -vnxL -t mangle; iptables -vnxL
>=20
> # nat table
> Chain PREROUTING (policy ACCEPT 2439 packets, 148991 bytes)
>     pkts      bytes target     prot opt in     out     source
> destination        =20
>       17       1020 DNAT       tcp  --  *      *       0.0.0.0/0
> $MASK_IP         tcp dpt:$MASK_PORT to:$REAL_IP:$REAL_PORT=20
>=20
> Chain POSTROUTING (policy ACCEPT 741 packets, 45651 bytes)
>     pkts      bytes target     prot opt in     out     source
> destination        =20
>        0          0 SNAT       tcp  --  *      *       0.0.0.0/0
> $REAL_IP         tcp dpt:$REAL_PORT to:$MASK_IP=20
>=20
> Chain OUTPUT (policy ACCEPT 741 packets, 45651 bytes)
>     pkts      bytes target     prot opt in     out     source
> destination        =20
>=20
> # mangle table
> Chain PREROUTING (policy ACCEPT 1567265 packets, 1105330580 bytes)
>     pkts      bytes target     prot opt in     out     source
> destination        =20
>=20
> Chain OUTPUT (policy ACCEPT 1181535 packets, 615648770 bytes)
>     pkts      bytes target     prot opt in     out     source
> destination        =20
>=20
> # filter table
> Chain INPUT (policy ACCEPT 44233 packets, 9251612 bytes)
>     pkts      bytes target     prot opt in     out     source
> destination        =20
>=20
> Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
>     pkts      bytes target     prot opt in     out     source
> destination        =20
>        0          0 ACCEPT     all  --  *      *       0.0.0.0/0
> 0.0.0.0/0          state RELATED,ESTABLISHED=20
>        0          0 ACCEPT     tcp  --  *      *       0.0.0.0/0
> $REAL_IP           tcp dpt:$REAL_PORT
>=20
> Chain OUTPUT (policy ACCEPT 41927 packets, 30331854 bytes)
>     pkts      bytes target     prot opt in     out     source
> destination  =20

is it possible that $REAL_IP is a local IP address on the machine
running netfilter?  the reason i ask is that the packet counters on the
FORWARD chain are zero (whereas INPUT and OUTPUT are over 40000).

-j

--=20
Jason Opperisano <opie@817west.com>


