From: Ludger Zachewitz <ludger.z@gmx.de>
Subject: iptables and port 25
Date: Wed, 11 May 2005 16:10:58 +0200
Message-ID: <6.2.1.2.0.20050511160801.01e6e430@domino.offis.uni-oldenburg.de>
Mime-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi,

I have a problem with my firewall using iptables. All works fine except 
port 25.
I am using SuseLinux 9.1, the interface to the internet is ppp0 and one of 
the rules
I defined to log the access over port 25 is

/usr/sbin/iptables -A INPUT -p TCP  -i ppp0 --dport X -j LOG --log-prefix 
"[smtpd-access] "
/usr/sbin/iptables -A INPUT -p TCP  -i ppp0 --dport X -j ACCEPT

But I can't connect to port 25 by telnet, for example by the command 
"telnet my.domain.de 25"
from a remote host. In contrast emails will pass through the server.

Here is the log of  the command "iptables -nL":

Chain INPUT (policy DROP)
target     prot opt source               destination
ACCEPT     icmp --  0.0.0.0/0            0.0.0.0/0           icmp type 3
ACCEPT     icmp --  0.0.0.0/0            0.0.0.0/0           icmp type 8 
limit: avg 1/sec burst 5
ACCEPT     icmp --  0.0.0.0/0            0.0.0.0/0           icmp type 0
LOG        tcp  --  0.0.0.0/0            0.0.0.0/0           tcp dpt:22 
state NEW LOG flags 0 level 4 prefix `[ssh-access] '
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp dpt:22 
limit: avg 1/sec burst 5 state NEW
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp spt:22
LOG        tcp  --  0.0.0.0/0            0.0.0.0/0           tcp dpt:23 
state NEW LOG flags 0 level 4 prefix `[telnet-access] '
LOG        tcp  --  0.0.0.0/0            0.0.0.0/0           tcp dpt:25 LOG 
flags 0 level 4 prefix `[smtpd-access] '
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp dpt:25
ACCEPT     udp  --  217.237.149.161      0.0.0.0/0           udp spt:53
ACCEPT     udp  --  217.237.151.225      0.0.0.0/0           udp spt:53
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp dpt:80
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp spt:80
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp dpt:443
ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0
ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0
ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0           state 
RELATED,ESTABLISHED
my_drop_debug  all  --  0.0.0.0/0            0.0.0.0/0

Chain FORWARD (policy DROP)
target     prot opt source               destination
TCPMSS     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp 
flags:0x06/0x02 TCPMSS clamp to PMTU
ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0           state 
RELATED,ESTABLISHED
ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0           state NEW
my_drop_debug  all  --  0.0.0.0/0            0.0.0.0/0

Chain OUTPUT (policy DROP)
target     prot opt source               destination
ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0

Chain my_drop (0 references)
target     prot opt source               destination
DROP       all  --  0.0.0.0/0            0.0.0.0/0

Chain my_drop_debug (2 references)
target     prot opt source               destination
LOG        icmp --  0.0.0.0/0            0.0.0.0/0           LOG flags 0 
level 4 prefix `DROP-ICMP '
LOG        udp  --  0.0.0.0/0            0.0.0.0/0           LOG flags 0 
level 4 prefix `DROP-UDP '
LOG        tcp  --  0.0.0.0/0            0.0.0.0/0           LOG flags 0 
level 4 prefix `DROP-TCP '
DROP       all  --  0.0.0.0/0            0.0.0.0/0


In addition I have already used tcpdump to search for the error. On the 
host X    I have executed
the following commands:

"telnet my.domain.de 24"
"telnet my.domain.de 25"
"telnet my.domain.de 26"

Before, I have executed the command "tcpdump -i ppp0 dst host my.domain.de 
and host X"  on
the host "my.domain.de". The results of the command are:

12:07:02.059587 IP X.48985 > my.domain.de.24: S 1047882620:1047882620(0) 
win 5840 <mss 1460,sackOK,timestamp 319295859 0,nop,wscale 0>
12:07:31.167614 IP X.48987 > my.domain.de.26: S 1064293298:1064293298(0) 
win 5840 <mss 1460,sackOK,timestamp 319296869 0,nop,wscale 0>

Again there is no log of any connection or traffic to port 25.
I don't understand why. Could anyone help, please?

Thanks,
Ludger.


