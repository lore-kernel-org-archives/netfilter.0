From: Sandro Dentella <sandro@e-den.it>
Subject: DNAT/SNAT doubt
Date: Fri, 4 Nov 2005 19:15:51 +0100
Message-ID: <20051104181551.GA27330@casa.e-den.it>
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
To: iptables <netfilter@lists.netfilter.org>

Hi all,

  a nameserver managed by one of my customers died unexpectedly, they asked
  me to redirect all traffic to another DNS in a totally different
  network. Should it work? (it didn't in my case...)

Chain PREROUTING (policy ACCEPT 656 packets, 33024 bytes)
 pkts bytes target     prot opt in     out     source               destination
 1410 93104 DNAT       udp  --  *      *       0.0.0.0/0            0.0.0.0/0          udp dpt:53 to:XXX

Chain POSTROUTING (policy ACCEPT 628 packets, 31631 bytes)
 pkts bytes target     prot opt in     out     source               destination
    0     0 SNAT       udp  --  *      *       0.0.0.0/0            XXX    udp dpt:53 to:YYY

  you can see that no packets entered the POSTROUTING chain even thought in
  my opinion all packets ther entered the PREROUTING rule should enter the
  POSTROUTING one. Am I wrong?

  TYA
  sandro
  *:-)


-- 
Sandro Dentella  *:-)
e-mail: sandro@e-den.it 
http://www.tksql.org                    TkSQL Home page - My GPL work

