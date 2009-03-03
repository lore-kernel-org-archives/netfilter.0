From: dstorvik <dstorvik@consultech.net>
Subject: ULOGD:  suddenly not recording ANY connections
Date: Tue, 3 Mar 2009 10:56:09 -0500
Message-ID: <F5E47532014E8E45A339717AF42215342F2B942BC3@hild.consultech.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

I setup ULOGD and everything was working, log was rotating nightly, everything was good. A few weeks later ( after a reboot) it stopped working.  The ulogd.conf file shows it is starting correctly and showing no errors but there is nothing output to the file.   I have checked all the configs and they look fine and every time I start it, it shows that it is starting fine but not a single packet gets recorded. The box it is running on is running as a NAT firewall for a saturated 25 Mbit connection so there is plenty to log( hence the nightly rotation).
This is a fedora Core 9 System

Below is a copy of the once working conf file and the output of ulogd.log for a start of the daemon.  I only have one stack using ULOGEMU. Can anyone see why I would simply not get any output?

Thanks
  Derek


ulogd.conf

# Example configuration for ulogd
# $Id$
# Adapted to Debian by Achilleas Kotsis <achille@debian.gr>

[global]
######################################################################
# GLOBAL OPTIONS
######################################################################


# logfile for status messages
logfile="/var/log/ulogd.log"

# loglevel: debug(1), info(3), notice(5), error(7) or fatal(8)
loglevel=1

######################################################################
# PLUGIN OPTIONS
######################################################################

# We have to configure and load all the plugins we want to use

# general rules:
# 1. load the plugins _first_ from the global section # 2. options for each plugin in seperate section below


plugin="/usr/local/lib/ulogd/ulogd_inppkt_NFLOG.so"
#plugin="/usr/local/lib/ulogd/ulogd_inppkt_ULOG.so"
plugin="/usr/local/lib/ulogd/ulogd_inpflow_NFCT.so"
plugin="/usr/local/lib/ulogd/ulogd_filter_IFINDEX.so"
plugin="/usr/local/lib/ulogd/ulogd_filter_IP2STR.so"
plugin="/usr/local/lib/ulogd/ulogd_filter_IP2BIN.so"
plugin="/usr/local/lib/ulogd/ulogd_filter_PRINTPKT.so"
plugin="/usr/local/lib/ulogd/ulogd_filter_HWHDR.so"
plugin="/usr/local/lib/ulogd/ulogd_filter_PRINTFLOW.so"
#plugin="/usr/local/lib/ulogd/ulogd_filter_MARK.so"
plugin="/usr/local/lib/ulogd/ulogd_output_LOGEMU.so"
plugin="/usr/local/lib/ulogd/ulogd_output_SYSLOG.so"
plugin="/usr/local/lib/ulogd/ulogd_output_OPRINT.so"
#plugin="/usr/local/lib/ulogd/ulogd_output_NACCT.so"
#plugin="/usr/local/lib/ulogd/ulogd_output_PCAP.so"
#plugin="/usr/local/lib/ulogd/ulogd_output_PGSQL.so"
#plugin="/usr/local/lib/ulogd/ulogd_output_MYSQL.so"
#plugin="/usr/local/lib/ulogd/ulogd_output_DBI.so"
plugin="/usr/local/lib/ulogd/ulogd_raw2packet_BASE.so"


# this is a stack for flow-based logging via LOGEMU
stack=ct1:NFCT,ip2str1:IP2STR,print1:PRINTFLOW,emu1:LOGEMU


[ct1]
netlink_socket_buffer_size=2170880
netlink_socket_buffer_maxsize=10854400

[ct2]
#netlink_socket_buffer_size=217088
#netlink_socket_buffer_maxsize=1085440
hash_enable=0



[emu1]
file="/var/log/ulogd_syslogemu.log"
sync=1

[op1]
file="/var/log/ulogd_oprint.log"
sync=1

[pcap1]
sync=1


[sys2]
facility=LOG_LOCAL2

[nacct1]
sync = 1

[mark1]
mark = 1

###################################################################

ulogd.log

