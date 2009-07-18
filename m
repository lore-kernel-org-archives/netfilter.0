From: =?ISO-8859-1?Q?Jorge_D=E1vila?= <jorgedavilalopez@gmail.com>
Subject: HFSC scheduling and Linux vlans
Date: Fri, 17 Jul 2009 22:38:50 -0600
Message-ID: <bf0e93a30907172138lea3f7efu9656f58e360a64eb@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type:content-transfer-encoding;
        bh=nuVZtSo0/E6O6WUUYX/aFM9iRMTSb2S0a0mX/wq+//A=;
        b=au+nX7DtLhp76cqxdJK8N4aBKoNUvKHdS2XODgYFg8i8QlErWIyx7cXrlGvpSf1bnT
         qiY9rqimELZzkfm/RAeMld5j0QiBHKW6GsI4SiDK6FCGp/qvowxF7yEjeZ0/ANvm6Ndc
         7EHhi4AxRvfvTM7RXj7AMJ+X+utdhoTz2ptVk=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Good night list,

I have to implement a configuration for bandwidth management in a
Linux router. The network topology is like this

Internet
|
|
eth0
|
|
vlanX (public address)
|
|
eth1
|
|
+------ vlanY1 (private networks)
|
|
+------ vlanY2 (public servers: e-mail, www, dns)
|
|
+------ vlanY3 (internal servers: e-mail, dns)

The actual configuration works using HTB scheduling but when I tried
apply the HFSC configuration there is no traffic through any
interfaces.

This is the output

tc -s filter show dev eth1; tc -s class show dev eth1
filter parent 1: protocol ip pref 1 fw
filter parent 1: protocol ip pref 1 fw handle 0x17 classid 1:23
filter parent 1: protocol ip pref 1 fw handle 0x30 classid 1:48
filter parent 1: protocol ip pref 2 fw
filter parent 1: protocol ip pref 2 fw handle 0x10 classid 1:16
filter parent 1: protocol ip pref 3 fw
filter parent 1: protocol ip pref 3 fw handle 0x20 classid 1:32
filter parent 1: protocol ip pref 3 fw handle 0x80 classid 1:128
filter parent 1: protocol ip pref 4 fw
filter parent 1: protocol ip pref 4 fw handle 0x5 classid 1:5
filter parent 1: protocol ip pref 4 fw handle 0x15 classid 1:21
filter parent 1: protocol ip pref 6 fw
filter parent 1: protocol ip pref 6 fw handle 0x4 classid 1:4
filter parent 1: protocol ip pref 6 fw handle 0x6 classid 1:6
filter parent 1: protocol ip pref 6 fw handle 0x9 classid 1:9
filter parent 1: protocol ip pref 7 fw
filter parent 1: protocol ip pref 7 fw handle 0x2 classid 1:102
filter parent 1: protocol ip pref 7 fw handle 0x3 classid 1:3
filter parent 1: protocol ip pref 7 fw handle 0x7 classid 1:7
filter parent 1: protocol ip pref 7 fw handle 0x8 classid 1:8
filter parent 1: protocol ip pref 7 fw handle 0xa classid 1:10
filter parent 1: protocol ip pref 7 fw handle 0xe classid 1:14
filter parent 1: protocol ip pref 7 fw handle 0x11 classid 1:17
filter parent 1: protocol ip pref 7 fw handle 0x13 classid 1:19
class hfsc 1: root
 Sent 0 bytes 0 pkt (dropped 0, overlimits 0 requeues 0)
 rate 0bit 0pps backlog 0b 0p requeues 0
 period 0 level 1

class hfsc 1:1 parent 1: sc m1 0bit d 0us m2 3800Kbit ul m1 0bit d 0us
m2 3800Kbit
 Sent 0 bytes 0 pkt (dropped 0, overlimits 0 requeues 0)
 rate 0bit 0pps backlog 0b 0p requeues 0
 period 0 level 0

class hfsc 1:10 parent 1: sc m1 0bit d 0us m2 228000bit ul m1 0bit d
0us m2 3800Kbit
 Sent 0 bytes 0 pkt (dropped 0, overlimits 0 requeues 0)
 rate 0bit 0pps backlog 0b 0p requeues 0
 period 0 level 0

class hfsc 1:23 parent 1: sc m1 0bit d 0us m2 228000bit ul m1 0bit d
0us m2 3800Kbit
 Sent 0 bytes 0 pkt (dropped 0, overlimits 0 requeues 0)
 rate 0bit 0pps backlog 0b 0p requeues 0
 period 0 level 0

class hfsc 1:32 parent 1: sc m1 0bit d 0us m2 228000bit ul m1 0bit d
0us m2 3800Kbit
 Sent 0 bytes 0 pkt (dropped 0, overlimits 0 requeues 0)
 rate 0bit 0pps backlog 0b 0p requeues 0
 period 0 level 0

class hfsc 1:102 parent 1: sc m1 0bit d 0us m2 114000bit ul m1 0bit d
0us m2 3800Kbit
 Sent 0 bytes 0 pkt (dropped 0, overlimits 0 requeues 0)
 rate 0bit 0pps backlog 0b 0p requeues 0
 period 0 level 0

