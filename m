From: "ODEN,MARK THOMAS" <cerberus@ufl.edu>
Subject: pom - applying ROUTE patch
Date: Mon, 10 Oct 2005 18:24:58 -0400 (EDT)
Message-ID: <1326266148.1128983098715.JavaMail.osg@osgjas02.cns.ufl.edu>
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"
To: netfilter@lists.netfilter.org

I'm trying to use the latest pom runme script to install only the 
ROUTE extra package, however I'm having difficulties.  When I 
choose 'y' to the ROUTE package I receive this error:

Do you want to apply this patch [N/y/t/f/a/r/b/w/q/?] y
newfile: 4 files in our way, unable to apply

I read in an earlier post on the netlist-failover list that this 
may indicate that ROUTE is already installed -- however two 
things:

1) The runme script displays:

Testing ROUTE... not applied

2) When attempting this command I receive the following error:

#  iptables -A POSTROUTING -t mangle -p icmp -j ROUTE --oif eth1
iptables v1.3.0: Unknown arg `--oif'
Try `iptables -h' or 'iptables --help' for more information.

AND

#  iptables -A POSTROUTING -t mangle -p icmp -j ROUTE
iptables v1.3.0: Couldn't load target 
`ROUTE':/lib/iptables/libipt_ROUTE.so: cannot open shared object 
file: No such file or directory

Try `iptables -h' or 'iptables --help' for more information.

---

This seems to indicate that the ROUTE package is not installed.

Please advise,

~Mark Oden


