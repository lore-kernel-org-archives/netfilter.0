From: =?iso-8859-1?q?Nicolas=20Boiteux?= <nicolas_boiteux@yahoo.fr>
Subject: Re: Linux kernel module and -m owner match
Date: Thu, 16 Sep 2004 14:58:06 +0200 (CEST)
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20040916125806.85942.qmail@web21006.mail.yahoo.com>
References: <1095338510.2045.20.camel@wolfpack.ljm.dom>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1095338510.2045.20.camel@wolfpack.ljm.dom>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="windows-1252"
To: netfilter@lists.netfilter.org

Nice . You are right, I forgot to activate the
experimental flag . The owner match stuff appear in
the netfilter menu configuration ;)

It would be a good idea to say it, in the man page, or
in the helper page .

Thanks for all,
Nicolas


 --- Jason Opperisano <opie@817west.com> a =E9crit :=20
> On Thu, 2004-09-16 at 07:34, Nicolas Boiteux wrote:
> > yep , i use the kernel of kernel.org . But, in
> fact
> > since the 2.4.23, i use the same .config file .=20
> >=20
> > I copy the oldone it in the /usr/src/linux-2.4.x
> and
> > override the new one . Is it a bad way to do like
> that
> > ?
>=20
> do you have:
>=20
>         CONFIG_EXPERIMENTAL=3Dy
>        =20
> set?  if not--you won't get prompted for the owner
> match.
>=20
> -j
>=20
> --=20
> Jason Opperisano <opie@817west.com>
>=20
>=20
> =20


=09

=09
	=09
Vous manquez d=92espace pour stocker vos mails ?=20
Yahoo! Mail vous offre GRATUITEMENT 100 Mo !
Cr=E9ez votre Yahoo! Mail sur http://fr.benefits.yahoo.com/

Le nouveau Yahoo! Messenger est arriv=E9 ! D=E9couvrez toutes les nouveaut=
=E9s pour dialoguer instantan=E9ment avec vos amis. A t=E9l=E9charger gratu=
itement sur http://fr.messenger.yahoo.com

