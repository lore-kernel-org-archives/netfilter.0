From: Patrik Hasibuan <patrikhasibuan@ymail.com>
Subject: routing to forward a service request to another machine with iptables.
Date: Tue, 9 Dec 2008 08:44:05 +0800 (SGT)
Message-ID: <307438.64180.qm@web76715.mail.sg1.yahoo.com>
Reply-To: patrikhasibuan@ymail.com
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Dear my friends,

I use openSuSE11 and iptables. I am confused about iptables.

We use inbit for our internal company communication among the employees. The inbit server is located in our internal LAN (without public IP). Inbit Server has IP of 192.168.1.1 .

Some of the users those mobile needs the inbit too.

The mobile users do login to Inbit Server through our internet gateway whose public IP and the IP is 219.83.114.179 . The Inbit service port number is 10883.

This are the interfaces what 219.83.114.179 has:
======
mysussy:~ # ifconfig
eth0      Link encap:Ethernet  HWaddr 00:19:D1:3C:A0:30
          inet addr:219.83.114.179  Bcast:219.83.114.255  Mask:255.255.255.0
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:1350614 errors:0 dropped:0 overruns:0 frame:0
          TX packets:897580 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:100
          RX bytes:1783763044 (1701.1 Mb)  TX bytes:114925562 (109.6 Mb)
          Memory:30400000-30420000

eth1      Link encap:Ethernet  HWaddr 00:50:DA:C4:C7:95
          inet addr:192.168.1.9  Bcast:192.168.1.255  Mask:255.255.255.0
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:975909 errors:0 dropped:0 overruns:1 frame:0
          TX packets:1348521 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:124074825 (118.3 Mb)  TX bytes:1783488699 (1700.8 Mb)
          Interrupt:21 Base address:0x800

eth2      Link encap:Ethernet  HWaddr 00:0C:42:07:1C:74
          inet addr:192.168.1.234  Bcast:192.168.1.255  Mask:255.255.255.0
          UP BROADCAST MULTICAST  MTU:1500  Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:0 (0.0 b)  TX bytes:0 (0.0 b)
          Interrupt:22 Base address:0x6300

lo        Link encap:Local Loopback
          inet addr:127.0.0.1  Mask:255.0.0.0
          UP LOOPBACK RUNNING  MTU:16436  Metric:1
          RX packets:6 errors:0 dropped:0 overruns:0 frame:0
          TX packets:6 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0
          RX bytes:580 (580.0 b)  TX bytes:580 (580.0 b)

tun0      Link encap:UNSPEC  HWaddr 00-00-00-00-00-00-00-00-00-00-00-00-00-00-00-00
          inet addr:192.168.23.1  P-t-P:192.168.23.2  Mask:255.255.255.255
          UP POINTOPOINT RUNNING NOARP MULTICAST  MTU:1500  Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:100
          RX bytes:0 (0.0 b)  TX bytes:0 (0.0 b)
======

I want the incoming packet in 219.83.114.179:10883 will be forwarded to 192.168.1.1:10883.

But I don't know how to forward the PREROUTING / SNAT.

This are what I've done:
======
mysussy:~ # iptables -I FORWARD 1 -i eth0 -o eth1 -p tcp -s 0/0 -d 219.83.114.179 --dport 10883 -j ACCEPT
mysussy:~ # iptables -D FORWARD 1
mysussy:~ # iptables -D INPUT 1
mysussy:~ # iptables -I INPUT 1 -p tcp -s 0/0 -d 219.83.114.179 -i eth0 --dport 10883 -j ACCEPT
mysussy:~ # iptables -I FORWARD 1 -i eth0 -o eth1 -p tcp -s 0/0 -d 219.83.114.179 --dport 10883 -j ACCEPT
mysussy:~ # iptables -t nat -I PREROUTING 1 -i eth0 -o eth1 --dport 10883 -J SNAT --to-destination 192.168.1.1
iptables v1.4.0: Unknown arg `--dport'
Try `iptables -h' or 'iptables --help' for more information.
======

Please tell me where are my mistakes.

Thank you very much in advance.


      Menambah banyak teman sangatlah mudah dan cepat. Undang teman dari Hotmail, Gmail ke Yahoo! Messenger sekarang! http://id.messenger.yahoo.com/invite/
