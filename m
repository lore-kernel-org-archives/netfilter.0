From: bob bob <jlpeow314@yahoo.com>
Subject: issues with iptables
Date: Wed, 27 Nov 2002 15:54:05 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021127235405.35532.qmail@web14505.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hello, I'm trying to setup my comp to do NAT. I've
compiled
all the necessary options into the kernel (2.4.18),
turned
on ip forwarding, and setup my iptables rules to
forward all
traffic. I've been trying to setup NAT on multiple OSs
and had
no success, which leads me to believe that this might
be a
hardware issue. I'm able to get an internet connection
by plugging
in my nics one at a time, but not with NAT. The cards
I'm using
are 2 D-link 530tx+, and 1 Realtek 8139. Any ideas
what might
be wrong?

---------------------information---------------------

ifconfig -a:

eth0      Link encap:Ethernet  HWaddr
00:50:BA:61:20:C1
          inet addr:192.168.0.175  Bcast:192.168.0.255
 Mask:255.255.255.0
          UP BROADCAST NOTRAILERS RUNNING MULTICAST 
MTU:1500  Metric:1
          RX packets:4345 errors:0 dropped:0
overruns:0 frame:0
          TX packets:4885 errors:0 dropped:0
overruns:0 carrier:0
          collisions:0 txqueuelen:100
          RX bytes:2703357 (2.5 Mb)  TX bytes:713218
(696.5 Kb)
          Interrupt:5 Base address:0xd000

eth1      Link encap:Ethernet  HWaddr
00:50:BA:61:1E:DC
          inet addr:192.168.0.1  Bcast:192.168.0.255 
Mask:255.255.255.0
          UP BROADCAST RUNNING MULTICAST  MTU:1500 
Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0
frame:0
          TX packets:0 errors:0 dropped:0 overruns:0
carrier:0
          collisions:0 txqueuelen:100
          RX bytes:0 (0.0 b)  TX bytes:0 (0.0 b)
          Interrupt:10 Base address:0xf400

lo        Link encap:Local Loopback
          inet addr:127.0.0.1  Mask:255.0.0.0
          UP LOOPBACK RUNNING  MTU:16436  Metric:1
          RX packets:410 errors:0 dropped:0 overruns:0
frame:0
          TX packets:410 errors:0 dropped:0 overruns:0
carrier:0 
          collisions:0 txqueuelen:0
          RX bytes:20416 (19.9 Kb)  TX bytes:20416
(19.9 Kb)

route:
Kernel IP routing table
Destination     Gateway         Genmask         Flags
Metric Ref    Use
Iface
192.168.0.0     *               255.255.255.0   U    
0      0        0
eth0
192.168.0.0     *               255.255.255.0   U    
0      0        0
eth1
loopback        *               255.0.0.0       U    
0      0        0 lo
default         192.168.0.2     0.0.0.0         UG   
0      0        0
eth0



__________________________________________________
Do you Yahoo!?
Yahoo! Mail Plus - Powerful. Affordable. Sign up now.
http://mailplus.yahoo.com

