From: "Fritz Mesedilla" <fritz.mesedilla@overturemedia.com>
Subject: RE: logging a range of ips
Date: Mon, 3 Nov 2003 14:35:27 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <F22386C3FEB012449238672E38ED61E70A8DD9@overlord.overturemedia.com>
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
Content-Type: text/plain; charset="iso-8859-1"
To: Gebauer Ulrich <Ulrich.Gebauer@soldan.de>
Cc: netfilter@lists.netfilter.org


Oh! Thank you so much!!! Thank you!

Cheers,

fritz <www.mesedilla.com>
---
+ Basta Ikaw Lord



> -----Original Message-----
> From: Gebauer Ulrich [mailto:Ulrich.Gebauer@soldan.de]
> Sent: Monday, November 03, 2003 2:33 PM
> To: Fritz Mesedilla
> Cc: netfilter@lists.netfilter.org
> Subject: AW: logging a range of ips
>=20
>=20
> Hi Fritz,
>=20
> Describe a network, not a single ip:
>=20
> $IPTABLES -A INPUT -p tcp -s 190.201.0.0/16 -j LOG=20
> --log-level DEBUG --log-prefix "***LOGTCP: "=20
> $IPTABLES -A INPUT -p udp -s 190.201.0.0/16 -j LOG=20
> --log-level DEBUG --log-prefix "***LOGUDP: "
>=20
> Or
>=20
> $IPTABLES -A INPUT -p tcp -s 190.201.0.0/255.255.0.0 -j LOG=20
> --log-level DEBUG --log-prefix "***LOGTCP: "=20
> $IPTABLES -A INPUT -p udp -s 190.201.0.0/255.255.0.0 -j LOG=20
> --log-level DEBUG --log-prefix "***LOGUDP: "
>=20
> Mit freundlichen Gr=FC=DFen
>         Ulrich Gebauer
>=20
> Hans Soldan GmbH, Dienste f=FCr Anw=E4lte
> Organisation / IT
> Bocholder Stra=DFe 259, 45356 Essen
> Telefon:0201 / 8612-228, Telefax: 0201 / 8612-377
> Email: gebauer@soldan.de
> Internet: http://www.marktplatz-recht.de
>=20
>=20
>=20
>=20
> -----Urspr=FCngliche Nachricht-----
> Von: Fritz Mesedilla [mailto:fritz.mesedilla@overturemedia.com]=20
> Gesendet: Montag, 3. November 2003 07:09
> An: Netfilter Mailing List (E-mail)
> Betreff: FW: logging a range of ips
>=20
>=20
>=20
> Sorry for sending that too quickly.
>=20
> Here is what I want to achieve...
> $IPTABLES -A INPUT -p tcp -s 190.201.0.0 -j LOG --log-level=20
> DEBUG --log-prefix "***LOGTCP: "=20
> $IPTABLES -A INPUT -p udp -s 190.201.0.0 -j LOG --log-level=20
> DEBUG --log-prefix "***LOGUDP: "
>=20
> It doesn't seem to work. I want to log all transactions of=20
> the network of 190.201.x.x.
>=20
> Thanks.
>=20
> Cheers,
>=20
> fritz <www.mesedilla.com>
> ---
> + Basta Ikaw Lord
>=20
>=20
>=20
> > -----Original Message-----
> > From: Fritz Mesedilla
> > Sent: Monday, November 03, 2003 2:07 PM
> > To: Netfilter Mailing List (E-mail)
> > Subject: logging a range of ips
> >=20
> >=20
> >=20
> > Greetings!
> > How do I log a range of ips?
> >=20
> >=20
> > Cheers,
> >=20
> > fritz <www.mesedilla.com>
> > ---
> > + Basta Ikaw Lord
> >=20
> >=20
>=20
> ----------------------------------------------------------------------
> This email and any files transmitted with it are confidential=20
> and intended solely for the use of the individual or entity=20
> to whom they are addressed. If you have received this email=20
> in error please notify the sender immediately by e-mail and=20
> delete this e-mail from your system. Please note that any=20
> views or opinions presented in this email are solely those of=20
> the author and do not necessarily represent those of the=20
> company. Finally, the recipient should check this email and=20
> any attachments for the presence of viruses. The company=20
> accepts no liability for any damage caused by any virus=20
> transmitted by this email.=20
>=20
> Overture Media, Inc.
> Direct Line: (632) 635-4785
> Trunkline:   (632) 631-8971 Local 146
> Fax: (632) 637-2206
> Level 1 Summit Media Offices, Robinsons Galleria EDSA Cor.=20
> Ortigas Ave., Quezon City 1100
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


