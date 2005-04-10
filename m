From: "Gary W. Smith" <gary@primeexalia.com>
Subject: RE: VPN Server HOWTO
Date: Sat, 9 Apr 2005 18:38:21 -0700
Message-ID: <27594E8BA9D5CA458F5EF87D88B6B48F019A66@pxtvjoexd01.pxt.primeexalia.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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
Content-Type: text/plain; charset="iso-8859-1"
To: =?iso-8859-1?Q?Rub=E9n_Cardenal?= <rubenc@arrakis.es>, netfilter@lists.netfilter.org

Or http://openswan.org/.  I think the final answer is based on what the =
user is doing.  In my case I am stuck with PPTP because I don't control =
the clients (as they are clients of mine with hardware I really can't =
control).

We tried openvpn but ran into some issues with CERTS.  Under Openswan we =
never really for the l2tpd daemon running properly.  Sorry to say, pptp =
seems to be the only protocol that is easy for my clients to use.

> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org [mailto:netfilter-
> bounces@lists.netfilter.org] On Behalf Of Rub=E9n Cardenal
> Sent: Saturday, April 09, 2005 6:30 PM
> To: netfilter@lists.netfilter.org
> Subject: Re: VPN Server HOWTO
>=20
> http://openvpn.net/
>=20
> ----- Original Message -----
> From: "Alireza Yazdani" <yazdani1193@yahoo.com>
> To: <netfilter@lists.netfilter.org>
> Sent: Saturday, April 09, 2005 8:05 PM
> Subject: VPN Server HOWTO
>=20
>=20
> > Hi all,
> > I want to install a vpn server on linux redhat 8.
> > my clients have win98,winxp,win2k O.S.
> > what can I do?
> > 1) is linux redhat 8 good for this job?
> > 2) do I need to upgrade 2.4.18 kernel? what kernel you suggest?
> > 3) what package I need to install? PPP or PPTP? what version?
> > Please help me, Thanks.
> >
> >
> >
> >
> > ---------------------------------
> > Do you Yahoo!?
> > Yahoo! Small Business - Try our new resources site!


