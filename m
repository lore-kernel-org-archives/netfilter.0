From: Rob Verduijn <rverduij@dds.nl>
Subject: logging and pinging localhost
Date: Thu, 07 Aug 2003 19:51:45 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1060278704.3499.8.camel@vimes.localdomain>
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

Hi there,

Im running iptables on redhat 9

I'm trying to figure out why some of my rules don't work and if they are
being dropped and if so by which rule.

First I tried to log everything with the following 2 lines

iptables -A INPUT -j LOG
iptables -A OUTPUT -j LOG

which gave me zilcho in my /var/log/messages

then I tried the following lines
$IPTABLES -A INPUT -i $EXTERNAL_INT -j LOG --log-level debug
$IPTABLES -A INPUT -i $INTERNAL_INT -j LOG --log-level debug
$IPTABLES -A INPUT -i lo -j LOG --log-level debug
$IPTABLES -A OUTPUT -o $EXTERNAL_INT -j LOG --log-level debug
$IPTABLES -A OUTPUT -o $INTERNAL_INT -j LOG --log-level debug
$IPTABLES -A OUTPUT -o lo -j LOG --log-level debug

IPTABLES=/sbin/iptables
EXTERNAL_INT=eth1
INTERNAL_INT=eth0

still zilcho logging

the log rules are the first lines in my script

the default policy that I set is drop
$IPTABLES -t filter -P INPUT DROP
$IPTABLES -t filter -P OUTPUT DROP
$IPTABLES -t filter -P FORWARD DROP
$IPTABLES -t nat -P PREROUTING DROP
$IPTABLES -t nat -P POSTROUTING DROP
$IPTABLES -t nat -P OUTPUT DROP
$IPTABLES -t mangle -P PREROUTING DROP
$IPTABLES -t mangle -P POSTROUTING DROP
$IPTABLES -t mangle -P INPUT DROP
$IPTABLES -t mangle -P OUTPUT DROP
$IPTABLES -t mangle -P FORWARD DROP

I also read that the following allows all the localtraffic
$IPTABLES -A INPUT  -i lo -j ACCEPT
$IPTABLES -A OUTPUT -o lo -j ACCEPT

but why can't I ping localhost?????

Please Help
Rob