Mon Mar  2 14:35:15 2009 <5> ulogd.c:367 registering plugin `NFLOG'
Mon Mar  2 14:35:15 2009 <5> ulogd.c:367 registering plugin `NFCT'
Mon Mar  2 14:35:15 2009 <5> ulogd.c:367 registering plugin `IFINDEX'
Mon Mar  2 14:35:15 2009 <5> ulogd.c:367 registering plugin `IP2STR'
Mon Mar  2 14:35:15 2009 <5> ulogd.c:367 registering plugin `IP2BIN'
Mon Mar  2 14:35:15 2009 <5> ulogd.c:367 registering plugin `PRINTPKT'
Mon Mar  2 14:35:15 2009 <5> ulogd.c:367 registering plugin `HWHDR'
Mon Mar  2 14:35:15 2009 <5> ulogd.c:367 registering plugin `PRINTFLOW'
Mon Mar  2 14:35:15 2009 <5> ulogd.c:367 registering plugin `LOGEMU'
Mon Mar  2 14:35:15 2009 <5> ulogd.c:367 registering plugin `SYSLOG'
Mon Mar  2 14:35:15 2009 <5> ulogd.c:367 registering plugin `OPRINT'
Mon Mar  2 14:35:15 2009 <5> ulogd.c:367 registering plugin `BASE'
Mon Mar  2 14:35:15 2009 <1> ulogd.c:795 building new pluginstance stack (ct1:NFCT,ip2str1:IP2STR,print1:PRINTFLOW,emu1:LOGEMU):
Mon Mar  2 14:35:15 2009 <1> ulogd.c:804 tok=`ct1:NFCT'
Mon Mar  2 14:35:15 2009 <1> ulogd.c:840 pushing `NFCT' on stack
Mon Mar  2 14:35:15 2009 <1> ulogd.c:804 tok=`ip2str1:IP2STR'
Mon Mar  2 14:35:15 2009 <1> ulogd.c:840 pushing `IP2STR' on stack
Mon Mar  2 14:35:15 2009 <1> ulogd.c:804 tok=`print1:PRINTFLOW'
Mon Mar  2 14:35:15 2009 <1> ulogd.c:840 pushing `PRINTFLOW' on stack
Mon Mar  2 14:35:15 2009 <1> ulogd.c:804 tok=`emu1:LOGEMU'
Mon Mar  2 14:35:15 2009 <1> ulogd.c:840 pushing `LOGEMU' on stack
Mon Mar  2 14:35:15 2009 <1> ulogd.c:634 connecting input/output keys of stack:
Mon Mar  2 14:35:15 2009 <1> ulogd.c:642 traversing plugin `LOGEMU'
Mon Mar  2 14:35:15 2009 <1> ulogd_output_LOGEMU.c:183 parsing config file section emu1
Mon Mar  2 14:35:15 2009 <1> ulogd.c:617 print1(PRINTFLOW)
Mon Mar  2 14:35:15 2009 <1> ulogd.c:717 assigning `print(?)' as source for LOGEMU(print)
Mon Mar  2 14:35:15 2009 <1> ulogd.c:642 traversing plugin `PRINTFLOW'
Mon Mar  2 14:35:15 2009 <1> ulogd.c:617 ip2str1(IP2STR)
Mon Mar  2 14:35:15 2009 <1> ulogd.c:717 assigning `orig.ip.saddr.str(?)' as source for PRINTFLOW(orig.ip.saddr.str)
Mon Mar  2 14:35:15 2009 <1> ulogd.c:617 ip2str1(IP2STR)
Mon Mar  2 14:35:15 2009 <1> ulogd.c:717 assigning `orig.ip.daddr.str(?)' as source for PRINTFLOW(orig.ip.daddr.str)
Mon Mar  2 14:35:15 2009 <1> ulogd.c:617 ct1(NFCT)
Mon Mar  2 14:35:15 2009 <1> ulogd.c:717 assigning `orig.ip.protocol(?)' as source for PRINTFLOW(orig.ip.protocol)
Mon Mar  2 14:35:15 2009 <1> ulogd.c:617 ct1(NFCT)
Mon Mar  2 14:35:15 2009 <1> ulogd.c:717 assigning `orig.l4.sport(?)' as source for PRINTFLOW(orig.l4.sport)
Mon Mar  2 14:35:15 2009 <1> ulogd.c:617 ct1(NFCT)
Mon Mar  2 14:35:15 2009 <1> ulogd.c:717 assigning `orig.l4.dport(?)' as source for PRINTFLOW(orig.l4.dport)
Mon Mar  2 14:35:15 2009 <1> ulogd.c:617 ct1(NFCT)
Mon Mar  2 14:35:15 2009 <1> ulogd.c:717 assigning `orig.raw.pktlen(?)' as source for PRINTFLOW(orig.raw.pktlen)
Mon Mar  2 14:35:15 2009 <1> ulogd.c:617 ct1(NFCT)
Mon Mar  2 14:35:15 2009 <1> ulogd.c:717 assigning `orig.raw.pktcount(?)' as source for PRINTFLOW(orig.raw.pktcount)
Mon Mar  2 14:35:15 2009 <1> ulogd.c:617 ip2str1(IP2STR)
Mon Mar  2 14:35:15 2009 <1> ulogd.c:717 assigning `reply.ip.saddr.str(?)' as source for PRINTFLOW(reply.ip.saddr.str)
Mon Mar  2 14:35:15 2009 <1> ulogd.c:617 ip2str1(IP2STR)
Mon Mar  2 14:35:15 2009 <1> ulogd.c:717 assigning `reply.ip.daddr.str(?)' as source for PRINTFLOW(reply.ip.daddr.str)
Mon Mar  2 14:35:15 2009 <1> ulogd.c:617 ct1(NFCT)
Mon Mar  2 14:35:15 2009 <1> ulogd.c:717 assigning `reply.ip.protocol(?)' as source for PRINTFLOW(reply.ip.protocol)
Mon Mar  2 14:35:15 2009 <1> ulogd.c:617 ct1(NFCT)
Mon Mar  2 14:35:15 2009 <1> ulogd.c:717 assigning `reply.l4.sport(?)' as source for PRINTFLOW(reply.l4.sport)
Mon Mar  2 14:35:15 2009 <1> ulogd.c:617 ct1(NFCT)
Mon Mar  2 14:35:15 2009 <1> ulogd.c:717 assigning `reply.l4.dport(?)' as source for PRINTFLOW(reply.l4.dport)
Mon Mar  2 14:35:15 2009 <1> ulogd.c:617 ct1(NFCT)
Mon Mar  2 14:35:15 2009 <1> ulogd.c:717 assigning `reply.raw.pktlen(?)' as source for PRINTFLOW(reply.raw.pktlen)
Mon Mar  2 14:35:15 2009 <1> ulogd.c:617 ct1(NFCT)
Mon Mar  2 14:35:15 2009 <1> ulogd.c:717 assigning `reply.raw.pktcount(?)' as source for PRINTFLOW(reply.raw.pktcount)
Mon Mar  2 14:35:15 2009 <1> ulogd.c:617 ct1(NFCT)
Mon Mar  2 14:35:15 2009 <1> ulogd.c:717 assigning `icmp.code(?)' as source for PRINTFLOW(icmp.code)
Mon Mar  2 14:35:15 2009 <1> ulogd.c:617 ct1(NFCT)
Mon Mar  2 14:35:15 2009 <1> ulogd.c:717 assigning `icmp.type(?)' as source for PRINTFLOW(icmp.type)
Mon Mar  2 14:35:15 2009 <1> ulogd.c:617 ct1(NFCT)
Mon Mar  2 14:35:15 2009 <1> ulogd.c:717 assigning `ct.event(?)' as source for PRINTFLOW(ct.event)
Mon Mar  2 14:35:15 2009 <1> ulogd.c:642 traversing plugin `IP2STR'
Mon Mar  2 14:35:15 2009 <1> ulogd.c:617 ct1(NFCT)
Mon Mar  2 14:35:15 2009 <1> ulogd.c:717 assigning `oob.family(?)' as source for IP2STR(oob.family)
Mon Mar  2 14:35:15 2009 <1> ulogd.c:617 ct1(NFCT)
Mon Mar  2 14:35:15 2009 <1> ulogd.c:717 assigning `oob.protocol(?)' as source for IP2STR(oob.protocol)
Mon Mar  2 14:35:15 2009 <1> ulogd.c:617 ct1(NFCT)
Mon Mar  2 14:35:15 2009 <1> ulogd.c:717 assigning `orig.ip.saddr(?)' as source for IP2STR(orig.ip.saddr)
Mon Mar  2 14:35:15 2009 <1> ulogd.c:617 ct1(NFCT)
Mon Mar  2 14:35:15 2009 <1> ulogd.c:717 assigning `orig.ip.daddr(?)' as source for IP2STR(orig.ip.daddr)
Mon Mar  2 14:35:15 2009 <1> ulogd.c:617 ct1(NFCT)
Mon Mar  2 14:35:15 2009 <1> ulogd.c:717 assigning `reply.ip.saddr(?)' as source for IP2STR(reply.ip.saddr)
Mon Mar  2 14:35:15 2009 <1> ulogd.c:617 ct1(NFCT)
Mon Mar  2 14:35:15 2009 <1> ulogd.c:717 assigning `reply.ip.daddr(?)' as source for IP2STR(reply.ip.daddr)
Mon Mar  2 14:35:15 2009 <1> ulogd.c:642 traversing plugin `NFCT'
Mon Mar  2 14:35:15 2009 <5> ulogd_inpflow_NFCT.c:838 NFCT netlink buffer size has been set to 4341760
Mon Mar  2 14:35:15 2009 <1> ulogd_output_LOGEMU.c:142 starting logemu
Mon Mar  2 14:35:15 2009 <1> ulogd_output_LOGEMU.c:148 opening file: /var/log/ulogd_syslogemu.log
Mon Mar  2 14:35:15 2009 <3> ulogd.c:1220 initialization finished, entering main loop




