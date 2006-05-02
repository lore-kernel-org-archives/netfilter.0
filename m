From: Marius-Iulian Corici <marius-Iulian.corici@fokus.fraunhofer.de>
Subject: Fwd: about conntrack application
Date: Tue, 2 May 2006 11:50:37 +0200
Message-ID: <200605021150.38026.mco@fokus.fraunhofer.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: netfilter@lists.netfilter.org



----------  Forwarded Message  ----------

Subject: about conntrack application
Date: Tuesday 02 May 2006 11:48
From: Marius-Iulian Corici <mco@fokus.fraunhofer.de>
To: netfilter@lists.netfilter.org

I have a 2.6.16 kernel with iptables version 1.3.5
I installed also:
               libnfnetlink - 0.0.14
               libnetfilter-conntrack - 0.0.30
               conntrack - 1.00beta1-1

I receive at execution as root the next outputs:
> ctnl_test

Test for libnetfilter_conntrack

libc.so.6: aborted attempt to load ctnl_test!

and also (as root !!):
> conntrack  -L conntrack

Operation failed: sorry, you must be root or get CAP_NET_ADMIN capability to
do this

I don't have any clue were to start from. Is there any document on how to
install and run this application? Which versions go with which iptables and
with which kernel. Do I need special kernel modules for netlink
communication? Is the version of iptables correct? Are there other settings
that could be necessary?

I am in front of a dead-line, so if anyone could give me any hint I will be
very VERY greatful.

Marius

-------------------------------------------------------

-- 
Dipl. Eng. Marius-Iulian Corici
FOKUS/NGNI
Kaiserin-Augusta-Allee 31
10589 Berlin,Germany
Phone +49 (0)30 - 3463 - 7271
eMail corici@fokus.fraunhofer.de
We are changing the world because God helped us hack His source code ...

