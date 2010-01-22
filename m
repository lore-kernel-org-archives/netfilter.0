From: Fredrik Ax <frax@axnet.nu>
Subject: iptables MARK + ip rule fwmark on locally generated packets
Date: Fri, 22 Jan 2010 11:07:55 +0100
Message-ID: <20100122100755.GB23731@ioi.dk>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi guys,

I'm a pretty experienced Linux / network developer and administrator,
but I can't get my head around this one.

The long story is that I have a box used as router/fw/proxy running
Debian Squeeze with a customized 2.6.32 x86_64 kernel having three
interfaces (eth2,eth3,eth4) on the same external subnet. One of the
interfaces is used for doing masquerading of other
subnets. Masquerading (not snat) is chosen because the interfaces are
on dhcp, and I don't want to have to rewrite the fw rules each time I
get a new addr ... already have enough with dhclient-hooks for fixing
the routing tables dns-updates, etc ;-) What I basically want to do is
make the proxy's request to go out the same ifc as the masqueraded
packets getting a src addr of s41.s42.s43.s44. Other locally generated
packets should get a src addr s21.s22.s23.s24.

To accomplish this I'm using iptables to mark all, to port 80, locally
generated tcp packets:

% iptables -t mangle -vnL OUTPUT
Chain OUTPUT (policy ACCEPT 3234 packets, 2254K bytes)
 pkts bytes target     prot opt in     out     source               destination         
 1114  181K MARK       tcp  --  *      *       0.0.0.0/0            0.0.0.0/0           tcp dpt:80 MARK set 0x4 

I have verified that the iptables rule marks them fine enough.

Then the ip rule with prio 99 below should then catch them and route
according to table eth4 below. That rule however does, for some reason
not match those packets, instead they are routed according to table
eth2 below (prio 200 rule), getting src addr s21.s22.s23.s24.  If I
disable that rule they are routed according the the prio 300 rule
(getting src addr s31.s32.s33.s34).

prompt% ip rule
0:	from all lookup local 
1:	from all lookup main 
99:	from all fwmark 0x4 lookup eth4 
100:	from 10.116.254.0/26 lookup eth4 
100:	from 10.116.255.34 lookup eth3 
100:	from 10.116.255.64/26 lookup eth4 
200:	from all lookup eth2 
300:	from all lookup eth3 
400:	from all lookup eth4 
32767:	from all lookup default 

prompt% ip route show table eth2
broadcast b1.b2.b3.b4 dev eth2  scope link  src s21.s22.s23.s24 
broadcast n1.n2.n3.n4 dev eth2  scope link  src s21.s22.s23.s24 
n1.n2.n3.n4/m dev eth2  scope link  src s21.s22.s23.s24 
default via g1.g2.g3.g4 dev eth2  src s21.s22.s23.s24 

prompt% ip route show table eth3
broadcast b1.b2.b3.b4 dev eth3  scope link  src s31.s32.s33.s34 
broadcast n1.n2.n3.n4 dev eth3  scope link  src s31.s32.s33.s34 
n1.n2.n3.n4/m dev eth3  scope link  src s31.s32.s33.s34 
default via g1.g2.g3.g4 dev eth3  src s31.s32.s33.s34 

prompt% ip route show table eth4 
broadcast b1.b2.b3.b4 dev eth4  scope link  src s41.s42.s43.s44 
broadcast n1.n2.n3.n4 dev eth4  scope link  src s41.s42.s43.s44 
n1.n2.n3.n4/m dev eth4  scope link  src s41.s42.s43.s44 
default via g1.g2.g3.g4 dev eth4  src s41.s42.s43.s44 


What am I doing wrong here?

TIA
/frax


______________________________________________________________________
This email has been scanned by the MessageLabs Email Security System.
For more information please visit http://www.messagelabs.com/email 
______________________________________________________________________
