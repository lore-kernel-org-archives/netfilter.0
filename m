From: "Fritz Mesedilla" <fritz.mesedilla@overturemedia.com>
Subject: RE: shorewall
Date: Mon, 8 Sep 2003 19:08:38 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <F22386C3FEB012449238672E38ED61E70A8CB3@overlord.overturemedia.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Class: urn:content-classes:message
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
To: Gavin Hamill <gdh@acentral.co.uk>, netfilter@lists.netfilter.org


Thanks Gavin!
My iptables script works for securing our network.=20
It just doesn't work when I want to open up a small routing to an =
internal web server. :D Too much restriction as some said.


fritz <www.mesedilla.com>
---
+ Basta Ikaw Lord



> -----Original Message-----
> From: Gavin Hamill [mailto:gdh@acentral.co.uk]
> Sent: Monday, September 08, 2003 5:52 PM
> To: netfilter@lists.netfilter.org
> Subject: Re: shorewall
>=20
>=20
> On Monday 08 September 2003 10:26, Fritz Mesedilla wrote:
> > Has anybody used shorewall? If I try shorewall to fix my=20
> nat problem (make
> > it easier) and still does not work, will I be able to=20
> disable shorewall and
> > implement a manual setup of iptables again?
>=20
> Shorewall is just a set of scripts to try and make managing=20
> netfilter a little=20
> easier. All it does it generate lots of 'iptables'=20
> commandlines based on=20
> values you plug into /etc/shorewall/*
>=20
> If you decide you don't like it, simply delete the script=20
> files, and do=20
> iptables -F ; iptables -X to clean everything out...
>=20
> Cheers,
> Gavin.
>=20
>=20

----------------------------------------------------------------------
This email and any files transmitted with it are confidential and
intended solely for the use of the individual or entity to whom they
are addressed. If you have received this email in error please notify
the sender immediately by e-mail and delete this e-mail from your
system. Please note that any views or opinions presented in this
email are solely those of the author and do not necessarily represent
those of the company. Finally, the recipient should check this email
and any attachments for the presence of viruses. The company accepts
no liability for any damage caused by any virus transmitted by this
email.=20

Overture Media, Inc.
Direct Line: (632) 635-4785
Trunkline:   (632) 631-8971 Local 146
Level 1 Summit Media Offices, Robinsons Galleria EDSA Cor. Ortigas Ave., =
Quezon City 1100


