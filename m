From: "Fritz Mesedilla" <fritz.mesedilla@overturemedia.com>
Subject: RE: firewalled dns clients
Date: Fri, 7 Nov 2003 13:05:09 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <F22386C3FEB012449238672E38ED61E70A8E31@overlord.overturemedia.com>
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
To: Alistair@nerdnet.ca, "Netfilter Mailing List (E-mail)" <netfilter@lists.netfilter.org>


No I don't have a dns server. I want them to be able to access the isp's =
dns.

I guess I have to forward them.

Thanks.

Cheers,


fritz <www.mesedilla.com>
---
+ Basta Ikaw Lord



> -----Original Message-----
> From: Alistair Tonner [mailto:Alistair@nerdnet.ca]
> Sent: Friday, November 07, 2003 12:46 PM
> To: Fritz Mesedilla; Netfilter Mailing List (E-mail)
> Subject: Re: firewalled dns clients
>=20
>=20
> On November 6, 2003 10:49 pm, Fritz Mesedilla wrote:
> > Greetings!
> > Thank to all of your help I was able to create a safe=20
> network behind an
> > iptables firewall. Now I need help again.
> > How do I let the workstations do a nslookup?
> >
> >           Internet
> >
> >
> >           Firewall
> >
> >
> >     -------------------------------
> >
> >
> > workstation    workstation    workstation
> >
> >
> >
> >
> > From their windows workstation, I want to be able to let=20
> them perform a
> > nslookup.
> >
> > I tried this and nothing happened.
> > $IPTABLES -A INPUT -p tcp --sport 53 -j ACCEPT
> > even a
> > $IPTABLES -A INPUT -p tcp --dport 53 -j ACCEPT
> >
> > Do I need a nat?
> >
> 	You may need to include upd port 53 access for the clients.
> 	is your DNS server on the iptables firewall box?=20
> 	if not the above rules aren't gonna help.
> 	you need to allow 53 to the DNS server -- if you are=20
> using external DNS you=20
> need to allow the ports through the FORWARD chain.
> >
> > Cheers,
> >
> >
> > fritz <www.mesedilla.com>
> > ---
> > + Basta Ikaw Lord
> >
> >
> >=20
> ----------------------------------------------------------------------
> > This email and any files transmitted with it are confidential and
> > intended solely for the use of the individual or entity to whom they
> > are addressed. If you have received this email in error=20
> please notify
> > the sender immediately by e-mail and delete this e-mail from your
> > system. Please note that any views or opinions presented in this
> > email are solely those of the author and do not necessarily=20
> represent
> > those of the company. Finally, the recipient should check this email
> > and any attachments for the presence of viruses. The company accepts
> > no liability for any damage caused by any virus transmitted by this
> > email.
> >
> > Overture Media, Inc.
> > Direct Line: (632) 635-4785
> > Trunkline:   (632) 631-8971 Local 146
> > Fax: (632) 637-2206
> > Level 1 Summit Media Offices, Robinsons Galleria EDSA Cor.=20
> Ortigas Ave.,
> > Quezon City 1100
>=20
> --=20
>=20
> 	Alistair Tonner
> 	nerdnet.ca
> 	Senior Systems Analyst - RSS
> =09
>      Any sufficiently advanced technology will have the=20
> appearance of magic.
> 	Lets get magical!
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


