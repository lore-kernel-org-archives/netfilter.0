From: Julian Hagenauer <chaosbringer@gmx.de>
Subject: CLUSTERIP does not work
Date: Wed, 28 Jun 2006 09:58:15 +0200
Message-ID: <44A23697.2070706@gmx.de>
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

Hi,
i don't get iptables with CLUSTERIP to work properly.
I run debian sarge with kernel 2.6.11 (dom0) and a vm with debian sarge 
and also kernel 2.6.11 (domU) with iptables 1.3.5.
The IP of the vmm ist 192.168.1.2, of the vm is 192.168.1.4.
For testing my cluster consists only of the one vm-host.
Now i run
iptables -A INPUT -d 192.168.1.3 -i eth0 -j CLUSTERIP --new --hashmode 
sourceip --clustermac 01:23:45:67:89:ab --total-nodes 1 --local-node 1
on the vm.
No errors.

iptables -L gives:
Chain INPUT (policy ACCEPT)
target     prot opt source               destination        
CLUSTERIP  all  --  anywhere             192.168.1.3         CLUSTERIP 
hashmode=sourceip clustermac=E0:64:D7:C3:89:AB total_nodes=1 
local_node=1 hash_init=0
Chain FORWARD (policy ACCEPT)
target     prot opt source               destination        
Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination     

Why does the mac differs from the clustermac definied earlier? Is this 
an error/bug?
When i try to ping 192.168.1.3 from any host i got a destination not 
reachable error, i think the host is not able to resolve the ipadress. 
Maybe due to a false non-multicast arp-address?
cat /proc/net/ipt_CLUSTERIP/192.168.1.3 returns nothing, the file seems 
to be empty.
Any suggestion what is wrong/where i could start to investigate?

Sincerely,
Julian





