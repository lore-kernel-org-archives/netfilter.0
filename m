From: Jason Opperisano <opie@817west.com>
Subject: Re: port Forwarding
Date: Tue, 16 Nov 2004 11:48:49 -0500
Message-ID: <1100623729.3266.28.camel@hubcap.ljm.dom>
References: <48e60748e206.48e20648e607@optonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <48e60748e206.48e20648e607@optonline.net>
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
Content-Type: text/plain; charset="utf-8"
To: netfilter@lists.netfilter.org

On Tue, 2004-11-16 at 11:44, diadicic@optonline.net wrote:
> Can someone help me understand this?
>=20
>   I have a firewall setup up with two nic's in it.
>=20
>                1 eth0 24.190.x.x  which is my Internet connection
>                2 eth1 172.16.12.165 which is a local area network.
>=20
>               I have a web server at 172.16.12.160  =E2=80=9CI hope tha=
ts clear=E2=80=9D
>=20
>     Now if I port forward this way it will not work.
>=20
>              =E2=80=9Ciptables -A PREROUTING -i eth0 -t nat -p tcp =E2=80=
=93dport 80 -j DNAT =E2=80=93to=20
>                 172.16.12.160:80=E2=80=9D
>                =E2=80=9Ciptables -A FORWARD -p tcp -d 172.16.12.160 =E2=
=80=93dport 80 -i eth0 -o eth1=20
>                  -j ACCEPT=E2=80=9D
>=20
>=20
> But if I do it this way It will work:
>=20
>                  =E2=80=9Ciptables -t nat  -A PREROUTING -p tcp =E2=80=93=
dport 80 -d 24.190.x.x -i eth0 -j  =20
>                    DNAT --to-destination 172.16.12.160  172.16.12.160=E2=
=80=9D
>=20
>                    =E2=80=9Ciptables -A POSTROUTING -p tcp =E2=80=93dpo=
rt 80 -d 172.16.12.160 -j SNAT -o   =20
>                      eth1 =E2=80=93to-source 172.16.12.165=E2=80=9D
>=20
>=20
> Could anyone please explain why the first way did not work, all the dir=
ections I read claim that is how to port forward.

because the default gateway of 172.16.12.160 is not 172.16.12.165?

-j

--
"Oh, so they have internet on computers now!"
	--The Simpsons


