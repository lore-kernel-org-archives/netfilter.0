From: "Fritz Mesedilla" <fritz.mesedilla@overturemedia.com>
Subject: RE: iptables or routing problem
Date: Wed, 22 Oct 2003 17:36:32 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <F22386C3FEB012449238672E38ED61E70A8D7E@overlord.overturemedia.com>
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
To: netfilter@drbroyles.com
Cc: "[netfilter] Mailing List" <netfilter@lists.netfilter.org>


Thank you so much Brandon!

I'll check on that. I really appreciate your help!

Someday I too will be able to help someone as you have helped me.


fritz <www.mesedilla.com>
---
+ Basta Ikaw Lord



> -----Original Message-----
> From: netfilter@drbroyles.com [mailto:netfilter@drbroyles.com]
> Sent: Wednesday, October 22, 2003 3:50 PM
> To: Fritz Mesedilla
> Cc: [netfilter] Mailing List
> Subject: Re: iptables or routing problem
>=20
>=20
> Fritz,
>     No that will not work.  The B-class subnet of 192.168.x.x=20
> is a privately
> available group of IPs that are not allowed onto the=20
> Internet.  192.167.8.1
> is a real-world IP address though.  In fact, the entire 192.167.x.x/16
> address space are real IPs.
>     Any routers connected to the Internet will not route these private
> addresses without some sort of NAT or MASQUERADING.  If your=20
> parent company
> doesn't own IPs that you can use (which is what I suspect to=20
> be the case)
> you'll need to use a different private address space.  If you=20
> need to use a
> private IP space, then you have two other choices.
>     You can use 172.16.x.x or you can use some portion of=20
> 10.x.x.x.  This
> all depends on the intended use of your router.  How many=20
> clients will you
> be servicing?
>     I would suggest you read over the following Howto to get=20
> a better sense
> of how you want to structure your network.
> http://www.tldp.org/HOWTO/IP-Subnetworking.html
>=20
> Brandon Broyles
>=20
> ----- Original Message -----
> From: "Fritz Mesedilla" <fritz.mesedilla@overturemedia.com>
> To: <netfilter@drbroyles.com>
> Cc: "[netfilter] Mailing List" <netfilter@lists.netfilter.org>
> Sent: Wednesday, October 22, 2003 2:41 AM
> Subject: RE: iptables or routing problem
>=20
>=20
>=20
> Oh I can't change the subnets. Our parent company is using a=20
> class-b system.
> 255.255.0.0
>=20
> Would this be possible in a class-b system?
>=20
> eth0: 192.167.8.1
> eth1: 192.168.8.232
>=20
> Just to make them on different subnets?
>=20
> fritz <www.mesedilla.com>
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


