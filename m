From: =?iso-8859-1?Q?=D6rjan?= Persson <"o.p+S.P.A.M."@fobie.net>
Subject: Re: TCP redirect external to external host
Date: Tue, 9 Dec 2003 21:05:32 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031209200532.GA20982@fobie.net>
References: <20031209190402.GA16255@fobie.net> <200312091915.49683.Antony@Soft-Solutions.co.uk> <20031209194019.GB17111@fobie.net> <200312091949.57424.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200312091949.57424.Antony@Soft-Solutions.co.uk>
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
To: netfilter@lists.netfilter.org

Antony Stone (Antony@Soft-Solutions.co.uk) wrote:
> On Tuesday 09 December 2003 7:40 pm, =D6rjan Persson wrote:
>=20
> i am afraid that in this situation you cannot achieve the solution you wo=
uld=20
> like.   DNAT on its own will not work.   DNAT+SNAT will work, but you wil=
l=20
> see a constant source IP in your mail server logfiles.   Be happy that th=
is=20
> is only a temporary arrangement.
>=20

Okey, thanks for pointing that out. The problem with such a solution is
that it would make the whole internet be able to send e-mail with the
new SMTP-server, if I don't disallow relay for that IP.

Oh well, I guess I will need to inform everyone about an hostname change
instead then. POP3 is easier since the IP doesn't matter much there.

Cheers

