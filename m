From: =?ISO-8859-1?Q?Ana_Gallardo_G=F3mez?= <anaougu@gmail.com>
Subject: simple http redirect with iptables and tproxy (kernel 3.0)
Date: Tue, 24 Apr 2012 14:34:59 +0200
Message-ID: <CAGVYYLRy2b+SsHSWa_OOUwEz=bssBr7rsx8TBaHGMNX1Ddkm+A@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:from:date:message-id:subject:to:content-type
         :content-transfer-encoding;
        bh=AblE4Xb4hSXL2D6K+yeRH5lAWFIgXWQtdhsZwC9hNds=;
        b=WrvW4WbtZ19SSKgrtH/B2HNFpADUn6jR23yQ6kIjZisAe4PU7DS/F2YPKdotcqdFNi
         Pepi+cZUqoivaTHD2die4zvJ04uS6nu9qFGpEIFnrW8EXJEs6WyiGrCiQJ7KqQQmUXml
         1Hia2AXabRsEb+hQra0Ke95BGh0v3PwQmgmauJaHavklF0PZcUPjPq08T7kpwfrgbnJR
         w0g+nzUgarE5b2A77J6LZNPTpIRjKhFSK3qjhi7dDSzIW1LBOhU1VFO79Wb6e7OVF3pn
         qDEPJuldfWr7KZmumj+QWHZyKuy+zXQaBmKBikr7vfv7wn+QMYnK+WSd4Hr++J7C5Jy3
         XYjQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter <netfilter@vger.kernel.org>

Hello,

this is my first mail to this list. Thank you in advance and sorry for
my english.

I would like to do a simple http redirect using iptables and tproxy
with kernel 3.0.0-17-generic

In my system I have a http server listen in port 80. I would like to
do a http request to port 81 and be redirecting to port 80 =BFcan I do
that?

My configuration script:

#!/bin/sh
##

echo "Test Linux Kernel Configuration...."
cat /boot/config-$(uname -r) | egrep
'NF_CONNTRACK=3D|NETFILTER_TPROXY|NETFILTER_XT_MATCH_SOCKET|NETFILTER_X=
T_TARGET_TPROXY'

echo "Routing configuration... "

ip rule del fwmark 1 lookup 100
ip rule add fwmark 1 lookup 100
ip route del local 0.0.0.0/0 dev lo table 100
ip route add local 0.0.0.0/0 dev lo table 100


echo 1 > /proc/sys/net/ipv4/ip_forward
echo 2 > /proc/sys/net/ipv4/conf/default/rp_filter
echo 2 > /proc/sys/net/ipv4/conf/all/rp_filter
echo 0 > /proc/sys/net/ipv4/conf/eth0/rp_filter

iptables -t mangle -F PREROUTING

iptables -t mangle -N DIVERT 2>/dev/null
iptables -t mangle -F DIVERT
iptables -t mangle -A PREROUTING -p tcp -m socket -j LOG --log-prefix
"SOCKET : Saltar a DIVERT : "
iptables -t mangle -A PREROUTING -p tcp -m socket -j DIVERT

# DIVERT chain: mark packets and accept
iptables -t mangle -A DIVERT -j LOG --log-prefix "DIVERT : MARK 1 : "
iptables -t mangle -A DIVERT -j MARK --set-mark 1
iptables -t mangle -A DIVERT -j LOG --log-prefix "DIVERT : ACCEPT: "
iptables -t mangle -A DIVERT -j ACCEPT

iptables -t mangle -A PREROUTING -p tcp --dport 81 -j LOG --log-prefix
"TPROXY : "
iptables -t mangle -A PREROUTING -p tcp --dport 81 -j TPROXY
--tproxy-mark 1 --on-port 80

My debug info:

# ip rule show
0:    from all lookup local
32765:    from all fwmark 0x1/0x1 lookup 100
32766:    from all lookup main
32767:    from all lookup default
# ip route show table 100
local default dev lo  scope host
# iptables -t mangle -L
Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination
LOG        tcp  --  anywhere             anywhere            socket
LOG level warning prefix `SOCKET : Saltar a DIVERT : '
DIVERT     tcp  --  anywhere             anywhere            socket
LOG        tcp  --  anywhere             anywhere            tcp
dpt:81 LOG level warning prefix `TPROXY : '
TPROXY     tcp  --  anywhere             anywhere            tcp
dpt:81 TPROXY redirect 0.0.0.0:80 mark 0x1/0x1


Chain INPUT (policy ACCEPT)
target     prot opt source               destination

Chain FORWARD (policy ACCEPT)
target     prot opt source               destination

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination

Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination

Chain DIVERT (1 references)
target     prot opt source               destination
LOG        all  --  anywhere             anywhere            LOG level
warning prefix `DIVERT : MARK 1 : '
MARK       all  --  anywhere             anywhere            MARK set 0=
x1
LOG        all  --  anywhere             anywhere            LOG level
warning prefix `DIVERT : ACCEPT: '
ACCEPT     all  --  anywhere             anywhere

# tail -f /var/log/syslog
Apr 24 13:41:23 cau1-pc kernel: [15925.412434] TPROXY : IN=3Dlo OUT=3D
MAC=3D00:00:00:00:00:00:00:00:00:00:00:00:08:00 SRC=3D158.49.245.14
DST=3D158.49.245.14 LEN=3D60 TOS=3D0x00 PREC=3D0x00 TTL=3D64 ID=3D19826=
 DF
PROTO=3DTCP SPT=3D53432 DPT=3D81 WINDOW=3D32792 RES=3D0x00 SYN URGP=3D0
Apr 24 13:41:24 cau1-pc kernel: [15925.662452] TPROXY : IN=3Dlo OUT=3D
MAC=3D00:00:00:00:00:00:00:00:00:00:00:00:08:00 SRC=3D158.49.245.14
DST=3D158.49.245.14 LEN=3D60 TOS=3D0x00 PREC=3D0x00 TTL=3D64 ID=3D28777=
 DF
PROTO=3DTCP SPT=3D53433 DPT=3D81 WINDOW=3D32792 RES=3D0x00 SYN URGP=3D0
Apr 24 13:41:26 cau1-pc kernel: [15928.416063] TPROXY : IN=3Dlo OUT=3D
MAC=3D00:00:00:00:00:00:00:00:00:00:00:00:08:00 SRC=3D158.49.245.14
DST=3D158.49.245.14 LEN=3D60 TOS=3D0x00 PREC=3D0x00 TTL=3D64 ID=3D19827=
 DF
PROTO=3DTCP SPT=3D53432 DPT=3D81 WINDOW=3D32792 RES=3D0x00 SYN URGP=3D0
Apr 24 13:41:27 cau1-pc kernel: [15928.664057] TPROXY : IN=3Dlo OUT=3D
MAC=3D00:00:00:00:00:00:00:00:00:00:00:00:08:00 SRC=3D158.49.245.14
DST=3D158.49.245.14 LEN=3D60 TOS=3D0x00 PREC=3D0x00 TTL=3D64 ID=3D28778=
 DF
PROTO=3DTCP SPT=3D53433 DPT=3D81 WINDOW=3D32792 RES=3D0x00 SYN URGP=3D0


ideas? can I debug the travel of the packet inside the kernel?

Thank you very much


--=20
::::::::::::::::::::::::::::::::::::
:: Ana Gallardo G=F3mez ::
::::::::::::::::::::::::::::::::::::
