From: gypsy <gypsy@iswest.com>
Subject: Re: Passive FTP sees remote's _internal_ IP!!??
Date: Tue, 28 Nov 2006 01:14:33 -0800
Message-ID: <456BFDF9.AD6CEF5D@iswest.com>
References: <20061127184454.0BD73DB@brinstar.nerim.net>
	<456B57FA.5020000@plouf.fr.eu.org>
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

gypsy wrote:
> >>>When the default GW is set to the linux box (192.168.223.254) and
> >>>passive FTP to a remote server is initiated, the FTP fails after
> >>>connection because the internal IP of the remote machine (192.168.1.11)
> >>>is seen rather than its external IP.  This problem occurs only when
> >>>passive FTP is used.

We created a workaround for this by forcing all FTP to be active, not
passive.  We did this with jftpgw (
http://www.mcknight.de/jftpgw/jftpgw-0.13.5.tar.gz ) with a transparent
proxy setup.

This is the configuration:
#!/bin/sh

./configure \
"--prefix=/usr" \
"--sysconfdir=/etc" \
"--localstatedir=/var" \
"--enable-crypt" \
"--enable-libwrap" \
"--with-logpath=/var/log" \
"$@"

make all install

And the jftpgw.conf:
<global>
	serverport		21
	defaultmode		active
	debuglevel		8
	changeroot		never
	dropprivileges		startsetup
	runasuser		nobody
	loginstyle		0
	logintime		user
	commandtimeout		60
	dnslookups		no
	forwardlookups		no
	hostcachetimeout	28800
	initialsyst		yes
	reverselookups		no
	strictasciiconversion	on
	syslogfacility		daemon
	transfertimeout		120
	transparent-proxy	on
	welcomeline		.
</global>
<servertype standalone>
	listen			192.168.223.254:2370
	logstyle		files
	logfile			/var/log/jftpgw.log
	pidfile			/var/run/jftpgw.pid
</servertype>
<servertype inetd>
	logstyle		syslog
</servertype>
<from 0.0.0.0/0>
	access deny
</from>
<from 192.168.223.0/24>
	access allow
</from>

And the iptables line:
iptables -t nat -A PREROUTING -p tcp -s 192.168.223.0/24 --dport 21 -j
DNAT --to 192.168.223.254:2370

--
gypsy

