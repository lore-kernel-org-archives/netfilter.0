From: nedco@unacs.bg
Subject: TOS problem
Date: Wed, 5 Mar 2003 14:56:17 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3e65f3f1.49d8.0@unacs.bg>
Reply-To: nedco@unacs.bg
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
To: netfilter@lists.netfilter.org




Hi,  
 
i like to set on myrouter TOS 0x0( Normal-Service ) to some packets 
but found that on some of packets can't set TOS 
in example  
 
then i ping 62.73.77.8 i get pakets with tos 0x10 and can't set to 0x0  
 
table mangle 
Chain FORWARD (policy ACCEPT 1242M packets, 469G bytes) 
 pkts bytes target     prot opt in     out     source               destination

 4589 1075K TOS        all  --  *      *       0.0.0.0/0            62.73.77.8
        TOS set 
0x00 
 4489  919K TOS        all  --  *      *       62.73.77.8           0.0.0.0/0
         TOS set 
0x00 
 
on tcpdump get  
02:36:44.898854 62.176.107.193 > 62.73.77.8: icmp: echo request 
02:36:44.956965 62.73.77.8 > 62.176.107.193: icmp: echo reply [tos 0x10] 
 
Am I doing something wrong? 
 
mandrake Linux version 2.4.19-16mdksmp, iptables v1.2.6a 
10x in advance 
Nedko 

