From: Claudio Cuqui <claudio@c3systems.com.br>
Subject: Problems with statistic module using mode nth
Date: Sat, 30 Aug 2008 08:46:23 -0300
Message-ID: <48B9330F.3040209@c3systems.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Hi there !

I=B4m facing something weird when using statist module + mode nth. I=20
started with a simple rule to balance incoming traffic to 2 differente=20
local address:

iptables -t nat -A PREROUTING  -p tcp -d 10.117.4.6 --dport 25 -m state=
=20
--state NEW -m statistic --mode nth  --every 2 --packet 0 -j DNAT=20
--to-destination 10.117.4.53:25
iptables -t nat -A PREROUTING  -p tcp -d 10.117.4.6 --dport 25 -m state=
=20
--state NEW -m statistic --mode nth  --every 2 --packet 1 -j DNAT=20
--to-destination 10.117.4.54:25

After some tests I  got some "connection refused" messages during my=20
tests. I checked the server and everything was fine. Then, I decided to=
=20
add an extra (unnecessary ?) rule:

iptables -t nat -A PREROUTING  -p tcp -d 10.117.4.6 --dport 25 -m state=
=20
--state NEW -j DNAT --to-destination 10.117.4.54:25

So, the final rule set was:
iptables -t nat -A PREROUTING  -p tcp -d 10.117.4.6 --dport 25 -m state=
=20
--state NEW -m statistic --mode nth  --every 2 --packet 0 -j DNAT=20
--to-destination 10.117.4.53:25
iptables -t nat -A PREROUTING  -p tcp -d 10.117.4.6 --dport 25 -m state=
=20
--state NEW -m statistic --mode nth  --every 2 --packet 1 -j DNAT=20
--to-destination 10.117.4.54:25
iptables -t nat -A PREROUTING  -p tcp -d 10.117.4.6 --dport 25 -m state=
=20
--state NEW -j DNAT --to-destination 10.117.4.54:25

I never expect to see anything hit the 3rd rule. But, after add it, I=20
didn=B4t receive more connection refused messages, and checking the=20
counters, I realize that half of packets that should match rule # 2 was=
=20
sent do rule # 3:

Chain PREROUTING (policy ACCEPT 184K packets, 21M bytes)
 pkts bytes target     prot opt in     out     source              =20
destination
    6   360 DNAT       tcp  --  *      *       0.0.0.0/0           =20
10.117.4.6          tcp dpt:25 state NEW statistic mode nth every 2=20
to:10.117.4.53:25
    3   180 DNAT       tcp  --  *      *       0.0.0.0/0           =20
10.117.4.6          tcp dpt:25 state NEW statistic mode nth every 2=20
packet 1 to:10.117.4.54:25
    3   180 DNAT       tcp  --  *      *       0.0.0.0/0           =20
10.117.4.6          tcp dpt:25 state NEW to:10.117.4.54:25

Am I doing something wrong here ?

TIA,

Claudio Cuqui


