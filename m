From: "Derick Anderson" <danderson@vikus.com>
Subject: RE: Letting out port 80 traffic
Date: Mon, 28 Nov 2005 12:14:41 -0500
Message-ID: <FAC4E024BF776842876169173CE2F01313B148@mailbox.vikus.com>
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
To: Paul Collen <paul.collen@brahler-ics.co.uk>, netfilter@lists.netfilter.org

=20

> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org=20
> [mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of=20
> Paul Collen
> Sent: Friday, November 25, 2005 10:59 AM
> To: netfilter@lists.netfilter.org
> Subject: RE: Letting out port 80 traffic
>=20
>  Hello,
>=20
> Yep, it's working now but I don't know how. As far as I can=20
> see it's configured the same way it was when I started this=20
> morning, but Squid isn't running so theoretically we=20
> shouldn't have web access. I don't want to fiddle with it=20
> anymore today (being POETS day) but I'm sure I'll break it=20
> again on Monday.
>=20
> Thanks for your help with this problem.
>=20
> Cheers,
>=20
> Paul.
>=20


Since you are using Squid, your client users will attempt to use the
proxy (8080?) rather than going out port 80 on the firewall until they
forget about the proxy settings and request pages directly (IE is set to
automatically discover proxy settings by default, while Firefox is set
to connect directly by default). Since you opened port 80, your web
clients now have an alternate path to the Internet.

At least that is my best guess. =3D)

Derick Anderson

