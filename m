From: "Chris Baker" <cbaker@bbbscentralohio.org>
Subject: SOLVED: Windows Update through Mandrake firewall
Date: Wed, 11 Feb 2004 16:30:22 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <0A9604FAD805DD4CB404FFA1B950747717F34D@msbbbs1.bbbs.bbbscentralohio.org>
References: <000601c3f0d9$1a7c7780$2405010a@rsa>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000601c3f0d9$1a7c7780$2405010a@rsa>
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
To: netfilter@lists.netfilter.org

It was a Squid problem. Squid had disabled several applications. Once I
enabled those web apps, Windows Update worked fine. Thanks for the
suggestion, even though this wasn't an IP tables issue.

Register your team online today!
BOWL FOR KIDS'SAKE 2004
Saturday, March 6, 2004
www.bfkscentralohio.org
You'll be "bowled over" when our brochure "strikes" your mailbox at the =
end
of January.sorry.we couldn't help ourselves! If you do not receive one,
please contact me!

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Chris Baker -- technical specialist
614-839-2447x108 -- cbaker@bbbscentralohio.org
www.bbbscentralohio.org -- Big Brothers Big Sisters of Central Ohio
Opinions expressed in this e-mail are solely my own.

The document(s) accompanying or within this email transmission may =
contain
confidential information belonging to Big Brothers Big Sisters of =
Central
Ohio, which is legally privileged for the entity named above.  If you =
are
not the intended recipient, you are hereby cautioned that any =
disclosure,
copying, distribution, or the taking of any action in reliance on the
contents of this email information is strictly prohibited.  If you =
receive
this email in error, please notify us immediately by fax (614-839-5437) =
or
phone (614-839-2447) to advise of the error.

-----Original Message-----
From: Ray Anderson [mailto:rsa@prideindustries.com]=20
Sent: Wednesday, February 11, 2004 2:56 PM
To: Chris Baker; netfilter@lists.netfilter.org
Subject: RE: Windows Update through Mandrake firewall

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



