From: Damjan <gdamjan@mail.net.mk>
Subject: Re: deleting specific rule ...
Date: Mon, 14 Jun 2004 17:04:14 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040614150414.GA26186@legolas.on.net.mk>
References: <20040611160047.73593.qmail@web50210.mail.yahoo.com> <001001c44ff0$8ec113a0$0300000a@serverxx> <200406111815.35432.Alistair@nerdnet.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200406111815.35432.Alistair@nerdnet.ca>
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
To: netfilter@lists.netfilter.org
Cc: Alistair Tonner <Alistair@nerdnet.ca>

> > here is the list of rule in my iptables
> >
> > now i want to delete this rule ..
> >
> > wat will be the command in doing so ?
>=20
> 	Hi -- relist the rules=20
>=20
> 	iptables -L -n --line-numbers
>=20
> 	will number each line.
>=20
> 	iptables -D INPUT x

Unfourtenatelly there's a chance that between those two commands the
line-number of the required rule could change.

--=20
damjan | =D0=B4=D0=B0=D0=BC=D1=98=D0=B0=D0=BD
This is my jabber ID --> damjan@bagra.net.mk <-- not my mail address!!!

