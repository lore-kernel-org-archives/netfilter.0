From: "Derick Anderson" <danderson@vikus.com>
Subject: RE: Completely Bypassing a Firewall?!
Date: Wed, 25 Jan 2006 09:28:42 -0500
Message-ID: <FAC4E024BF776842876169173CE2F0132CB3A1@mailbox.vikus.com>
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
To: netfilter@lists.netfilter.org

=20

> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org=20
> [mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of=20
> Jason Noble
> Sent: Wednesday, January 25, 2006 9:07 AM
> To: netfilter@lists.netfilter.org
> Subject: Completely Bypassing a Firewall?!
>=20
>=20
> We just heard a rumor about our rival company, that they have=20
> developed
> a "system" that can completely bypass a=20
> properly-configured/locked-down
> firewall (netfilter or any other).
>=20
> Is this truly possible? with only external access and no=20
> software that's
> already been planted inside the firewall?

Depends on how you define "bypass". Can you send SMTP data through port
80? Yes. You can also "bypass" any firewall which filters on source port
but not destination port, but this isn't considered properly configured
much less locked down. Are you sure they're not talking about I[D|P]Ses?
There have been several white papers over the last few years on
bypassing those, and some people think that firewall =3D IPS.

Maybe this rival company has been watching too many recent movie
previews with Harrison Ford in them. If Harrison Ford works for you (and
you happen to be a bank), then I'd be worried. =3D)

Derick Anderson


