From: "Fritz Mesedilla" <fritz.mesedilla@overturemedia.com>
Subject: RE: internal web server
Date: Mon, 8 Sep 2003 13:48:20 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <F22386C3FEB012449238672E38ED61E706C220@overlord.overturemedia.com>
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
To: netfilter@lists.netfilter.org


Thank you so much for replying!
I have tried your suggestion as well as Thorten's suggestion but it =
still does not work!

By the way, there is a router in front of all this. Does this have an =
effect on the natting?

router - firewall - web server

I don't want to use the router to route traffic directly to the web =
server as I want all traffic to enter the firewall.
It somehow means there is a double nat that happens.

- router translates 202.138.128.xxx to 192.168.247.3 (firewall internal =
ip)
- firewall hopes to translate 192.168.247.3 port 80 traffic to =
192.168.247.5 (web server internal ip) port 80

When I use the old one like:
iptables -t nat -A PREROUTING -p tcp -d 192.168.247.3 --dport 80 -j DNAT =
--to-destination 192.168.247.5:80

I see this:
[clause@fw firewall]# iptables -nvL -t nat
Chain PREROUTING (policy ACCEPT 3318K packets, 1243M bytes)
 pkts bytes target     prot opt in     out     source               =
destination
   21  1008 DNAT       tcp  --  *      *       0.0.0.0/0            =
192.168.247.3      tcp dpt:80 to:192.168.247.5:80

So I feel that the nat somehow works. I just don't receive any packets =
on the web server.

I hope you can help me again!

Thanks again for helping me.


fritz <www.mesedilla.com>
---
+ Basta Ikaw Lord



> -----Original Message-----
> From: slack geek [mailto:slack_geek@mail.bulgaria.com]
> Sent: Friday, September 05, 2003 10:32 PM
> To: netfilter@lists.netfilter.org
> Subject: Re: internal web server
>=20
>=20
> Hello fritz,
>=20
> You have only one mistake in your iptables command. Since=20
> you're making DNAT and you're refering to firewall's=20
> _external_ ip to connect=20
> to to the internal web server, it's right to do it like this:
>=20
> EXT_IFACE =3D your external network interface ( eth0 for example )
> EXT_IP =3D the ip address attached to your $EXT_IFACE
> INT_WWW_IP =3D your web server ip address
>=20
> iptables -t nat -A PREROUTING -p tcp -i $EXT_IFACE -d $EXT_IP=20
> --dport 80 -j DNAT --to-destination $INT_WWW_IP:80
>=20
>=20
> Cheers, train.
>=20
> On Fri, 5 Sep 2003 20:57:51 +0800
> "Fritz Mesedilla" <fritz.mesedilla@overturemedia.com> wrote:
>=20
> >=20
> > Greetings!
> > I can't seem to make this work...
> >=20
> > - external ip of firewall 202.138.128.xxx
> > - internal ip of firewall 192.168.247.3
> > - internal web server with ip 192.168.247.5
> >=20
> > This was what my code was...
> > $IPT -t nat -A PREROUTING -p tcp -d 192.168.247.3 --dport=20
> 80 -j DNAT --to-destination 192.168.247.5:80
> >=20
> > It doesn't seem to work. I have set the web server to use=20
> the gw of 192.168.247.3
> >=20
> >=20
> > Hope you can help me. Thanks.
> >=20
> > fritz <www.mesedilla.com>
> > ---
> > + Basta Ikaw Lord
> >=20
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
> > email.=20
> >=20
> > Overture Media, Inc.
> > Direct Line: (632) 635-4785
> > Trunkline:   (632) 631-8971 Local 146
> > Level 1 Summit Media Offices, Robinsons Galleria EDSA Cor.=20
> Ortigas Ave., Quezon City 1100
> >=20
> >=20
>=20
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
Level 1 Summit Media Offices, Robinsons Galleria EDSA Cor. Ortigas Ave., =
Quezon City 1100


