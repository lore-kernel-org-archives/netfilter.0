From: =?iso-8859-1?q?Ivan=20Rodriguez?= <ivanoch79@yahoo.com.mx>
Subject: redundancy with linux and two NIC
Date: Fri, 13 Jun 2003 12:16:52 -0500 (CDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030613171652.82258.qmail@web13206.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: netfilter@lists.netfilter.org

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
La mejor conexi=F3n a internet y 25MB extra a tu correo por $100 al mes. ht=
tp://net.yahoo.com.mx

