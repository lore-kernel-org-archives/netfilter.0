From: Mateus Caruccio <mateus@caruccio.com>
Subject: Redirect mirrored traffic to userspace app.
Date: Wed, 20 Oct 2010 19:58:37 -0200
Message-ID: <AANLkTikKCEBEv61415CCoM8uBzd1jL6+TDF7Gswh5+Ys@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hello everyone,

first of all, I'm not an iptables guru (that is why I'm here asking
you for help:)
Also, sorry for my poor english skills.

Well, at office we have 2 major environments: development and productio=
n.
In order to test our software in a more realistic condition, we'd like
to run it in production, but without affectig client application
traffic.

So, what I think is a nice solution is to setup a switch port mirror
to copy all traffic going to production server into our development ser=
ver.

That's how our network topology looks like (simplified):


                        +-------------------+
+------+   [REQUEST]    |      SWITCH       |
|CLIENT|--------------->|PORT1  PORT2->PORT3|
+------+                +-------------------+
                                 |       |
+-----------------+   [REQUEST]  |       | [MIRRORED REQ]  +-----------=
-------+
|PROD_SRV:eth0/IP1|<-------------+       +---------------->|DEVEL_SRV:e=
th0/IP2|
+-----------------+                                        +-----------=
-------+

Thanks to this damn GUI world, probably this ascii-art is ruined. Here
is another one:

CLIENT (send req)
   |
   |
   V
 PORT1
SWITCH PORT2---->PROD_SRV:eth0/IP1 (recv req)
 PORT3
   |
   |
   V
DEVEL_SRV:eth0/IP2 (recv mirrored req)


All traffic is UDP port 2077 only. I can not change any config on PROD_=
SRV.

Our DEVEL_SRV should receive exactly the same packet PROD_SRV
receives, but with destination address modified
so it can reach our userspace application.

tcpdump shows that all requests are being properly mirrored from PORT2 =
to PORT3.
ifconfig eth0 on DEVEL_SRV does not present any increment on RX
statistics, but if I "ifconfig eth0 promisc", it starts to increment
RX.

I've tried to "DNAT" it, but without success:

 root@DEVEL_SRV# iptables -t nat -A PREROUTING -p udp --dport 2077 -j
DNAT --to-destination $IP2

=46rom DEVEL_SRV point of view, it receives a legitime request.
I've setup a DROP rule so responses do not interfer on client's request=
s.

If I'm not clear, please fell free to ask anything.

Thanks for helping,

Mateus Caruccio


--=20
# ################ VOTE NULO ################
# Mateus de Oliveira Caruccio <mateus at caruccio dot com>
# Old programmers never die.=A0 They just branch to another namespace
