From: "Aldo S. Lagana" <alagana@discmail.com>
Subject: RE: 1:1 NAT, DMZ and Masq
Date: Tue, 18 Feb 2003 16:43:32 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <00ba01c2d796$c854ebb0$3864a8c0@discmail.com>
References: <1045602046.3e529efe1672f@mail.2wire.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1045602046.3e529efe1672f@mail.2wire.ch>
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
To: =?iso-8859-1?Q?'Tiziano_M=FCller'?= <tiziano@ifi.unizh.ch>, netfilter@lists.netfilter.org

You may need FORWARD rules to your DMZ server(s):
iptables -A FORWARD -d <DMZServer> -j ACCEPT

or for more security (I'd recommend):
iptables -A FORWARD -p tcp -d <DMZserver) 80 -j ACCEPT

> -----Original Message-----
> From: netfilter-admin@lists.netfilter.org=20
> [mailto:netfilter-admin@lists.netfilter.org] On Behalf Of=20
> Tiziano M=FCller
> Sent: Tuesday, February 18, 2003 4:01 PM
> To: netfilter@lists.netfilter.org
> Subject: 1:1 NAT, DMZ and Masq
>=20
>=20
> Hi guys
>=20
> I apologize for my first message, it was crap.
> sorry.
>=20
> Now, I\'ve a little problem and no idea how to
> solve it, I hope, someone could give me a hint.
>=20
> Situation:
>=20
> Internet -- Firewall 1 -- DMZ -- Firewall 2 -- LAN
>                            |-- Webserver =3D WWW
>                            |-- FTP
>                            |-- DNS
>=20
> now, for the Server in the DMZ, I wanted to use a 1:1
> NAT, for the hole rest Masq. So did I the follow (for the=20
> WWW) on the Linux-Router:
>=20
> 10.0.0.4 =3D DMZ IP WWW; x.x.x.165 =3D Official IP WWW
>=20
> ifconfig eth1:1:0 add x.x.x.165
> (as described in the NAT HowTo, necessary for the ARP-Packets)
>=20
> iptables -t nat -A PREROUTING -d x.x.x.165 -j DNAT --to=20
> 10.0.0.4 iptables -t nat -A POSTROUTING -s 10.0.0.4 -j SNAT=20
> --to x.x.x.165 iptables -t nat -A POSTROUTING -o eth1 -j MASQUERADE
>=20
> So far it works well from the inside. From outside I can only=20
> ping the WWW and connect with SSH, but not connect via FTP or=20
> WWW (the services are up and running).
>=20
> Has someone an idea, why this happens? Or a better idea to do this?
>=20
> Thanks very much in advance
> Tiziano
>=20


