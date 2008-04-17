From: devel@thom.fr.eu.org
Subject: loosing packets with netfilter and ipsec in tunnel mode
Date: Thu, 17 Apr 2008 22:53:20 +0200 (CEST)
Message-ID: <1255.10.211.1.1.1208465600.squirrel@mail.thom.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hello,

I don't know if it is the right place to post this question, but here i=
t is.

I have setup 2 servers that are doing mainly firewalling and VPN for tw=
o
interconnected private networks.

Each one having 2 network interfaces like this :

        Host A                                          Host B
                       |      NAT BOX         |
 eth1           eth0   |     eth0 eth1        |      eth0   |eth1
Private      |Internet | Internet|semi        |      semi   |private
network      |         |         |private     |      private|network
10.211.0.0/16|80.1.1.1 | 80.1.1.2|192.168.1.1 | 192.168.1.10|10.212.0.0=
/16

One machine is running linux-2.6.23 kernel, the other is running 2.6.24
kernel (both downloaded from kernel.org).

In this setup, I can't configure or manage anything with what I called =
the
NAT box. This is provided by the ISP as modem/router.

=46irewalling works ok, I can browse internet pages send emails... from=
 both
private nets.
I could setup the IPSEC tunnel and this is coming up correctly.
I did add one nat rule to prevent the packet that were to be encrypted
being SNATed (e.g. for host A):
$IPTABLES -t nat -A POSTROUTING -o $INET_IFACE -d $HOST_B_LAN_RANGE -j =
ACCEPT

With this configuration I managed to send pings from eth1 on host A to
eth1 on host B and this works.

I did add one more nat rule (e.g. for host A) :
$IPTABLES -t nat -A POSTROUTING -o $INET_IFACE -s $INET_IP -d
$HOST_B_LAN_RANGE -j SNAT --to-source $LAN_IP
to each host to be able to ping eth1 from host B from eth0 on host A an=
d
vice versa. That works too.

=46inally, I added a third rule to make the packets coming out of the
tunnel, being SNATed to the private lan IP address of the host on which=
 it
came out  (e.g. for host A) :
$IPTABLES -t nat -A POSTROUTING -s $HOST_B_LAN_RANGE -d $LAN_IP_RANGE -=
j
SNAT --to-source $LAN_IP

With this configuration, I'm able to ping from eth0 or 1 on host A to a=
ny
host on the private lan host B is connected to.

Now, if I try to ping from a host on private network host A is connecte=
d
to eth1 on host B or another host in host B private network, the packet=
s
won't get through.

By adding some log targets to track down the packets, I could see that =
the
packet gets into eth1 of host A, crosses the raw prerouting table, cros=
ses
the nat prerouting table, then disappear from host A (I assume at that
point the packet must have been encrypted and sent over the tunnel), an=
d
does not appears at host B.

Anybody can tell what I am doing wrong ?

Thanks a lot

=46ran=E7ois


Message scanned by ClamAV engine (http://www.clamav.net)
--------------------------------------------------------
