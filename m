From: "louie miranda" <lmiranda@chikka.com>
Subject: managing another network route, can't connect to it! Pls see!
Date: Wed, 26 Feb 2003 19:14:06 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <030f01c2dd88$2f277140$0b00000a@nocpc3>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_030C_01C2DDCB.3B325890"
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
To: netfilter@lists.samba.org

This is a multi-part message in MIME format.

------=_NextPart_000_030C_01C2DDCB.3B325890
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

i.e.

Consider the following network: (kindly view the attached txt file for a
nicer one)

                              inet
                                |
                                |
                                |203.190.72.108
                      *-----------------*
              10.0.0.1|       eth0      |none
                 /----|eth1         eth2|------\               new network
block pipe
                 |    |     LINUX GW    |   line cut         *--------*
192.168.129.x/24 (network)
                 |    *-----------------*                    |        |
10.0.0.2, gw for 192.168.129.x/24 block under LINUX GW
                 |                                           | 192.x  |
                 |                                           |        |
               *HUB*-----------------------------------------*--------*
                 |                                              cisco 2600
router ip of this router is: 10.0.0.2
                 |
                 |
           *--* *--* *--*
           |  | |  | |  |
           |  | |  | |  |
           *--* *--* *--*
            workstations
          10.0.0.0/16 block


    interface:
     - eth0 = 203.190.72.108, default gw.
     - eth1 = 10.0.0.0/16, local area network.
     - eth2 = none



===========

Right now im inside 10.0.0.0/16 block, my ip is 10.0.0.11 and my default gw
is via 203.190.72.108.
My LAN is on a masq LinuxBOX. On my diagram i have added a network cable
that is on a different
subnet connect to a cisco router via 10.0.0.2 which is connected to another
network (diff story).
My kernel route diagram is below..

Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use
Iface
203.190.72.104  0.0.0.0         255.255.255.248 U     0      0        0 eth0
192.168.129.0   10.0.0.2        255.255.255.0   UG    0      0        0 eth1
<--- new route via 10.0.0.2
10.0.0.0        0.0.0.0         255.255.0.0     U     0      0        0 eth1
0.0.0.0         203.190.72.110  0.0.0.0         UG    0      0        0 eth0

I can access ip block 192.168.129.x on my LINUX GW perfectly. But when im on
my workstations on
10.0.0.11 block i cannot even ping 192.168.129.x block. Which could be
possibly be wrong?



---
thanks,
louie

------=_NextPart_000_030C_01C2DDCB.3B325890
Content-Type: text/plain;
	name="networkdiag.txt"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="networkdiag.txt"

Consider the following network:=20

                              inet
                                |              =20
                                |                          =20
                                |203.190.72.108
                      *-----------------*                 =20
              10.0.0.1|       eth0      |none
                 /----|eth1         eth2|------\               new =
network block pipe
                 |    |     LINUX GW    |   line cut         *--------*  =
192.168.129.x/24 (network)
                 |    *-----------------*                    |        |  =
10.0.0.2, gw for 192.168.129.x/24 block under LINUX GW
                 |                                           | 192.x  |
                 |                                           |        |
               *HUB*-----------------------------------------*--------*
                 |                                              cisco =
2600 router ip of this router is: 10.0.0.2
                 |                            =20
                 |
           *--* *--* *--*
           |  | |  | |  |
           |  | |  | |  |
           *--* *--* *--*
            workstations
          10.0.0.0/16 block


    interface:
     - eth0 =3D 203.190.72.108, default gw.
     - eth1 =3D 10.0.0.0/16, local area network.
     - eth2 =3D none


------=_NextPart_000_030C_01C2DDCB.3B325890--


