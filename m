From: "Fritz Mesedilla" <fritz.mesedilla@overturemedia.com>
Subject: RE: samba and iptables
Date: Fri, 17 Oct 2003 17:56:44 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <F22386C3FEB012449238672E38ED61E70A8D5D@overlord.overturemedia.com>
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
To: "Netfilter Mailing List (E-mail)" <netfilter@lists.netfilter.org>


Here is what I did:
190.200.5.51 - my computer
190.200.5.235 - windows domain controller

$IPTABLES -A INPUT -p tcp -s 190.200.5.51 --dport 137:139 -j ACCEPT
$IPTABLES -A INPUT -p udp -s 190.200.5.51 --dport 137:139 -j ACCEPT
$IPTABLES -A INPUT -p udp -s 190.200.5.235 --sport 137:139 -j ACCEPT

I forgot to allow the windows domain controller to reply back to the =
samba server.

Thanks.

fritz <www.mesedilla.com>
---
+ Basta Ikaw Lord



> -----Original Message-----
> From: Rob Sterenborg [mailto:rob@sterenborg.info]
> Sent: Friday, October 17, 2003 5:32 PM
> To: Fritz Mesedilla; 'Netfilter Mailing List (E-mail)'
> Subject: RE: samba and iptables
>=20
>=20
> > I still can't seem to make samba and iptables work properly.
> >=20
> > First connection - I need to turn iptables off
> > Succeeding connections - I can turn iptables on
> >=20
> > I have done this already:
> > $IPTABLES -A INPUT -p tcp -s 190.200.5.51 --dport 137:139 -j ACCEPT
> > $IPTABLES -A INPUT -p udp -s 190.200.5.51 --dport 137:139 -j ACCEPT
> > $IPTABLES -A INPUT -p tcp -s 190.200.5.51 --dport 445 -j ACCEPT
> >=20
> > It's being blocked in the 1st attempt so I need to turn=20
> > iptables off to make it work.
> > Based on "iptables -nvL" the 3 lines above produce accepted packets.
> > Now what else do I need to add to make the 1st transaction to work?
> >=20
> > By the way, I have 2 network cards. How do I know which one=20
> > is being used by samba?
>=20
> Do you also have something like :
> $IPTABLES -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
>=20
>=20
> Gr,
> Rob
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


