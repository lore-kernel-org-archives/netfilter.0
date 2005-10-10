From: BERTRAND =?iso-8859-1?Q?Jo=EBl?= <mt@systella.fr>
Subject: Linux 2.6.14-rc3 and masquerading
Date: Mon, 10 Oct 2005 11:02:13 +0200
Message-ID: <20051010090213.GB30565@rayleigh.systella.fr>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

	Hello,

	I'm trying to install NAT on an U60 (Sparc64) running 2.6.14-rc3 linux
	kernel.

	ppp0 (on eth0) <-> U60 <-> eth1

Root zebigbos:[/proc] > ifconfig
eth0      Link encap:Ethernet  HWaddr 08:00:20:A1:4B:33  
          inet addr:10.0.0.1  Bcast:10.255.255.255  Mask:255.0.0.0
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:2130 errors:0 dropped:0 overruns:0 frame:0
          TX packets:2486 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000 
          RX bytes:687353 (671.2 KiB)  TX bytes:250074 (244.2 KiB)
          Interrupt:96 Base address:0xa000 

eth1      Link encap:Ethernet  HWaddr 08:00:20:A1:4B:33  
          inet addr:192.168.0.128  Bcast:192.168.0.255  Mask:255.255.255.0
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:731 errors:0 dropped:0 overruns:0 frame:0
          TX packets:36 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000 
          RX bytes:70450 (68.7 KiB)  TX bytes:2160 (2.1 KiB)
          Interrupt:96 Base address:0x9800 

lo        Link encap:Local Loopback  
          inet addr:127.0.0.1  Mask:255.0.0.0
          UP LOOPBACK RUNNING  MTU:16436  Metric:1
          RX packets:68 errors:0 dropped:0 overruns:0 frame:0
          TX packets:68 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0 
          RX bytes:7268 (7.0 KiB)  TX bytes:7268 (7.0 KiB)

ppp0      Link encap:Point-to-Point Protocol  
          inet addr:82.124.167.81  P-t-P:193.253.160.3  Mask:255.255.255.255
          UP POINTOPOINT RUNNING NOARP MULTICAST  MTU:1492  Metric:1
          RX packets:2107 errors:0 dropped:0 overruns:0 frame:0
          TX packets:2463 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:3 
          RX bytes:639355 (624.3 KiB)  TX bytes:195131 (190.5 KiB)

Root zebigbos:[/proc] > iptables -L -n -v
Chain INPUT (policy ACCEPT 2285 packets, 663K bytes)
 pkts bytes target     prot opt in     out     source               destination         
    0     0 fail2ban-ssh  tcp  --  *      *       0.0.0.0/0            0.0.0.0/0
tcp dpt:22 

Chain FORWARD (policy ACCEPT 695 packets, 58380 bytes)
 pkts bytes target     prot opt in     out     source               destination         

Chain OUTPUT (policy ACCEPT 1977 packets, 159K bytes)
 pkts bytes target     prot opt in     out     source               destination         

Chain fail2ban-ssh (1 references)
 pkts bytes target     prot opt in     out     source               destination         
    0     0 RETURN     all  --  *      *       0.0.0.0/0            0.0.0.0/0           
Root zebigbos:[/proc] > iptables -L -n -v -t nat
Chain PREROUTING (policy ACCEPT 11 packets, 888 bytes)
 pkts bytes target     prot opt in     out     source               destination         

Chain POSTROUTING (policy ACCEPT 97 packets, 7250 bytes)
 pkts bytes target     prot opt in     out     source               destination         
   16  1247 MASQUERADE  all  --  *      *       192.168.0.0/24       0.0.0.0/0           

Chain OUTPUT (policy ACCEPT 104 packets, 7741 bytes)
 pkts bytes target     prot opt in     out     source               destination         
Root zebigbos:[/proc] > 

	My U60 works fine and can access to Internet with ppp0 and to my LAN through
	eth1. When a workstation in the LAN want to access to Internet (with a ping
	for example...), I can see all paquet coming from the workstation to the
	internet :

16:30:27.244494 IP 192.168.0.7 > rayleigh.systella.fr: ICMP echo request, id
51979, seq 1280, length 64
16:30:28.248437 IP 192.168.0.7 > rayleigh.systella.fr: ICMP echo request, id
51979, seq 1536, length 64
16:30:29.252459 IP 192.168.0.7 > rayleigh.systella.fr: ICMP echo request, id
51979, seq 1792, length 64

	and the same paquets after the translation on ppp0 :

16:31:04.393237 IP ASt-Lambert-152-1-41-81.w82-124.abo.wanadoo.fr >
rayleigh.systella.fr: ICMP echo request, id 51979, seq 10752, length 64

	I can see the "pong" coming from rayleigh.systella.fr :

16:31:04.495483 IP rayleigh.systella.fr >
ASt-Lambert-152-1-41-81.w82-124.abo.wanadoo.fr: ICMP echo reply, id 51979, seq
10752, length 64

	but it is blocked by the U60 ! I don't understand. I use NAT for a long time
	without any trouble. Any idea ? I have tried 2.6.11.6, 2.6.11.12, 2.6.12
	too...

	Regards,

	JKB

