From: "hare ram" <hareram@sol.net.in>
Subject: Re: iptables+ulogd+mysql
Date: Thu, 14 Aug 2003 17:19:31 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <01bf01c3625a$21305460$c2bf09ca@Housecall>
References: <00a301c361a8$042772c0$c2bf09ca@Housecall> <1060855275.10220.2.camel@risingsun.penguindia.com>
Reply-To: "hare ram" <hareram@sol.net.in>
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
To: tkvishy@yahoo.com
Cc: netfilter@lists.samba.org

Hi

thanks for the quick reply
below is the config  what you asked for

----------------
[root@pdn root]# more /etc/ulogd.conf
# Example configuration for ulogd
# $Id: ulogd.conf,v 1.8 2002/07/30 07:15:54 laforge Exp $
#

######################################################################
# GLOBAL OPTIONS
######################################################################

# netlink multicast group (the same as the iptables --ulog-nlgroup param)
nlgroup 1

# logfile for status messages
logfile /var/log/ulogd.log

# loglevel: debug(1), info(3), notice(5), error(7) or fatal(8)
loglevel 5

# libipulog receive buffer size (should be at least the size of the
# in-kernel buffer (ipt_ULOG.o 'nlbufsiz' parameter)
bufsize 65535

######################################################################
# PLUGIN OPTIONS
######################################################################

# We have to configure and load all the plugins we want to use

# general rules:
# 1. specify the options FIRST, then load the plugin
# 2. interpreter plugins have to precede output plugins


#
# ulogd_BASE.so - interpreter plugin for basic IPv4 header fields
#                 you will always need this
plugin /usr/local/lib/ulogd/ulogd_BASE.so


#
# ulogd_LOGEMU.so - simple syslog emulation target
#
# where to write to
syslogfile /var/log/ulogd.syslogemu
# do we want to fflush() the file after each write?
syslogsync 1
# load the plugin
plugin /usr/local/lib/ulogd/ulogd_LOGEMU.so


#
# ulogd_OPRINT.so: file for packet dumping
#
# where to write the log
dumpfile /var/log/ulogd.pktlog
# load the plugin (remove the '#'if you want to enable it
plugin /usr/local/lib/ulogd/ulogd_OPRINT.so


#
# ulogd_MYSQL.so: optional logging into a MySQL database
#
# database information
mysqltable ulog
mysqlpass <password hided>
mysqluser root
mysqldb ulogd
mysqlhost localhost
# load the plugin (remove the '#' if you want to enable it)
plugin /usr/local/lib/ulogd/ulogd_MYSQL.so


#
# ulogd_PGSQL.so: optional logging into a PostgreSQL database
#
# database information
pgsqltable ulog
pgsqlpass
pgsqluser postgres
pgsqldb ulogd
pgsqlhost localhost
#load the plugin (remove the '#' if you want to enable it)
#plugin /usr/local/lib/ulogd/ulogd_PGSQL.so
-------


iptables -A FORWARD -j ULOG --ulog-nlgroup 1
iptables -A INPUT -j ULOG --ulog-nlgroup 1
iptables -A OUTPUT -j ULOG --ulog-nlgroup 1


[root@root]# iptables -xnvL
Chain INPUT (policy ACCEPT 10057 packets, 810117 bytes)
    pkts      bytes target     prot opt in     out     source
destination
     145     9238 ULOG       all  --  *      *       0.0.0.0/0
0.0.0.0/0          ULOG copy_range 0 nlgroup 1 queue_threshold 1

Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
    pkts      bytes target     prot opt in     out     source
destination
       0        0 ULOG       all  --  *      *       0.0.0.0/0
0.0.0.0/0          ULOG copy_range 0 nlgroup 1 queue_threshold 1

Chain OUTPUT (policy ACCEPT 2950 packets, 674578 bytes)
    pkts      bytes target     prot opt in     out     source
destination
      17     2092 ULOG       all  --  *      *       0.0.0.0/0
0.0.0.0/0          ULOG copy_range 0 nlgroup 1 queue_threshold 1




regards
hare




----- Original Message -----
From: "Vishwanatn T. K." <tkvishy@yahoo.com>
To: "hare ram" <hareram@sol.net.in>
Cc: <netfilter@lists.samba.org>
Sent: Thursday, August 14, 2003 3:31 PM
Subject: Re: iptables+ulogd+mysql


> On Wed, 2003-08-13 at 20:04, hare ram wrote:
> > Hi all
> >
> > iam working with iptables + ulogd sending data to mysql
> >
> > i have  RH 9.0
> > iptables 1.2.8
> > mysql 3.23
> >
> > and install ulogd-1.00
> >
> > iam able to compile and run the the ulogd deamon, but could not able to
log
> > any data to mysql
>
> can you provide the ulog config details with the iptables rule syntax
> used by you.
>
> vishwanath
>
>
>


