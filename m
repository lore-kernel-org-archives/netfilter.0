From: =?unknown-8bit?b?P8zsyMo=?=<wsgtrsys@21cn.com>
Subject: how to set iptables to hide NAT router?
Date: Mon, 8 Nov 2004 22:36:29 +0800 (CST)
Message-ID: <L3958891776370.14499@webmail6.inner-21cn.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org, netfilter@lists.netfilter.org

hi,i am use coyote nat to  ,but my ISP Detecting NAT Devices using sFlow,and now ,i can't connect internet,
please look up :
http://www.sflow.org/detectNAT/
http://www.topsight.net/article.php?story=2003042408350170&mode=print
and 
http://www.topsight.net/article.php?story=2003042408350170&mode=print
 
 
it say:
 
Detecting NAT Routers
Thursday, April 24 2003 @ 08:35 AM CDT
Contributed by: opticfiber 
A great paper written by Peter Phaal explains the simple method used in his companies product, Sflow, to detect multiple host behind a NAT firewall. The secret, it would seem is simply monitoring of the TTL of out going packets and comparing them to a host know not to be using a NAT firewall. 

Another method only touched upon by Phaal is passive OS finger printing, although this method is less reliable, an statistical analasys could determine if multiple operating systems were using the same network network device. If this were the case it would be reasonable to assume that that host was in fact a NAT device. 

AT&T Labs has published a paper explaining how to count the number of devices behind a NAT device. The method AT&T uses, relies on the fact that most operating systems (excluding Linux and Free BSD) use IP header ID's as simple counters. By observing out of sequence header ID's, an analasys can calculate how many actual hosts are behind a NAT device. 

Each of these methods can be easily defeated through better sterilization by the router itself. In the first example, if the TTL for each TCP packet was re-written by the router for each packet to the value of 128, the first method would no longer function. For the second method, sterilizing IP header information and stripping unneeded TCP flags would successfully undermine this scheme. For the last Method, counting hosts behind a router. Striping the fragmentation flag for syn packets, and setting the IP ID to '0', (like Linux and Free BSD both do) would make it impossible to count hosts behind a NAT router. 

 

how to set iptables rule to do it:

example????

iptables -I FORWARD -j TTL --ttl-set 128

 

??

and more?

 

 

who can help me?

 

 

 

 

 

                                                            wsgtrsys

                                                           2004.11.8

 


