From: Chris Len <sniper@apu.edu>
Subject: doing NAT on udp broadcast traffic (for LAN tcp/ip gaming)
Date: Wed, 9 Oct 2002 11:49:10 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0210091128000.4531-100000@home.apu.edu>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

I'm trying to create a psuedo-bridge between wireless and ethernet 
interface. All works well, except detection of lan game servers. These 
clients send out a global udp broadcast (255.255.255.255) to the game 
server's dst port, and the server replies. Currently however, I cannot nat 
this traffic.  

Is there any way to make this work? 

eth0 is a 802.11b if at 172.16.0.101/16
eth1 is an ethernet interface at 192.168.0.101/24

#/sbin/iptables -t nat -A PREROUTING -i eth1 --protocol udp -d 
255.255.255.255 --dport 6111 -j DNAT --to 172.16.255.255
#/sbin/iptables -t nat -A PREROUTING -i eth0 --protocol udp -d 
255.255.255.255 --dport 6111 -j DNAT --to 192.168.0.255

When i've tried logging rules to see if the traffic was recognized, the 
filter and mangle tables could see the traffic, but the nat table could 
not. 

Obviously the appropriate SNAT rules will need to be in place as well to 
make the traffic appear as if it is from the same subnet.

I'd be open to one of three solutions (in order of prefererence):

1) Get this working using iptables/netfilter in its native state
2) use the ipt_ULOG module to redirect this traffic to userspace, have a 
program listening on the appropriate netlink sockets, mangle the 
src/dst addresses, and resend
3) Get a group and help hack netfilter to support NAT of broadcast 
traffic (if not currently supported)

I appreciate any help that can be offered :)

-Chris Len
sniper@apu.edu
Student Systems Manager
Information & Media Technology
Azusa Pacific University


