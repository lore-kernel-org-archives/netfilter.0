From: "lartc@manchotnetworks.net" <lartc@manchotnetworks.net>
Subject: service iptables stop; hangs constantly on red hat 8
Date: 27 Oct 2003 14:48:42 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1067262522.6369.7.camel@drs0.manchotnetworks.net>
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
To: netfilter-users <netfilter@lists.netfilter.org>

hi all,

i have an up2date redhat 8 installation with iptables-1.2.8-8.80.2

as required by my setup, i insmod ip_conntrack_ftp and ip_nat_ftp to
handle connection tracking of ftp sessions.

if a connection has been established, and it becomes closed, or if there
is a current ftp session, "service iptables stop" hangs the machine
while trying to remove modules. here's an example, but it does not
necessairly hang on this module --


[root@aztec root]# ps -eaf | grep mod
root      1728  1672 99 14:39 pts/0    00:01:07 modprobe -r ip_nat_ftp
root      1952  1910  0 14:40 pts/1    00:00:00 grep mod

i have the belief that it is comming from ip_conntrack. in any case, i
can make it happen always (i.e. the system hang). processor time goes to
99% and a reboot is necessary.

has anyone else come accross this? is there something to be flushed
prior to removing the modules?

many thanks!

charles



