From: Piotr Chytla <pch@packetconsulting.pl>
Subject: CLUSTERIP problems
Date: Tue, 28 Jun 2005 21:40:26 +0200
Message-ID: <20050628194026.GA2010@packetconsulting.pl>
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

Hi 

I've problem with CLUSTERIP from 2.6.12 kernel, both nodes run debian
sarge on 2.6.12.

First node :
eth0      Link encap:Ethernet  HWaddr 00:06:29:8F:42:0D  
          inet addr:192.168.116.50  Bcast:192.168.116.127
	  Mask:255.255.255.128

iptables -A INPUT -i eth0 -p tcp -d 192.168.116.50/32 --dport 80 -j CLUSTERIP --new --hashmode sourceip --clustermac 01:23:45:67:89:AB --total-nodes 2 --local-node 1

Second node:
eth0      Link encap:Ethernet  HWaddr 00:06:29:A8:14:4D  
          inet addr:192.168.116.51  Bcast:192.168.116.127
	  Mask:255.255.255.128

iptables -A INPUT -i eth0 -p tcp -d 192.168.116.50/32 --dport 80 -j CLUSTERIP --new --hashmode sourceip --clustermac 01:23:45:67:89:AB --total-nodes 2 --local-node 2

When I've tried to connect from outside to cluster , connection fails . 
Only some SYN packets appears on input interface , but connection is not
created. 

On the first machine I have in logs only this :

hash=1 ct_hash=1 not responsible

ARP mangling patch for 2.6.12 is applied :

http://patchwork.netfilter.org/netfilter-devel/patch.pl?id=2643

/pch

-- 
Dyslexia bug unpatched sinse 1977 ...
exploit have leaked to the underground.

