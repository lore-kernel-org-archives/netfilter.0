From: "Rio Martin" <rio@martin.mu>
Subject: Re: How to classify this packets into correct mangle table?
Date: Fri, 21 Jan 2005 17:55:27 +0000
Message-ID: <1106330127627.t3rmppc@com.sg>
Return-path: <netfilter-bounces@lists.netfilter.org>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: netfilter@lists.netfilter.org

--- Samuel =3D?iso-8859-1?B?RO1heiBHYXJj7WE=3D?=3D <samueldg@arcoscom.com> =
wrote:
> What's do you need?
> Shape the incoming traffic from 192.x subnet? Shape the outgoing traffic >
to=20
> 192.x subnet? Only shape from/to internet these subnets? Explain a bit.=20

I need both outgoing and incoming.
Yes, i ve tried with IMQ but failed, because if i set PREROUTING -i eth0, it
only recognize my public IP, not 192.168.1.x

There are no packets flowing directly to 192.168.1.x coming from the
internet. That because those IP have been set to be NATed to my public IP
before leaving out the interface linked to the internet (eth0).

Regards,
Rio Martin.


> > Dear all,
> > I am so confuse classifying the correct packets into mangle table.
> > Here i describe the situation.=20
> >=20
> > LAN ---- :eth1 [ LINUX-BOX ] eth0: ---- INTERNET
> > eth0 220.1.1.1
> > eth0:1 192.168.1.1
> > eth0:2 192.168.1.2
> > eth1 10.10.10.1 [network 10.10.10.0/24]=20
> >=20
> > I ve those two private IP aliases in eth0 and those get NATed to 220.1.>
1.1
> > before reaching the internet.=20
> >=20
> > I need to shape those two IPs in TC, but i am confuse how to classify i>
t on
> > mangle table. I need to shape the incoming and outgoing packets from th>
ose
> > two IPs.=20
> >=20
> > Need help, thanks ..=20
> >=20
> > Regards,
> > Rio Martin.=20
> >=20
> >=20
> =20
>=20
>=20
> Samuel D=EDaz Garc=ED=ADa
> Director Gerente
> ArcosCom Wireless, S.L.L.=20
>=20
> mailto:samueldg@arcoscom.com
> http://www.arcoscom.com
> m=F3vil: 651 93 72 48
> tlfn/fax: 956 70 13 15=20
>=20
>=20


