From: Damjan <gdamjan@mail.net.mk>
Subject: Re: deleting specific rule ...
Date: Mon, 14 Jun 2004 17:58:24 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040614155824.GA5532@legolas.on.net.mk>
References: <20040611160047.73593.qmail@web50210.mail.yahoo.com> <200406111815.35432.Alistair@nerdnet.ca> <20040614150414.GA26186@legolas.on.net.mk> <200406141625.19755.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200406141625.19755.Antony@Soft-Solutions.co.uk>
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

> I don't quite understand why (although I agree that it's remotely possi=
ble),=20

It is especially possible when you have some kind of daemon that's
automatically inserting netfilter rules :)

> so how about using -D instead of -A (or -I) with exactly the same param=
eters=20
> as you specified when adding the rule?

Unfortunatelly that doesn't work with a -m quota rule. Since the delete
will the exact state of the quota (that you can't atomically get) :(


--=20
damjan | =D0=B4=D0=B0=D0=BC=D1=98=D0=B0=D0=BD
This is my jabber ID --> damjan@bagra.net.mk <-- not my mail address!!!

