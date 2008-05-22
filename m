From: Pasi =?iso-8859-1?Q?K=E4rkk=E4inen?= <pasik@iki.fi>
Subject: Distros that can run conntrack-tools/conntrackd with the default kernel
Date: Thu, 22 May 2008 11:04:56 +0300
Message-ID: <20080522080456.GE8042@edu.joroinen.fi>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello list!

What distributions currently are able to run conntrack-tools with the
default/included kernel? Or even ship with conntrack-tools packaged/included..

Based on http://conntrack-tools.netfilter.org/install.html I think at least
Fedora 9 has the needed options enabled in the default kernel:

$ grep CONFIG_NF_CONNTRACK config-2.6.25-14.fc9.i686 
CONFIG_NF_CONNTRACK=m
CONFIG_NF_CONNTRACK_MARK=y
CONFIG_NF_CONNTRACK_SECMARK=y
CONFIG_NF_CONNTRACK_EVENTS=y
CONFIG_NF_CONNTRACK_AMANDA=m
CONFIG_NF_CONNTRACK_FTP=m
CONFIG_NF_CONNTRACK_H323=m
CONFIG_NF_CONNTRACK_IRC=m
CONFIG_NF_CONNTRACK_NETBIOS_NS=m
CONFIG_NF_CONNTRACK_PPTP=m
CONFIG_NF_CONNTRACK_SANE=m
CONFIG_NF_CONNTRACK_SIP=m
CONFIG_NF_CONNTRACK_TFTP=m
CONFIG_NF_CONNTRACK_IPV4=m
# CONFIG_NF_CONNTRACK_PROC_COMPAT is not set
CONFIG_NF_CONNTRACK_IPV6=m

$ grep CONFIG_NETFILTER_NETLINK config-2.6.25-14.fc9.i686 
CONFIG_NETFILTER_NETLINK=m
CONFIG_NETFILTER_NETLINK_QUEUE=m
CONFIG_NETFILTER_NETLINK_LOG=m

$ grep CONFIG_NF_CT_NETLINK config-2.6.25-14.fc9.i686 
CONFIG_NF_CT_NETLINK=m

$ grep CONFIG_NF_CONNTRACK_EVENTS config-2.6.25-14.fc9.i686 
CONFIG_NF_CONNTRACK_EVENTS=y



Checking out CentOS 5.1 / RHEL 5.1 doesn't look too promising.. 

$ grep CONFIG_NF_CONNTRACK config-2.6.18-53.el5

$ grep CONFIG_NETFILTER_NETLINK config-2.6.18-53.el5 
CONFIG_NETFILTER_NETLINK=m
CONFIG_NETFILTER_NETLINK_QUEUE=m
CONFIG_NETFILTER_NETLINK_LOG=m

$ grep CONFIG_NF_CT_NETLINK config-2.6.18-53.el5

$ grep CONFIG_NF_CONNTRACK_EVENTS config-2.6.18-53.el5


Is there any way to get conntrack-tools working with the default RHEL/CentOS 5.1
kernel? 

-- Pasi
