From: Ray Anderson <rsa@prideindustries.com>
Subject: RE: Windows Update through Mandrake firewall
Date: Wed, 11 Feb 2004 11:56:13 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000601c3f0d9$1a7c7780$2405010a@rsa>
References: <402A35FA.11068.EBAD7F@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-reply-to: <402A35FA.11068.EBAD7F@localhost>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: cbaker@bbbscentralohio.org, netfilter@lists.netfilter.org

I have no problems updating several Windows machines behind a Mandrake
machine with iptables.  I do NOT have squid running, and only run the
standard iptables suite vs. the canned Mandrake firewall.

I do not believe this is an iptables issue, but perhaps something else
Mandrake has done with their firewall setup.  My rules are very simple, =
and
were obtained by following the tutorial from Oskar
(http://iptables-tutorial.frozentux.net/iptables-tutorial.html)  I go =
back
to this document often, and seem to glean something new from it each =
time.
(Thanks Oskar!)

You shouldn't have to have any ports open, but should use snat from the
internal machines to your external ip address, and dnat from the =
external ip
address to the related,established ports.  That should be it.

-=3DRay
---------------------------------------
He who gets excited in fighting is sure to make mistakes.
Baron Manfred von Richthofen


> -----Original Message-----
> From: netfilter-admin@lists.netfilter.org=20
> [mailto:netfilter-admin@lists.netfilter.org] On Behalf Of=20
> cbaker@bbbscentralohio.org
> Sent: Wednesday, February 11, 2004 11:03 AM
> To: netfilter@lists.netfilter.org
> Subject: Windows Update through Mandrake firewall
>=20
>=20
> I am having trouble running Windows Update through a Mandrake=20
> Multi Network Firewall. I have already asked for help in=20
> several other=20
> forums.
>=20
> I am able to browse other web sites just fine. The Windows=20
> Update site=20
> appears to fail up when I checks my PC for updates. Microsoft's site=20
> support site said that I should "disable the firewall."
>=20
> What ports do I need to open? What rules do I need to have? Could=20
> this be a Squid issue (our web proxy server)?
>=20
> Thanks,
>=20
> Chris
>=20
>=20
> =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Chris Baker -- technical specialist
> 614-839-2447x108
> cbaker@bbbscentralohio.org
> Big Brothers Big Sisters of Central Ohio
> www.bbbscentralohio.org
> Opinions expressed in this e-mail are solely my own.
>=20
>=20


