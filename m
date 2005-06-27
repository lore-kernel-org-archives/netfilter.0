From: "curby ." <curby.public@gmail.com>
Subject: Re: SSH Brute force attacks - Script version 1.0
Date: Mon, 27 Jun 2005 00:24:58 -0600
Message-ID: <5d2f379105062623243240e265@mail.gmail.com>
References: <5d2f379105062511588033857@mail.gmail.com>
	<002e01c579e1$4d326d00$4206a8c0@loki>
Reply-To: "curby ." <curby.public@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <002e01c579e1$4d326d00$4206a8c0@loki>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On 6/25/05, Marius Mertens <marius.mertens@gmx.de> wrote:
> > (3) Also, is this the only position for the negation that makes the
> > rule work as intended?
>=20
> Yes, you are telling the recent module to do an rcheck in the list,
> the --seconds and --hitcount just specifiy further criteria for that rche=
ck.
> The negation belongs to the whole rcheck construct, you cannot invert jus=
t
> single comparisons within that. Btw, be careful there, at least with my
> installation an incorrectly placed "!" does not trigger an error message,
> but is just ignored, so your rule might do the opposite of what you wante=
d
> it to do. For details and where negations are valid you can also have a l=
ook
> at "iptables -m recent --help"

Ah, indeed that command shows that --seconds and --hitcount cannot
take a negation.  I was going by
http://www.netfilter.org/documentation/HOWTO//netfilter-extensions-HOWTO-3.=
html#ss3.16
which shows that almost all options can take a negation.  Reading the
fine manual was my downfall. =3D)

Thank you for the informative response.

