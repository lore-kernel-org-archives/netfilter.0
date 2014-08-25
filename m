From: Leonardo Rodrigues <leolistas@solutti.com.br>
Subject: where's my return traffic going?!?!
Date: Mon, 25 Aug 2014 14:54:06 -0300
Message-ID: <53FB783E.2060801@solutti.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=solutti.com.br; s=google;
        h=message-id:date:from:user-agent:mime-version:to:subject
         :content-type:content-transfer-encoding;
        bh=3AysHJ/qKW2xbceFAXKruo0fwaMVn4r06StV+6qYT8U=;
        b=t1+mBY5JCCrdmMvQm3UbXKNH81NrbpcNCC78Th+ecagu/pRyNdV5DNFt/EhiamayNo
         5riAciOCsLGOkmJvgRr31LAhqtSDb46lA5oMo75d1hOYtFxozQfufC3oehsHS8/9GJLS
         +52zL+b0yub1r7VgFlfaNlPqYQOpYNYdaQjcY=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org


     I have updated a small OpenWRT based router, it's running on a=20
simple network. It's running on a RB450 board

br-lan is the LAN side, 172.20.0.0/16
eth0 is the WAN side, 192.168.25.x/24 (dhcp provided)

     i have just a few iptables rules and NAT. Basically it's a 'allow=20
everything' router with some very few exceptions:

-A FORWARD -d 192.168.25.1/32 -i br-lan -o eth0 -j ACCEPT
-A FORWARD -s 172.20.1.0/24 -i br-lan -o eth0 -j ACCEPT
-A FORWARD -d 192.168.0.0/16 -i br-lan -o eth0 -j DROP
-A FORWARD -d 10.0.0.0/8 -i br-lan -o eth0 -j DROP
-A FORWARD -d 172.16.0.0/12 -i br-lan -o eth0 -j DROP
-A FORWARD -s 172.20.0.0/16 -i br-lan -o eth0 -j ACCEPT
-A FORWARD -i eth0 -o br-lan -m state ! --state NEW -j ACCEPT

-A POSTROUTING -s 172.20.0.0/16 -o eth0 -j MASQUERADE


     traffic on br-lan (internal) and eth0 (external) interfaces is=20
almost the same, only with RX and TX inverted, which is fine and=20
expected, as this is a router with almost no traffic to/from itself


root@firewall:/# ifconfig br-lan
br-lan    Link encap:Ethernet  HWaddr 00:0C:42:3D:FC:CD
           inet addr:172.20.1.1 Bcast:172.20.255.255  Mask:255.255.0.0
           UP BROADCAST RUNNING MULTICAST MTU:1500  Metric:1
           RX packets:1862835 errors:0 dropped:0 overruns:0 frame:0
           TX packets:2704211 errors:0 dropped:0 overruns:0 carrier:0
           collisions:0 txqueuelen:0
           RX bytes:586769410 (559.5 MiB)  TX bytes:3337034105 (3.1 GiB=
)

root@firewall:/# ifconfig eth0
eth0      Link encap:Ethernet  HWaddr 00:0C:42:3D:FC:CC
           inet addr:192.168.25.22 Bcast:192.168.25.255  Mask:255.255.2=
55.0
           UP BROADCAST RUNNING MULTICAST MTU:1500  Metric:1
           RX packets:2730189 errors:0 dropped:16202 overruns:0 frame:0
           TX packets:1847701 errors:0 dropped:0 overruns:0 carrier:0
           collisions:0 txqueuelen:1000
           RX bytes:3348006946 (3.1 GiB)  TX bytes:609083798 (580.8 MiB=
)
           Interrupt:5


     However, when watching my iptables rules, i'm not seeing the=20
'return' traffic hitting the 'in eth0 out br-lan' ruleand not hitting=20
the default ACCEPT rule as well.


Chain FORWARD (policy ACCEPT 1278 packets, 91872 bytes)
     pkts      bytes target     prot opt in out     source             =
 =20
destination
        6      412 ACCEPT     all  --  br-lan eth0   =20
0.0.0.0/0            192.168.25.1
     9609   552193 ACCEPT     all  --  br-lan eth0   =20
172.20.1.0/24        0.0.0.0/0
        0        0 DROP       all  --  br-lan eth0   =20
0.0.0.0/0            192.168.0.0/16
        0        0 DROP       all  --  br-lan eth0   =20
0.0.0.0/0            10.0.0.0/8
        0        0 DROP       all  --  br-lan eth0   =20
0.0.0.0/0            172.16.0.0/12
    23145  1562899 ACCEPT     all  --  br-lan eth0   =20
172.20.0.0/16        0.0.0.0/0
      231    21457 ACCEPT     all  --  eth0 br-lan  0.0.0.0/0=20
0.0.0.0/0            ! state NEW



     Question: what is happening to my return traffic ? Where is it=20
going to (which rule) ?? The network is working, so i'm sure the return=
=20
traffic isnot being blocked. However, i'm not seeing it on the rules it=
=20
was supposed to be 'hitting'.

     is this some new behavior from new iptables/netfilter versions ? i=
s=20
this some behavior exclusively to OpenWRT, maybe some patch they apply=20
to iptables/netfilter ?

root@firewall:/# uname -r
3.10.49

root@firewall:/# iptables --version
iptables v1.4.21


--=20


	Atenciosamente / Sincerily,
	Leonardo Rodrigues
	Solutti Tecnologia
	http://www.solutti.com.br

	Minha armadilha de SPAM, N=C3O mandem email
	gertrudes@solutti.com.br
	My SPAMTRAP, do not email it



