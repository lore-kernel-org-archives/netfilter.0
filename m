From: paolino <paolino@splinder.it>
Subject: load-balancing question
Date: Fri, 14 Nov 2003 16:18:32 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1068823111.2737.58.camel@localhost>
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

I have the followin set-up:

Chain PREROUTING (policy ACCEPT 6389 packets, 781517 bytes)
 pkts bytes target     prot opt in     out     source              
destination
    0     0 DNAT       tcp  --  *      *       0.0.0.0/0           
X.X.X.X     tcp dpt:5222 to:192.168.18.40:5222
    0     0 DNAT       tcp  --  *      *       0.0.0.0/0           
X.X.X.X     tcp dpt:91 to:192.168.18.10:81
    0     0 DNAT       tcp  --  *      *       0.0.0.0/0           
X.X.X.X     tcp dpt:92 to:192.168.18.20:81
23834 1248K web  tcp  --  *      *       0.0.0.0/0           
X.X.X.X     tcp dpt:80
 
Chain POSTROUTING (policy ACCEPT 78621 packets, 4200654 bytes)
 pkts bytes target     prot opt in     out     source              
destination
 2720  209K MASQUERADE  all  --  *      *       192.168.18.0/24     
0.0.0.0/0
 
Chain OUTPUT (policy ACCEPT 5824 packets, 375096 bytes)
 pkts bytes target     prot opt in     out     source              
destination
 
Chain web (1 references)
 pkts bytes target     prot opt in     out     source              
destination
10293  537K DNAT       tcp  --  *      *       0.0.0.0/0           
X.X.X.X     tcp to:192.168.18.20:80 192.168.18.10:80

The purpose of the web chain is to load-balance web connections to 2
servers on my inside network. The questions is that apparently almost
all connection to port 80 are being directed to the 192.168.18.20:80
server, and very few to the other server.

e.g.  33 connections to the .20 and 2 connections to .10.

Can someone point me to what i'm doing wrong !?!?!?


Cheers

paolino@splinder.it



