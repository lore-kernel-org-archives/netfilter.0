From: Bobo <boboaq@163.com>
Subject: Is this right?
Date: Tue, 15 Apr 2003 22:39:26 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030415143422.22F0F1C6AD678@sm205.163.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: netfilter@lists.netfilter.org, netfilter@lists.netfilter.org

Hello all:

  Now,i am using Netfilter as gateway of a LAN,and I would like to account the traffic for each IP of LAN.

   As we know,IPtables  could report the traffic counter of each chain with  "iptables -nvL FORWARD".

  Now,I creat a new chain in filter table for each IP.When a packet traverse the  FORWARD chain ,I let them jump to the chain for each IP firstly, 
 such as:


$IPTABLES -N lltj1
$IPTABLES -N lltj2
$IPTABLES -N lltj3
$IPTABLES -N lltj4
$IPTABLES -N lltj5
$IPTABLES -N lltj6
$IPTABLES -N lltj7
$IPTABLES -N lltj8
$IPTABLES -N lltj9

$IPTABLES -A FORWARD -s 117.1.1.1 -j lltj1
$IPTABLES -A FORWARD -d 117.1.1.1 -j lltj1
$IPTABLES -A FORWARD -s 117.1.1.3 -j lltj3
$IPTABLES -A FORWARD -d 117.1.1.3 -j lltj3
$IPTABLES -A FORWARD -s 117.1.1.4 -j lltj4
$IPTABLES -A FORWARD -d 117.1.1.4 -j lltj4
$IPTABLES -A FORWARD -s 117.1.1.5 -j lltj5
$IPTABLES -A FORWARD -d 117.1.1.5 -j lltj5
$IPTABLES -A FORWARD -s 117.1.1.10 -j lltj6
$IPTABLES -A FORWARD -d 117.1.1.10 -j lltj6
$IPTABLES -A FORWARD -s 117.1.1.177 -j lltj7
$IPTABLES -A FORWARD -d 117.1.1.177 -j lltj7
$IPTABLES -A FORWARD -s 117.1.1.133 -j lltj9
$IPTABLES -A FORWARD -d 117.1.1.133 -j lltj9
$IPTABLES -A FORWARD -s 117.1.1.8 -j lltj8
$IPTABLES -A FORWARD -d 117.1.1.8 -j lltj8

  Each chain for every IP is empty,and the packet just traverse the chain without any action.
  After executing  the scripts, using: iptables -nvL FORWARD,I get the following messages:

    0     0 lltj3      all  --  any    any     117.1.1.3            anywhere           
    0     0 lltj3      all  --  any    any     anywhere             117.1.1.3          
 4257  268K lltj4      all  --  any    any     117.1.1.4            anywhere           
 2217 1059K lltj4      all  --  any    any     anywhere             117.1.1.4          
20780 1217K lltj5      all  --  any    any     117.1.1.5            anywhere           
32338   34M lltj5      all  --  any    any     anywhere             117.1.1.5          
21374  988K lltj6      all  --  any    any     117.1.1.10           anywhere           
15988 5648K lltj6      all  --  any    any     anywhere             117.1.1.10         
  852  118K lltj7      all  --  any    any     117.1.1.177          anywhere           
  937  202K lltj7      all  --  any    any     anywhere             117.1.1.177        
 1473  132K lltj9      all  --  any    any     117.1.1.133          anywhere           
 1738  476K lltj9      all  --  any    any     anywhere             117.1.1.133        
 8907  535K lltj8      all  --  any    any     117.1.1.8            anywhere           
 7638 1874K lltj8      all  --  any    any     anywhere             117.1.1.8        


 In fact,I could get some data about traffic.

 But now,I would like to know whether these data are right or exact ?
 if they are reliable, I could do other work on base of these data.
 
 Thanks 


