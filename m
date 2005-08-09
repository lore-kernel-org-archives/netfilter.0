From: John Lange <john.lange@open-it.ca>
Subject: What is ACK PSH FIN and why is it blocked?
Date: Tue, 09 Aug 2005 10:21:35 -0500
Message-ID: <1123600895.17896.40.camel@ws50.darkcore.net>
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
To: netfilter <netfilter@lists.netfilter.org>

I get quite a number of packets dropped as follows; This is packet from
my web server to a given host:

Aug  8 01:20:12 venus kernel: IN= OUT=eth0 SRC=<myServerIP>
DST=<someHost> LEN=471 TOS=0x00 PREC=0x00 TTL=64 ID=13332 DF PROTO=TCP
SPT=80 DPT=10067 WINDOW=1716 RES=0x00 ACK PSH FIN URGP=0

Here is an abbreviated version of the iptables ruleset which is in
place:

iptables -P FORWARD DROP
iptables -P INPUT DROP
iptables -P OUTPUT DROP

iptables -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A OUTPUT -m state --state NEW -p tcp --sport 80 -j ACCEPT

iptables -A OUTPUT -p any -j LOG

# Allow incoming data that is part of a connection we established
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
# www server
iptables -A INPUT -p tcp --syn --dport 80 -j ACCEPT
iptables -A INPUT -p tcp --syn --dport 443 -j ACCEPT

iptables -A INPUT -p any -j LOG

So what is a packet with "ACK PSH FIN" set? I assume they are being
blocked because they are neither "SYN" nor part of an established
connection? But what are they and should they be allowed?

-- 
John Lange


