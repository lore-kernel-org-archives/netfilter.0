From: Tim alias Sparhawk <sparhawk@cerberus.cs.dartmouth.edu>
Subject: nfs through SNAT problem
Date: Tue, 17 Sep 2002 15:44:01 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0209171531400.17361-100000@cerberus.cs.dartmouth.edu>
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
Cc: sparhawk@cs.dartmouth.edu

Hi All -

I have a strange problem, probably due to my misunderstanding of how 
iptables work but here 'tis.

I have a cluster where the head node does NAT for the slave nodes.  It 
mostly works - EXCEPT for when a slave node NFS mounts an outside 
filesystem, and for some reason the head node will not be able to mount 
it.  IF the head node mounts it first, then the situation is normal and 
all the slaves can mount it as well. The situation only occurs when a 
slave mounts first and then the head nodes mounts later.  (this occurs 
because I have automount and things time out on the head while slaves are 
actively processing).

In anycase can you guys tell me what I'm doing wrong here?

Here's what I'm doing via iptables-save:
*nat
:PREROUTING ACCEPT [513:105072]
:POSTROUTING ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]
-A POSTROUTING -o eth1 -j SNAT --to XXX.XXX.XXX.XXX
COMMIT
*mangle
:PREROUTING ACCEPT [1448:173426]
:INPUT ACCEPT [68952:15261919]
:FORWARD ACCEPT [47:3782]
:OUTPUT ACCEPT [637:72948]
:POSTROUTING ACCEPT [62656:21174399]
COMMIT
*filter
:INPUT ACCEPT [341:24214]
:FORWARD ACCEPT [0:0]
:OUTPUT ACCEPT [252:24864]
-A FORWARD -i eth0 -o eth1 -m state --state RELATED,ESTABLISHED -j ACCEPT
-A FORWARD -i eth0 -o eth1 -j ACCEPT
COMMIT


iptables -L says:

Chain INPUT (policy ACCEPT)
target     prot opt source               destination

Chain FORWARD (policy ACCEPT)
target     prot opt source               destination
ACCEPT     all  --  anywhere             anywhere           state 
RELATED,ESTABLISHED
ACCEPT     all  --  anywhere             anywhere

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination



Thanks for any help!

Cheers,
Tim


