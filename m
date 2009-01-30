From: wlet@gmx.net
Subject: Connectiontracking of IPv6 on modified Fritzbox
Date: Fri, 30 Jan 2009 14:23:42 +0100
Message-ID: <20090130132342.207450@gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org

Hello,

I'm using a SOHO router called Fritzbox. This box is very popular in germany and is based upon busybox/linux.

There is a gnu project called "Freetz" which provides a patchset to enhance the capabilities of this box.

I'm using the last svn snapshot which contains IPv6 support via sixxs.net. The kernel running on this box is "2.6.13.1-ohio" (MIPS).

I want to use ip6tables to restrict the v6 traffic, but there is no possibility to do a connection tracking/stateful filtering. 
These are the ip6tables modules availible:
ip6_queue.ko
ip6_tables.ko
ip6t_LOG.ko
ip6t_MARK.ko
ip6t_dst.ko
ip6t_ipv6header.ko
ip6t_length.ko
ip6t_limit.ko
ip6t_mark.ko
ip6t_rt.ko
ip6table_filter.ko
ip6table_raw.ko

x_tables are also not availible. Somebody at the Freetz Forum stated, that the kernel should be able to handle connectiontracking, but I don't know how.

Anybody here with a neat little hint?

thankyou

wlet
