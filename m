From: "Mardaga Stephan" <smardaga@brutele.be>
Subject: Masquerade don't masquerade
Date: Wed, 25 Aug 2004 21:05:07 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <003601c48ad6$819497d0$c6ea44d4@famille>
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
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hello,

I'm new on this forum and hope you will help me.

I'm building a Debian server and it is the basic stage.
I wish to run Iptables with masquerade.


detailed problem report could be find @ this address :
http://homeusers.brutele.be/smardaga/masquerade/

resume :

 PC1                      Debian Serveur                     PC2
 |                       Eth0      Eth1                      |
 |.1                    .50|         |.1                   .2|
 |                         |         |                       |
 |                         |         |                       |
 ---------------------------         -------------------------
      192.168.0.x/24                       192.168.1.x/24


Masquerade don't work when pinging from PC2 (192.168.1.2) to PC1
(192.168.0.1). PC1 receives icmp packet with IP source address 192.168.1.2.

tcpdump on eth0 :

20:30:25.472725 192.168.1.2 > 192.168.0.1: icmp: echo request
20:30:30.972679 192.168.1.2 > 192.168.0.1: icmp: echo request
20:30:36.472321 192.168.1.2 > 192.168.0.1: icmp: echo request
20:30:41.972217 192.168.1.2 > 192.168.0.1: icmp: echo request
20:30:47.472049 192.168.1.2 > 192.168.0.1: icmp: echo request
20:30:52.972084 192.168.1.2 > 192.168.0.1: icmp: echo request

 iptables release 1.2.6a
 Linux  2.4.18-bf2.4 #1 Son Apr 14 09:53:28 CEST 2002 i686 unknown

Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination

Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination
LOG        all  --  anywhere             anywhere           LOG level
warning
MASQUERADE  all  --  192.168.1.0/24       anywhere
LOG        all  --  anywhere             anywhere           LOG level
warning

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination

Any help and/or suggestions will be accepted gratefully.

Thanks in advance,

Stephan Mardaga


