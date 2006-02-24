From: Jeff Machesky <jeff@codebest.com>
Subject: NAT rules not clearing,  delays in loading
Date: Fri, 24 Feb 2006 10:49:56 -0700
Message-ID: <43FF4744.8040706@codebest.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

I use to belong to this group once upon a time,  I stepped away for a while.

I've run in to a very strange problem that I hope someone can shed some 
light on.

Using Debian 3.1 I'm trying to do a DNS redirector.   The idea is 
clients using the DNS that have not been authorized will be directed to 
a login page,  once they log in iptables rules will be added to allow 
DNS to resolve normally.

Here is what I've got

The IP of the client (fake) in this case would be 24.158.18.72
The IP of the real DNS server is 10.1.1.2 (Internal LAN)
The IP of the pseudo  DNS server is 24.0.1.2 (fake) on eth0 and 
10.0.1.11 eth1 

iptables -t nat -A PREROUTING -s 24.158.18.72 -p udp -i eth0 --dport 53 
-j DNAT --to 10.0.1.2
iptables -t ant -A POSTROUTING -d 10.0.1.2 -o eth1 -p udp -m udp --dport 
53 -j SNAT --to-source 10.0.1.11

And of course I have forwarding set.

What this does is allow real DNS for client with the IP of 24.158.18.172 
and fake DNS (resolves all the same) for any other client. 

The above rules work,   Now for the problem.

When rule #1 is first put in place the packets do not start to route 
right away,  they often take up to a minute or so to take hold.  Once in 
a while I'll get lucky and the rule appears to take effect right away.  
This is verified by ethereal dumps.

The other problem,   after removing rule #1 or for that matter flushing 
the entire nat chain (iptables -t nat -F) the rules will keep working 
for several minutes.

I've tried this with iptables 1.2.xx and iptables 1.3.5 with kernel 
2.6.12 and kernel 2.6.15.4.   The rules work,  they just don't take hold 
right away or release right away.   This is so weird.

Linux version 2.6.15.4 (root@somewhere.com) (gcc version 3.3.5 (Debian 
1:3.3.5-13)) #2 SMP Thu Feb 23 14:31:04 MST 2006

filename:       
/lib/modules/2.6.15.4/kernel/net/ipv4/netfilter/iptable_nat.ko
license:        GPL
vermagic:       2.6.15.4 SMP PENTIUM4 gcc-3.3
depends:        ip_nat,ip_tables,ip_conntrack


Can anyone shed some light on this issue ?

Thanks,

Jeff

