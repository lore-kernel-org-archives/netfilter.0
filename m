From: "Steve Melo" <smelo@communitytrust.ca>
Subject: ULOGD and invalid timestamps
Date: Thu, 9 Sep 2004 12:30:32 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <00cd01c4968a$53c10b30$3c01a8c0@tftpd>
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
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Greetings list,

I'm using the ulogd to log information and everything works great except
that everything that gets logged has a timestamp of "Dec 31 19:00:00".  I
would like to have the correct timestamp.

Here is my setup:
Debian Linux w/2.6.7-1-686 kernel (binary install)
ulogd Version 1.02
iptables v1.2.9

Here is my /etc/ulogd.conf:
# netlink multicast group (the same as the iptables --ulog-nlgroup param)
nlgroup 1

# logfile for status messages
logfile /var/log/ulog/ulogd.log

# loglevel: debug(1), info(3), notice(5), error(7) or fatal(8)
loglevel 5

# socket receive buffer size (should be at least the size of the
# in-kernel buffer (ipt_ULOG.o 'nlbufsiz' parameter)
rmem 131071

# libipulog/ulogd receive buffer size, should be > rmem
bufsize 150000

# ulogd_BASE.so - interpreter plugin for basic IPv4 header fields
#                 you will always need this
plugin /usr/lib/ulogd/ulogd_BASE.so
plugin /usr/lib/ulogd/ulogd_LOCAL.so


#
# ulogd_LOGEMU.so - simple syslog emulation target
#
# where to write to
syslogfile /var/log/ulog/syslogemu.log
# do we want to fflush() the file after each write?
syslogsync 1
# load the plugin
plugin /usr/lib/ulogd/ulogd_LOGEMU.so


#
# ulogd_OPRINT.so: file for packet dumping
#
# where to write the log
dumpfile /var/log/ulog/pktlog.log
# load the plugin (remove the '#'if you want to enable it
plugin /usr/lib/ulogd/ulogd_OPRINT.so


