From: Thomas Boernert <tb@tbits.net>
Subject: ip_conntrack_ftp doesn't work with ftp proxy
Date: 13 Nov 2002 22:55:18 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1037224518.1192.29.camel@miraculix>
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
To: netfilter@lists.netfilter.org

Hello,

i hope anyone can help me.

network-chart

linuxbox ----- firewall ---- internet

on the firewall runs a ftp proxy (suse proxy-suite on port 8082)
i've the following rules

iptables -A INPUT -p tcp -s $local_net --sport 1024:65535 -d
$firewall_internal_ip --dport 8082 -m state --state NEW,ESTABLISHED -j
ACCEPT

ipatbles -A OUTPUT -p tcp -s $firewall_internal_ip --sport 8082 -d
$local_net --dport 1024:65535 -m state --state ESTABLISHED -j ACCEPT

iptables -A INPUT -p tcp -s $local_net --sport 1024:65535 -d
$firewall_internal_ip --dport 1024:65535 -m state ESTABLISHED,RELATED

.....

from the client i do the following

ftp ip_firewall 8082
login to a ftp server like redhat or so
do "ls"
then the kernel rejects the third rule written upper.

if i change the rule from RELATED to NEW, the it's working, but this
is not a solution.

Thanks for help!

- Thomas



