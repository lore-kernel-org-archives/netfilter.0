From: "Fritz Mesedilla" <fritz.mesedilla@overturemedia.com>
Subject: RE: Port Forwarding
Date: Wed, 29 Oct 2003 10:24:23 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <F22386C3FEB012449238672E38ED61E70A8DB3@overlord.overturemedia.com>
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
To: Jason Mallory <jason@phxrising.com>, netfilter@lists.netfilter.org


I think we may be able to help you. Please give us what config you have =
done.

For a web server, some need to have 4 rules... prerouting a forward =
rule, postrouting and another forward rule.

If you have set iptables -P forward ACCEPT then you only need 2 rules... =
prerouting and postrouting rules.

Send us what you have done and we will try to help you.


Cheers,

fritz <www.mesedilla.com>
---
+ Basta Ikaw Lord



> -----Original Message-----
> From: Jason Mallory [mailto:jason@phxrising.com]
> Sent: Tuesday, October 28, 2003 6:17 AM
> To: netfilter@lists.netfilter.org
> Subject: Port Forwarding
>=20
>=20
> I am tring to do a simple port forwarding from the Internet=20
> to a mcahine=20
> on my LAN. This has proven IMPOSSIBE! No matter how I try to forward=20
> ports, its not working. I am thinking about just setting up a simple=20
> Windows XP box and doing it that way after trying for 12 hours and 5=20
> different configuration methods. Any last suggestions before I switch?
>=20
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
Fax: (632) 637-2206
Level 1 Summit Media Offices, Robinsons Galleria EDSA Cor. Ortigas Ave., =
Quezon City 1100