class hfsc 1:3 parent 1: sc m1 0bit d 0us m2 114000bit ul m1 0bit d
0us m2 3800Kbit
 Sent 0 bytes 0 pkt (dropped 0, overlimits 0 requeues 0)
 rate 0bit 0pps backlog 0b 0p requeues 0
 period 0 level 0

class hfsc 1:21 parent 1: sc m1 0bit d 0us m2 228000bit ul m1 0bit d
0us m2 3800Kbit
 Sent 0 bytes 0 pkt (dropped 0, overlimits 0 requeues 0)
 rate 0bit 0pps backlog 0b 0p requeues 0
 period 0 level 0

class hfsc 1:4 parent 1: sc m1 0bit d 0us m2 114000bit ul m1 0bit d
0us m2 3800Kbit
 Sent 0 bytes 0 pkt (dropped 0, overlimits 0 requeues 0)
 rate 0bit 0pps backlog 0b 0p requeues 0
 period 0 level 0

class hfsc 1:5 parent 1: sc m1 0bit d 0us m2 228000bit ul m1 0bit d
0us m2 3800Kbit
 Sent 0 bytes 0 pkt (dropped 0, overlimits 0 requeues 0)
 rate 0bit 0pps backlog 0b 0p requeues 0
 period 0 level 0

class hfsc 1:14 parent 1: sc m1 0bit d 0us m2 114000bit ul m1 0bit d
0us m2 3800Kbit
 Sent 0 bytes 0 pkt (dropped 0, overlimits 0 requeues 0)
 rate 0bit 0pps backlog 0b 0p requeues 0
 period 0 level 0

class hfsc 1:6 parent 1: sc m1 0bit d 0us m2 228000bit ul m1 0bit d
0us m2 3800Kbit
 Sent 0 bytes 0 pkt (dropped 0, overlimits 0 requeues 0)
 rate 0bit 0pps backlog 0b 0p requeues 0
 period 0 level 0

class hfsc 1:17 parent 1: sc m1 0bit d 0us m2 228000bit ul m1 0bit d
0us m2 3800Kbit
 Sent 0 bytes 0 pkt (dropped 0, overlimits 0 requeues 0)
 rate 0bit 0pps backlog 0b 0p requeues 0
 period 0 level 0

class hfsc 1:7 parent 1: sc m1 0bit d 0us m2 114000bit ul m1 0bit d
0us m2 3800Kbit
 Sent 0 bytes 0 pkt (dropped 0, overlimits 0 requeues 0)
 rate 0bit 0pps backlog 0b 0p requeues 0
 period 0 level 0

class hfsc 1:16 parent 1: sc m1 0bit d 0us m2 228000bit ul m1 0bit d
0us m2 3800Kbit
 Sent 0 bytes 0 pkt (dropped 0, overlimits 0 requeues 0)
 rate 0bit 0pps backlog 0b 0p requeues 0
 period 0 level 0

class hfsc 1:8 parent 1: sc m1 0bit d 0us m2 228000bit ul m1 0bit d
0us m2 3800Kbit
 Sent 0 bytes 0 pkt (dropped 0, overlimits 0 requeues 0)
 rate 0bit 0pps backlog 0b 0p requeues 0
 period 0 level 0

class hfsc 1:19 parent 1: sc m1 0bit d 0us m2 228000bit ul m1 0bit d
0us m2 3800Kbit
 Sent 0 bytes 0 pkt (dropped 0, overlimits 0 requeues 0)
 rate 0bit 0pps backlog 0b 0p requeues 0
 period 0 level 0

class hfsc 1:9 parent 1: sc m1 0bit d 0us m2 114000bit ul m1 0bit d
0us m2 3800Kbit
 Sent 0 bytes 0 pkt (dropped 0, overlimits 0 requeues 0)
 rate 0bit 0pps backlog 0b 0p requeues 0
 period 0 level 0

class hfsc 1:128 parent 1: sc m1 0bit d 0us m2 380000bit ul m1 0bit d
0us m2 3800Kbit
 Sent 0 bytes 0 pkt (dropped 0, overlimits 0 requeues 0)
 rate 0bit 0pps backlog 0b 0p requeues 0
 period 0 level 0

class hfsc 1:48 parent 1: sc m1 0bit d 0us m2 380000bit ul m1 0bit d
0us m2 3800Kbit
 Sent 0 bytes 0 pkt (dropped 0, overlimits 0 requeues 0)
 rate 0bit 0pps backlog 0b 0p requeues 0
 period 0 level 0

The firewall rules are similar to this

$IPT -t mangle -I POSTROUTING -j CLASSIFY --set-class 1:8 -o $OUT -s
192.168.8.0/24

where $OUT is vlan201 (a virtual interface at interface eth0)

HFSC scheduling does not works with linux vlans?

Thanks in advance for your answers and advices.

--=20
Jorge Isaac D=E1vila L=F3pez
+505 8430 5462
jorgedavilalopez@gmail.com
---
Esta tierra es Linux. En las noches calladas puede escucharse a las
m=E1quinas Windows re-inici=E1ndose...
