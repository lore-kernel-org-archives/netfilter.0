From: "Mika Ullgren" <mika.ullgren@lemonplanet.com>
Subject: RE: Nat with virtual interfaces
Date: Thu, 27 Jun 2002 15:49:06 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <BACC2B29B574704A8494EAD86EDBB9501C6132@stosrv-0003.lemonplanet.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.samba.org>
content-class: urn:content-classes:message
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Antony Stone <Antony@Soft-Solutions.co.uk>
Cc: netfilter@lists.samba.org

Yes I did. Sorry I forgot to mention that... If I use DNAT exactly the
same thing happens as with REDIRECT.=20

Any other ideas?

// Mika

> -----Original Message-----
> From: Antony Stone [mailto:Antony@Soft-Solutions.co.uk]=20
> Sent: den 27 juni 2002 15:19
> To: netfilter@lists.samba.org
> Subject: Re: Nat with virtual interfaces
>=20
>=20
> On Thursday 27 June 2002 1:49 pm, Mika Ullgren wrote:
>=20
> > Thank you all for answering with such a short notice...
> >
> > I have read each one of you answers.
> >
> > I changed the -I -A in the script to append the rules.
> >
> > Now when I connect to either http://192.168.64.59 or
> > http://192.168.64.75 I get the same DocumentRoot. But when I go to
> > http://192.168.64.75:8443 (eth0:0) i get the other=20
> DocumentRoot. So it
> > seems there is something strange in the redirection.
> >
> > 192.168.64.59:8443, 192.168.64.59:8443 and 192.168.64.75 goes to
> > DocumentRoot no.1
> > 192.168.64.75:8443 goes to DocumentRoot no.2
> >
> > Im completely lost. I hope you got any more ideas.
>=20
> Did you try Patrick's suggestion to use DNAT instead of REDIRECT yet ?
>=20
> =20
>=20
> Antony.
>=20
>=20

