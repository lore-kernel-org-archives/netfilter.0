From: =?gb2312?B?wO7OsLuq?= <liweihuahot@hotmail.com>
Subject: ip rule with fwmark trouble
Date: Sun, 1 Jun 2008 09:19:40 +0000
Message-ID: <BAY122-W42B4A67BCAA87109B55011BEB80@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="gb2312"
To: netfilter@vger.kernel.org



i have a linux router box ( kernel   2.6.23.12  iptables 1.4.0 ) with 3=
 interface,  eth0 to lan , eth1 to isp1  ,eth2 to isp2. i add these rul=
e to iptables's nat table:
-A POSTROUTING -s LAN_IP -o eth1 -j MASQUERADE
-A POSTROUTING -s LAN_IP -o eth2 -j MASQUERADE

then, add route to route table:
ip route add 0/0 via ISP1_GW dev eth1=20
ip route add 0/0 via ISP2_GW dev eth2 tables ISP2

now ,i want some ip in my lan out with ISP2,  use this rule :
ip rule add from SOME_IP table ISP2

it is work fine.
but when i use iptables  add mark to out-traffic and use ip rule with f=
wmark like this:
iptables -t mangle -A PREROUTING -s SOME_IP -j MARK --set-mark 11
ip rule add fwmark 11 table ISP2

the SOME_IP computers can't access internet , what's wrong ? Does anyon=
e have hints ?



_________________________________________________________________
=D0=C2=C4=EA=BB=BB=D0=C2=D1=D5=A3=AC=BF=EC=C0=B4=D7=B1=B0=E7=D7=D4=BC=BA=
=B5=C4MSN=B8=F8=D0=C4=D2=C7=B5=C4TA=D2=BB=B8=F6=BE=AA=CF=B2=A3=A1
http://im.live.cn/emoticons/?ID=3D18
