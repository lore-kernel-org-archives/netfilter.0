From: Carlos Munoz <carlos@kenati.com>
Subject: Configuring iptables to allow tftp traffic on kernel 2.6.14
Date: Wed, 18 Jan 2006 15:42:45 -0800
Message-ID: <43CED275.4060804@kenati.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi all,

I hope this is the right forum for this question. I tried to search the 
archives but did not find a search function.

I'm trying to configure iptables to allow tftp traffic that originates 
from the linux box. I can tftp files as long as the policy for the INPUT 
chain is ACCEPT. Once, I enter the following rules, I can't tftp any files.

/carlos # uname -a
Linux carlos-npgateway 2.6.14.6-2.0.0-95 #4 Tue Jan 17 19:17:28 PST 2006 
armv5tejl unknown
/carlos #
/carlos #
/carlos # iptables -P INPUT DROP
/carlos # iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
/carlos #
/carlos #
/carlos # iptables -L
Chain INPUT (policy DROP)
target     prot opt source               destination
ACCEPT     all  --  anywhere             anywhere            state 
RELATED,ESTABLISHED

Chain FORWARD (policy DROP)
target     prot opt source               destination

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination

Chain NPFORWARDCHAIN (0 references)
target     prot opt source               destination

The connection tracking module for tftp is loaded:

/carlos # lsmod
Module                  Size  Used by
ip_nat_tftp             1920  0
ip_conntrack_tftp       4400  1 ip_nat_tftp
phone_mrvl            100852  2
phonedev                4224  3 phone_mrvl
/carlos #


Connection tracking reports the following connections:

/carlos # cat /proc/net/ip_conntrack
udp      17 24 src=192.168.1.75 dst=192.168.1.8 sport=3080 dport=69 
[UNREPLIED] src=192.168.1.8 dst=192.168.1.75 sport=69 dport=3080 use=1
/carlos #
/carlos #
/carlos # cat /proc/net/ip_conntrack_expect
292 proto=17 src=192.168.1.8 dst=192.168.1.75 sport=69 dport=3080
/carlos #

Does anyone know what I need to do to get this to work ? Thanks in 
advance for your help.


Carlos Munoz

