From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: redundancy with linux and two NIC
Date: Fri, 13 Jun 2003 10:44:23 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF52E34D6@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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
To: Ivan Rodriguez <ivanoch79@yahoo.com.mx>, netfilter@lists.netfilter.org


I want that too!

The only immediate way I can imagine that happening is writing a =
monitoring script that keeps checking the availability of each channel, =
and then when it fails, call a script to modify your iptables and =
routing configuration to point to the new configuration. I sorta have =
this setup, but I haven't implemented the poller, so I need to manually =
switch over when there is a failure...

If anyone knows a more elegant approach, I am all ears.

-----Original Message-----
From: Ivan Rodriguez [mailto:ivanoch79@yahoo.com.mx]=20
Sent: Friday, June 13, 2003 10:17 AM
To: netfilter@lists.netfilter.org
Subject: redundancy with linux and two NIC

Hi=20
i have the next situation

                          ADSL
                   eth1--------->
192.168.64.x --->LinuxBox
                   eth0--------->
                          DS0
=20
my Linux box is a GW i need the following:
        =20

        if etho is down then all traffic is routed
        by eth1 and  if eth1 is down then all=20
        traffic is routed by eth0

it is posible ?
please help me and excusme mi english is not god


Destination     Gateway         Genmask         Flags=20
 MSS Window  irtt
Iface

148.223.133.227 192.168.65.1    255.255.255.255 UGH  =20
  40 0          0
eth1

148.223.182.205 0.0.0.0         255.255.255.255 UH   =20
  40 0          0
ppp0

192.168.65.0    192.168.65.1    255.255.255.0   UG   =20
  40 0          0
eth1

192.168.65.0    0.0.0.0         255.255.255.0   U    =20
  40 0          0
eth1

10.0.0.0        0.0.0.0         255.0.0.0       U    =20
  40 0          0
eth0

127.0.0.0       0.0.0.0         255.0.0.0       U    =20
  40 0          0
lo

0.0.0.0         148.223.182.205 0.0.0.0         UG   =20
  40 0          0
ppp0
























_________________________________________________________
Do You Yahoo!?
La mejor conexi=F3n a internet y 25MB extra a tu correo por $100 al mes. =
http://net.yahoo.com.mx


