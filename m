From: "Fritz Mesedilla" <fritz.mesedilla@overturemedia.com>
Subject: RE: securing windows farm  using iptables
Date: Fri, 24 Oct 2003 15:57:45 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <F22386C3FEB012449238672E38ED61E70A8D91@overlord.overturemedia.com>
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
To: Rob Sterenborg <rob@sterenborg.info>, netfilter@lists.netfilter.org


Thanks Rob! I'll look up delegate!


fritz <www.mesedilla.com>
---
+ Basta Ikaw Lord



> -----Original Message-----
> From: Rob Sterenborg [mailto:rob@sterenborg.info]
> Sent: Friday, October 24, 2003 3:49 PM
> To: netfilter@lists.netfilter.org
> Subject: RE: securing windows farm using iptables
>=20
>=20
> > How can I protect a windows exchange server and domain controller?
> > windows farm --- linux iptables -- internet
> >=20
> > Again, I cannot change the windows exchange to linux postfix.=20
> > Although it is within my authority to move to linux, hundreds=20
> > of people using the windows farm won't be glad for a drastic=20
> > change. I am slowly moving some people to linux though. :D
>=20
> You don't have to. Put a Linux/Postfix mail relay between Exchange and
> the internet and firewall the machine. Then you can also do spam/virus
> filtering, etc.
> Your people won't notice it (well, smart ones maybe).
>=20
> > For the exchange server, what ports do I need to open? Do I=20
> > need some port forwarding? I want to create some sort of=20
> > routing through iptables so I can secure the windows server as well.
>=20
> For pop/imap/ldap access you could do portforwarding, but=20
> also proxying.
> In that case maybe Delegate is what you want but there could be better
> options than Delegate. (http://www.delegate.org/delegate/)
>=20
> > For the domain controller, people said I need to make sure dns=20
> > is open. What else do I need to open up? Again, can I just do=20
> > some routing for the dns?
>=20
> If the DC requires DNS and has a DNS service ; yes. That can=20
> be covered
> with NAT.
>=20
> You can configure Exchange to use a smart host (in the above example :
> Postfix) which does the actual sending of email on the internet. Then,
> local DNS is enough for Exchange.
>=20
>=20
> Gr,
> Rob
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


