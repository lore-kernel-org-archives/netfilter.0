From: "Gary W. Smith" <gary@primeexalia.com>
Subject: RE: Newbie iptables question
Date: Thu, 9 Dec 2004 08:32:45 -0800
Message-ID: <27594E8BA9D5CA458F5EF87D88B6B48F019829@pxtvjoexd01.pxt.primeexalia.com>
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
Content-Type: text/plain; charset="us-ascii"
To: Bernardo Vieira <bernardo.vieira@terra.com.br>, Netfilter <netfilter@lists.netfilter.org>

Bernardo,=20

Where are you performing the scan from?  You need to do it externally if
you want to see how it's operating.  Also, if you're not port forwarding
the you can just do default DROP but allow related back in, which would
drop you down to about 6 rules on this list.

Also, it's more readable if you do a iptables-save and send that output
(IMHO). =20

Gary

=20
> Can anyone shed some light on this?
>=20
> Thanx.
>=20
>=20
>=20
>=20
> ---
> avast! Antivirus: Outbound message clean.
> Virus Database (VPS): 0450-1, 09/12/2004
> Tested on: 9/12/2004 13:47:30
> avast! - copyright (c) 2000-2004 ALWIL Software.
> http://www.avast.com
>=20
>=20
>=20


