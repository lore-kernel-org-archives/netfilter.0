From: Henry Ritzlmayr <h.ritzlmayr@gmx.at>
Subject: Re: Redirecting incoming traffic to 127.0.0.1
Date: 21 Mar 2003 17:58:10 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1048265890.1492.144.camel@localhost.localdomain>
References: <1048257065.1493.137.camel@localhost.localdomain>
	 <016101c2efbb$db2b8360$8201a8c0@daviddesktop>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <016101c2efbb$db2b8360$8201a8c0@daviddesktop>
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
To: Netfilter Mailing List <netfilter@lists.netfilter.org>

SNAT ist only valid in the POSTROUTING chain. But even that didn=B4t do=20
the trick.=20
Do you know any way to check what really happens with the packet since
tcpdump only shows it before natting?=20
If there is no tool/command or anything like that - than it looks like I
found something to refreshen my c/c++ skills.

Henry


Am Fre, 2003-03-21 um 16.09 schrieb David Ruggles:
> I think (if I understand the problem) I would try this:
>=20
> iptables -t nat -A PREROUTING -p tcp -d 172.16.172.12 -j
> DNAT --to-destination 127.0.0.1
> iptables -t nat -A PREROUTING -p tcp -d 127.0.0.1 -j SNAT --to-source
> 127.0.0.1
>=20
> Please let me know if this works.
>=20
> Thanks,
> David Ruggles
>=20
> CCNA MCSE (NT) CNA A+
> Network Engineer, Safe Data, Inc
> 910-285-7200    david@safedatausa.com
> 0100011101101111011001000110110001101111011101100110010101110011011110010=
110
> 111101110101
> ----- Original Message -----
> From: "Henry Ritzlmayr" <h.ritzlmayr@gmx.at>
> To: "Netfilter Mailing List" <netfilter@lists.netfilter.org>
> Sent: Friday, March 21, 2003 9:31 AM
> Subject: Redirecting incoming traffic to 127.0.0.1
>=20
>=20
> > I have a service running on a box wich is only able to bind to 127.0.0.1
> > (hardcoded and I can=B4t get the source to change it). Since I want to =
use
> > it from any other box the only way to solve that I think is to nat
> > incoming packets to 127.0.0.1.
> >
> > IPTABLES -t nat -A PREROUTING -p tcp -d 172.16.172.12 -j DNAT
> > --to-destination 127.0.0.1
> >
> > and many others wich I tried don=B4t work.
> >
> > If I understood REDIRECT correctly it only changes to the local IP where
> > the packet came in (in my situation 172.16.172.12) wich also not solves
> > the problem.
> >
> > any ideas?
> >
> > Henry
> >
> >
>=20


