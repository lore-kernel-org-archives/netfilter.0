From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: firewall bridge , Vlan ?
Date: 09 Jun 2003 12:08:26 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1055153305.648.12.camel@elendil.intranet.cartel-securite.net>
References: <09B04A55822EFF4DA48D2E0BB2941D4A019266@wardrive.citadelcomputer.com.au>
	 <005c01c32e38$380565f0$1500a8c0@expi> <039a01c32e39$ce5ab310$b401a8c0@ows5>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <039a01c32e39$ce5ab310$b401a8c0@ows5>
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
To: loong <loong@eads.com.my>
Cc: netfilter@lists.netfilter.org

Le lun 09/06/2003 =E0 05:46, loong a =E9crit :
> is there anywhere install bridge firewall and install vlan
> http://www.candelatech.com/~greear/vlan.html

This works very well.
=20
> so that my firewall can run like netscreen without using  hug or
> switch to my webserver.

You'll still have to use at leat one switch.
=20
> currently is
> internet -- > eth0 firewall   eth1 -- >   hub ------> webserver 1
>                                                      ------> webserver
> 2
> =20
> is that anywhere i install few network card in my firewall then
> =20
> internet --->    eth0    firewall   eth1 ---->    webserver 1
>                                                      eth2 -----> =20
> webserver 2
>                                                      eth3 ----->=20
> webserver 3

Your physical setup will be like this :

	Internet -> eth0/Firewall/eth1 -> switch -> Web1
						 -> Web2

You can also have :

	Firewall/eth0 -> switch -> Internet
				-> Web1
				-> Web2

But I don't recommand this setup as it relies too much on switch
security features.

So, you connect eth1 to your switch. This switch must support VLAN and
802.1q frame tagging. On the switch, configure the port connected to
eth0 as a 802.1q port (called trunk on Cisco). Now, affect one VLAN to
Web1 port, and another one to Web2 port, etc... Eth0's port will carry
all affected VLANs (see you switch documentation).

Now, on your firewall, use vconfig to create virtual interfaces
associated to each VLAN you want to see through the 802.1q link.

Suppose Web1 is on VLAN1, Web2 on VLAN2 :

	vconfig add eth0 1
	vconfig add eth0 2

This will create vlan0001 and vlan0002 interfaces trhough which you'll
see respectively Web1's traffic and Web2's traffic.

See vconfig man page for further information.

Now, this solution is very scalable as you can add as many VLAN as you
want on your switch. You just have to add them to the 802.1q link and
create proper interface on the firewall. Then you configure your routing
and filtering between those vlan* interfaces just you way you're use to
between physical ones (eth*). Note that eth1 will see 802.1q tagged
frames.

But beware to the fact that this kind of network separation directly
depends on your switch security. If one is able to gain access to the
switch or find a way to bypass it, you loose everything relying on
VLANs. See :

	http://www.arp-sk.org/doc/bh-us-02-convrey-switches.pdf

--=20
C=E9dric Blancher  <blancher@cartel-securite.fr>
IT systems and networks security - Cartel S=E9curit=E9
Phone : +33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 99
PGP KeyID:157E98EE  FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98EE

