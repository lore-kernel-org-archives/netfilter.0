From: "Fritz Mesedilla" <fritz.mesedilla@overturemedia.com>
Subject: RE: internal web server
Date: Fri, 5 Sep 2003 22:19:13 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <F22386C3FEB012449238672E38ED61E70A8CA3@overlord.overturemedia.com>
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
To: Thorsten Scherf <tscherf@web.de>, netfilter@lists.netfilter.org


I have tried both.
I used "iptables -nvL" and saw that there were like 2 packets each =
attempt to access the web server. But gets no reply. :D


fritz <www.mesedilla.com>
---
+ Basta Ikaw Lord



> -----Original Message-----
> From: Thorsten Scherf [mailto:tscherf@web.de]
> Sent: Friday, September 05, 2003 9:58 PM
> To: Fritz Mesedilla; netfilter@lists.netfilter.org
> Subject: Re: internal web server
>=20
>=20
> >- external ip of firewall 202.138.128.xxx
> >- internal ip of firewall 192.168.247.3
> >- internal web server with ip 192.168.247.5
> >
> >This was what my code was...
> >$IPT -t nat -A PREROUTING -p tcp -d 192.168.247.3 --dport 80 -j DNAT
> > --to-destination 192.168.247.5:80
> >
> >It doesn't seem to work. I have set the web server to use the gw of
> > 192.168.247.3
>=20
> Not really sure what you want, but if you try to write a rule=20
> for forwarding=20
> packets which destination Port 80 to your internal web=20
> server, try this=20
> one:
>=20
> $IPT -t nat -A PREROUTING -p tcp --dport 80 -j DNAT --to-destination=20
> 192.168.247.5:80
>=20
> If you know your external fw-IP you can specify it in the rule:
>=20
> $IPT -t nat -A PREROUTING -p tcp --dport 80 -d=20
> 202.138.128.xxx -j DNAT=20
> --to-destination 192.168.247.5:80
>=20
>=20
> Greetings,
>=20
> Thorsten Scherf,
> RHCE, RHCX
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


