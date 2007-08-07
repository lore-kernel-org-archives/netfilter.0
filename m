From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: conntrackd
Date: Tue, 7 Aug 2007 15:39:49 +0200
Message-ID: <00d601c7d8f8$6d082d90$0b0ffe0a@NS006819>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi,

I'm trying to setup conntrackd according to
http://people.netfilter.org/pablo/conntrackd/install.html. It looks like
I'm doing something wrong but I can't find out what it is.

I'm using:
- CentOS 5
- kernel 2.6.22.1
- libnfnetlink-20070712
- libnetfilter_conntrack-20070712
- conntrack-tools-20070712
- keepalived-1.1.13

I've installed keepalived and got that part working.
Next, I installed/configured conntrackd, but when trying to start it I
receive this error:

# conntrackd -C /usr/local/etc/conntrackd/conntrackd.conf
ERROR: conntrackd cannot start, please check the logfile for more info

# tail /var/log/conntrackd.log
[...]
[Mon Aug  6 13:25:03 2007] (pid=5701) --- starting in console mode ---
[Mon Aug  6 13:25:03 2007] (pid=5701) [FAIL] can't open multicast
server!
[Mon Aug  6 13:25:03 2007] (pid=5701) [FAIL] initialization failed

So, I thought I may lack some options in the kernel. To sum it up:

CONFIG_IP_MULTICAST=y

CONFIG_NF_CONNTRACK_ENABLED=m

The doc says I need:
# nfnetlink
# ctnetlink (ip_conntrack_netlink) 

This would be nfnetlink (?):
CONFIG_NETFILTER_NETLINK=m
CONFIG_NETFILTER_NETLINK_QUEUE=m
CONFIG_NETFILTER_NETLINK_LOG=m

CONFIG_NF_CT_NETLINK=m
This produces nf_conntrack_netlink.o.
In 2.6.18 (RHEL5 source) upto 26.21.7 (vanilla) I find
CONFIG_IP_NF_CONNTRACK_NETLINK=m (which produces ip_conntack_netlink.o),
but in 2.6.22.1 it's not there. I don't see anything about this in the
changelog for 2.6.22 or 2.6.22.1: has this been replaced by
nf_conntrack_netlink.o?

About "connection tracking event notification API", I suppose it's this?
CONFIG_NF_CONNTRACK=m
CONFIG_NF_CONNTRACK_ENABLE=m
(CONFIG_NF_CONNTRACK_EVENTS=y)

I don't know where else to look and Google didn't exactly give me much.
Can someone please enlighten me what it is that I'm missing here?


Thanks,
Rob



