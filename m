From: "Mika Ullgren" <mika.ullgren@lemonplanet.com>
Subject: RE: Nat with virtual interfaces
Date: Thu, 27 Jun 2002 14:49:02 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <BACC2B29B574704A8494EAD86EDBB9500993B2@stosrv-0003.lemonplanet.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.samba.org>
content-class: urn:content-classes:message
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

Thank you all for answering with such a short notice...=20

I have read each one of you answers.=20

I changed the -I -A in the script to append the rules.

Now when I connect to either http://192.168.64.59 or
http://192.168.64.75 I get the same DocumentRoot. But when I go to
http://192.168.64.75:8443 (eth0:0) i get the other DocumentRoot. So it
seems there is something strange in the redirection.=20

192.168.64.59:8443, 192.168.64.59:8443 and 192.168.64.75 goes to
DocumentRoot no.1
192.168.64.75:8443 goes to DocumentRoot no.2

Im completely lost. I hope you got any more ideas.=20

Thank you all.

PS. Same rules now only difference is that i changed -I with -A on the
rules for 192.168.64.75 DS.

// Mika

> -----Original Message-----
> From: Mika Ullgren=20
> Sent: den 27 juni 2002 14:03
> To: netfilter@lists.samba.org
> Subject: Nat with virtual interfaces
>=20
>=20
> Hello Netfilter@
>=20
> I have a litlle question that i was unable to find the answer to. I am
> running linux machine 2.4.9 kernel with iptables v1.2.1a. And I cant
> figure out what I am doing wrong. I'll try to explain.
>=20
> The machine is running a apache server with two virtual hosts (both on
> IP basis) Note that these two IP's are on the same interface (virtual
> interfaces) see ifconfig output at the end of this mail. These two
> vhosts have different DocumentRoot's. Each of them are=20
> listening on two
> ports 8080 and 8443.=20
>=20
> To nat to the correct ports I have the following nat rules that i run
> from a script.=20
>=20
>=20
> --- script start ---
> #! /bin/sh
>=20
> export IPTABLES=3D"/usr/local/sbin/iptables";
>=20
> $IPTABLES -t nat -I PREROUTING --dst 192.168.64.59 --protocol tcp
> --destination-port 80 -j\ REDIRECT --to-ports 8080;
>=20
> $IPTABLES -t nat -I PREROUTING --dst 192.168.64.59 --protocol tcp
> --destination-port 443 -j\ REDIRECT --to-ports 8443;
>=20
> $IPTABLES -t nat -I PREROUTING --dst 192.168.64.75 --protocol tcp
> --destination-port 80 -j\ REDIRECT --to-ports 8080;
>=20
> $IPTABLES -t nat -I PREROUTING --dst 192.168.64.75 --protocol tcp
> --destination-port 443 -j\ REDIRECT --to-ports 8443;
>=20
> --- script end ---
>=20
> After that I issue "iptables -t nat -L" and can see that all lines are
> in the table. I then try to connect to http://192.168.64.59 and I get
> redirected to port 8443 and I get the page in that vhosts DocumentRoot
> but when i connect to the virtual interface=20
> (http://192.168.64.75) i get
> a "unable to connect to server" in Netscape 4.75".=20
>=20
> In my httpd.conf I have=20
>=20
> Listen 192.168.64.59:8080
> Listen 192.168.64.59:8443
> Listen 192.168.64.75:8080
> Listen 192.168.64.75:8443
>=20
> Please note that I have also tried to change 75's Listen port to
> something else. Also note that eth0 =3D 192.168.64.59 and eth0:0 =3D
> 192.168.64.75.=20
>=20
> Ifconfig output:
>=20
> eth0      Link encap:Ethernet  HWaddr 00:30:6E:05:F1:C0
>           inet addr:192.168.64.59  Bcast:192.168.64.255
> Mask:255.255.255.0
>           UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
>           RX packets:645931 errors:0 dropped:0 overruns:0 frame:0
>           TX packets:438897 errors:0 dropped:0 overruns:0 carrier:0
>           collisions:0 txqueuelen:100
>           Interrupt:22
>=20
> eth0:0    Link encap:Ethernet  HWaddr 00:30:6E:05:F1:C0
>           inet addr:192.168.64.75  Bcast:192.168.64.255
> Mask:255.255.255.0
>           UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
>           Interrupt:22
>=20
> eth0:1    Link encap:Ethernet  HWaddr 00:30:6E:05:F1:C0
>           inet addr:192.168.64.76  Bcast:192.168.64.255
> Mask:255.255.255.0
>           UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
>           Interrupt:22
>=20
> lo        Link encap:Local Loopback
>           inet addr:127.0.0.1  Mask:255.0.0.0
>           UP LOOPBACK RUNNING  MTU:16436  Metric:1
>           RX packets:24610 errors:0 dropped:0 overruns:0 frame:0
>           TX packets:24610 errors:0 dropped:0 overruns:0 carrier:0
>           collisions:0 txqueuelen:0
>=20
> I hope that someone knows the answer to my question. If i=20
> have left out
> important info please mail me and I will give you the information
> needed. Sorry to bother you all.=20
>=20
> Thanks in advance.
>=20
> // Mika
>=20
>=20

