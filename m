From: darcy w.christ <darcy@1000camels.com>
Subject: strange behaviour with DNAT
Date: Fri, 24 May 2002 13:22:16 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <CB2D55EE-6F3A-11D6-A1A0-000502212A00@1000camels.com>
Mime-Version: 1.0 (Apple Message framework v481)
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.samba.org

hi,

   i'm still having trouble trying to dnat for udp.  Below is a tcpdump 
while trying to connect.  i wanted to present this to the list and see 
if anyone knows why my server machine machine would be trying to 
communicate directly with the masq'd machine.  To me, that is a problem 
since 192.168.1.3 is internal to another network and there is no way 
that H86.C247.tor.velocet.net  can communicate directly with 192.168.1.3

H86.C247.tor.velocet.net = server
HSE-Ottawa-ppp158027.sympatico.ca = client gateway (where DNAT rule is)
192.168.1.3 = internal masq'd ip

[root@one root]# tcpdump|grep 3283
tcpdump: listening on eth0
13:08:06.727269 H86.C247.tor.velocet.net.3283 > HSE-Ottawa-
ppp158027.sympatico.ca.3283:  udp 38
13:08:06.769878 HSE-Ottawa-ppp158027.sympatico.ca.3283 > 
H86.C247.tor.velocet.net.3283:  udp 8 (DF)
13:08:06.774276 H86.C247.tor.velocet.net.3283 > HSE-Ottawa-
ppp158027.sympatico.ca.3283:  udp 6
13:08:06.816271 HSE-Ottawa-ppp158027.sympatico.ca.3283 > 
H86.C247.tor.velocet.net.3283:  udp 12 (DF)
13:08:06.825569 H86.C247.tor.velocet.net.3283 > HSE-Ottawa-
ppp158027.sympatico.ca.3283:  udp 72
13:08:06.874428 HSE-Ottawa-ppp158027.sympatico.ca.3283 > 
H86.C247.tor.velocet.net.3283:  udp 62 (DF)
13:08:06.891537 H86.C247.tor.velocet.net.3283 > 192.168.1.3.3283:  udp 5
13:08:08.499730 H86.C247.tor.velocet.net.3283 > 192.168.1.3.3283:  udp 5
13:08:11.940161 H86.C247.tor.velocet.net.3283 > 192.168.1.3.3283:  udp 5
13:08:17.115976 H86.C247.tor.velocet.net.3283 > 192.168.1.3.3283:  udp 5


my rules for the DNAT are:

/sbin/iptables -I PREROUTING -t nat -p udp --dport 3283 -i ppp0 -j DNAT 
--to 192.168.1.3
/sbin/iptables -I FORWARD -p udp -d 192.168.1.3 --dport 3283 -j ACCEPT


any thoughts on the problem.


