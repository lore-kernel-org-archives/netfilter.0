From: Hongyi Zhao <hongyi.zhao@gmail.com>
Subject: ipset based police routing not works with openvpn.
Date: Wed, 14 Oct 2015 10:23:16 +0800
Message-ID: <CAGP6PO+pPJ1GjD_XW214U0h3b5v_GRYAejgpz0d8qGEgN=-KKg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:cc:content-type;
        bh=HhOeXNRmafmV0d8RpGPhjzhbtrwbi/GbYz3YMj4GBxM=;
        b=Kr1QyqJTIIWpa8XUFJI9ZVKfpupeY0R/4Uj+JD0bqZAnHi5IK4zUQASiynmah8YEmU
         6183u9rmFsZb3zTpjs2MFDlCiMV8uibfZbkeRkIaPDvl7nuZff2J5PPjqBMdGAqkoesY
         xdPToBTMMogCZ79YSJMOJ7I4w/lC4HZEvawwqBnbhZghTIcF3XtfGznjlw90KXv6B8ht
         g5Dmdp6FnV9EPvrwaPHu2KoUnNen73DQRqBZ+3uUwELw1HaGEzHbxxgvphCNosY01AqE
         UEgBc6z7F5MMOAlp7hlvFcuCRT1gPEUXCQBDSPwalfuSfo34NdTdpGhEGCg4Ftvs4sw4
         dqhA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org
Cc: openvpn-users@lists.sourceforge.net

Hi all,

I'm using Debian Jessie and I use openvpn to connect to the vpngate's
free vpn-servers.

For my case, I just want to some specific traffics are routed by
openvpn, say the traffic to google.com.  This should be done by using
policy routing based on netfilter's toolchains.  And at the same time,
the openvpn shouldn't change the original default gateway.

For the above purpose,  I want to use the ipset method to achieve this
goal, and I do the following steps:

1- Firstly, I create the ipset with the following command:

$ sudo ipset create openvpn-test hash:net

Then I add all of the google's ip blocks with cidr form into this
ipset, see the following for detail:

$ sudo ipset list openvpn-test
Name: openvpn-test
Type: hash:net
Revision: 5
Header: family inet hashsize 1024 maxelem 65536
Size in memory: 18488
References: 1
Members:
192.104.160.0/23
146.148.0.0/17
173.194.0.0/16
1.0.0.0/24
207.223.160.0/20
194.110.194.0/24
8.34.208.0/20
66.249.64.0/19
72.14.192.0/18
142.250.0.0/15
74.125.0.0/16
45.121.228.0/22
193.142.125.0/24
8.15.202.0/24
64.233.160.0/19
216.239.32.0/19
172.102.8.0/21
103.62.64.0/22
108.59.80.0/20
208.65.152.0/22
199.223.232.0/21
108.170.192.0/18
1.1.1.0/24
172.217.0.0/16
162.222.176.0/21
23.236.48.0/20
172.253.0.0/16
113.197.106.0/24
107.167.160.0/19
64.15.112.0/20
216.58.192.0/19
104.132.0.0/16
8.35.192.0/20
104.196.0.0/14
104.154.0.0/15
70.32.128.0/19
208.117.224.0/19
23.251.128.0/19
209.85.128.0/17
216.252.220.0/22
172.110.32.0/21
192.178.0.0/15
162.216.148.0/22
173.255.112.0/20
199.192.112.0/22
66.102.0.0/20
104.133.0.0/17
8.8.8.0/24
192.158.28.0/22
1.2.3.0/24
107.178.192.0/18
108.177.0.0/17
104.134.128.0/17
8.8.4.0/24
130.211.0.0/16

2- Using iptables to set the mark value 200 for all of the traffic
which are destinated to google.com:

$ sudo iptables -t mangle -A PREROUTING -m set --match-set
openvpn-test dst -j MARK --set-mark  200

Then add the ip rule as follows:

$ sudo ip rule add fwmark 200 table openvpn

3- Connect to the vpngate's free vpn servers with the option
`--route-nopull' by using openvpn.  After the connection  successed, I
can obtain the following information:

$ sudo ifconfig
eth0      Link encap:Ethernet  HWaddr 0c:c4:7a:6a:f7:f0
          inet addr:192.168.0.2  Bcast:192.168.0.255  Mask:255.255.255.0
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:31489 errors:0 dropped:0 overruns:0 frame:0
          TX packets:45258 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:18255146 (17.4 MiB)  TX bytes:10595478 (10.1 MiB)
          Memory:de200000-de27ffff

eth1      Link encap:Ethernet  HWaddr 0c:c4:7a:6a:f7:f1
          UP BROADCAST MULTICAST  MTU:1500  Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)
          Memory:de100000-de17ffff

lo        Link encap:Local Loopback
          inet addr:127.0.0.1  Mask:255.0.0.0
          UP LOOPBACK RUNNING  MTU:65536  Metric:1
          RX packets:20590 errors:0 dropped:0 overruns:0 frame:0
          TX packets:20590 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0
          RX bytes:2288717 (2.1 MiB)  TX bytes:2288717 (2.1 MiB)

tun-gfwlist Link encap:UNSPEC  HWaddr
00-00-00-00-00-00-00-00-00-00-00-00-00-00-00-00
          inet addr:10.211.170.25  P-t-P:10.211.170.26  Mask:255.255.255.255
          UP POINTOPOINT RUNNING NOARP MULTICAST  MTU:1500  Metric:1
          RX packets:20 errors:0 dropped:0 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:100
          RX bytes:6300 (6.1 KiB)  TX bytes:0 (0.0 B)

As you can see, the tun-gfwlist is the openvpn's virutal nic card.

4- Finally, add the default routing into table openvpn with the
following command:

$ sudo route add default via 10.211.170.26 dev tun-gfwlist

Test the above command's result by using:

$ ip route show table openvpn
default via 10.211.170.26 dev tun-gfwlist

But, after doing all of the above steps, I finally find that all of
the traffic form my box to google.com still use the original default
gateway on dev eth0.

Any hints for this issue?

Regars
-- 
Hongyi Zhao <hongyi.zhao@gmail.com>
Xinjiang Technical Institute of Physics and Chemistry
Chinese Academy of Sciences
GnuPG DSA: 0xD108493
