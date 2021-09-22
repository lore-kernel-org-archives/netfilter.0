From: Frank Wunderlich <frank-w@public-files.de>
Subject: nft 0.9.8 - error in mnl.c - with addition hw interfaces
Date: Wed, 22 Sep 2021 12:49:37 +0200
Message-ID: <trinity-470c22f9-5190-479b-9f59-3088360d78f3-1632307777449@3c-app-gmx-bs53>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1632307777;
        bh=ia8a0CPKllAD14XQCnz8J6sfxqGcGcZDYXni6Xg+r60=;
        h=X-UI-Sender-Class:From:To:Subject:Date;
        b=U1ojj9BjI8shrnYWOamscyYzQzQSmPASOJU9XOL6pWad2YbfNkoMIVwvoo+pDEEvo
         TCH4GC7EKsgOMppzpIA3/oUgrNweaaKVUTJPzNYT3zirB61nMtRVhsu8H0RxiMwgsq
         XTiF/TzDPFW/FkhDO95GPCSCYinw7d9McGijSo2I=
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

i try to add second gmac on bpi-r2 and modified dts in linux-kernel.

normally all traffic from the switch (lan0-lan3,wan) are routed via eth0.

(MT7623 SOC) eth0 =3D> port6 (mt7530 Switch-chip) [wan,lan0-3]
             eth1 =3D> port5


with dts-modification i have eth1 (second port on SOC) and aux (second por=
t on switch) interfaces.

i had setup a vlan aware bridge over aux and wan and give it an own vlan-i=
d, this way i can pass wan-traffic to eth1.

basicly this config, only that i don't use lanbr here but an own wanbr (br=
idge vid is different to lanbr)

https://github.com/ericwoud/buildR64ubuntu/blob/master/rootfs-arch/etc/sys=
temd/network-RT/10-wan.network

works so far, i can work over the wan-port which *should* be mapped to eth=
1

in the next step i wanted to try "normal" behaviour (all over eth0) but wi=
th the dts-nodes activated. network itself works, but on running nft (list=
 ruleset) i get this error:

root@bpi-r2:~# nft list ruleset
mnl.c:45: Unable to initialize Netlink socket: Protocol not supported

this brings me to the code, which seems not interface-related, more genera=
l and so i don't understand, why the socket cannot be created.

struct mnl_socket *nft_mnl_socket_open(void)
{
        struct mnl_socket *nf_sock;
        int one =3D 1;

        nf_sock =3D mnl_socket_open(NETLINK_NETFILTER);
        if (!nf_sock)
                netlink_init_error();//error here

        if (fcntl(mnl_socket_get_fd(nf_sock), F_SETFL, O_NONBLOCK))
                netlink_init_error();

        mnl_socket_setsockopt(nf_sock, NETLINK_EXT_ACK, &one, sizeof(one))=
;

        return nf_sock;
}

i also get the error if wanbridge (aux-wan) is active, but not without the=
 dts-modification

any idea about this?

some output:

root@bpi-r2:~# ip a
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group =
default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host
       valid_lft forever preferred_lft forever
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1504 qdisc pfifo_fast state=
 UP group default qlen 1000
    link/ether 3a:69:cb:48:04:40 brd ff:ff:ff:ff:ff:ff
3: eth1: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state=
 UP group default qlen 1000
    link/ether f2:d2:51:56:cd:3d brd ff:ff:ff:ff:ff:ff
    inet 192.168.0.18/24 brd 192.168.0.255 scope global eth1
       valid_lft forever preferred_lft forever
    inet6 fe80::f0d2:51ff:fe56:cd3d/64 scope link
       valid_lft forever preferred_lft forever
5: wan@eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue mast=
er wanbr state UP group default
qlen 1000
    link/ether 08:22:33:44:55:77 brd ff:ff:ff:ff:ff:ff
6: lan0@eth0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc noqueue m=
aster lanbr0 state LOWERLAYERDOW
N group default qlen 1000
    link/ether 3a:5d:98:f7:50:8b brd ff:ff:ff:ff:ff:ff
7: lan1@eth0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc noqueue m=
aster lanbr0 state LOWERLAYERDOW
N group default qlen 1000
    link/ether 3e:de:03:53:13:70 brd ff:ff:ff:ff:ff:ff
8: lan2@eth0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc noqueue m=
aster lanbr0 state LOWERLAYERDOW
N group default qlen 1000
    link/ether 66:8a:45:e7:49:14 brd ff:ff:ff:ff:ff:ff
9: lan3@eth0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc noqueue m=
aster lanbr0 state LOWERLAYERDOW
N group default qlen 1000
    link/ether 0a:81:22:f8:21:57 brd ff:ff:ff:ff:ff:ff
10: aux@eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue mas=
ter wanbr state UP group default
 qlen 1000
    link/ether 72:9e:68:15:a3:73 brd ff:ff:ff:ff:ff:ff
11: wanbr: <BROADCAST,MULTICAST> mtu 1500 qdisc noop state DOWN group defa=
ult qlen 1000
    link/ether 2a:01:81:8c:17:ca brd ff:ff:ff:ff:ff:ff
12: lanbr0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc noqueue sta=
te DOWN group default qlen 1000
    link/ether 52:29:84:c3:04:47 brd ff:ff:ff:ff:ff:ff
    inet 192.168.1.1/24 brd 192.168.1.255 scope global lanbr0
       valid_lft forever preferred_lft forever
    inet6 fd00:a::10/64 scope global tentative
       valid_lft forever preferred_lft forever

root@bpi-r2:~# bridge vlan
port              vlan-id
wan               99 PVID Egress Untagged
lan0              1 PVID Egress Untagged
lan1              1 PVID Egress Untagged
lan2              1 PVID Egress Untagged
lan3              1 PVID Egress Untagged
aux               99 PVID Egress Untagged
lanbr0            1 PVID Egress Untagged

dts-modification:

=2D-- a/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
+++ b/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
@@ -209,6 +209,18 @@ fixed-link {
                };
        };

+       gmac1: mac@1 {
+               compatible =3D "mediatek,eth-mac";
+               reg =3D <1>;
+               phy-mode =3D "rgmii";
+
+               fixed-link {
+                       speed =3D <1000>;
+                       full-duplex;
+                       pause;
+               };
+       };
+
        mdio: mdio-bus {
                #address-cells =3D <1>;
                #size-cells =3D <0>;
@@ -249,6 +261,18 @@ port@4 {
                                        label =3D "lan3";
                                };

+                               port@5 {
+                                       reg =3D <5>;
+                                       label =3D "aux";
+                                       phy-mode =3D "rgmii";
+
+                                       fixed-link {
+                                               speed =3D <1000>;
+                                               full-duplex;
+                                               pause;
+                                       };
+                               };
+
                                port@6 {
                                        reg =3D <6>;
                                        label =3D "cpu";

regards Frank

