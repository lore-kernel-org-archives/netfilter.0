From: Alejandro <sisdis@tournet.com.ar>
Subject: Short questions about NAT and FTP
Date: Thu, 13 Jul 2006 10:15:06 -0300
Message-ID: <44B6475A.70305@tournet.com.ar>
Reply-To: sisdis@tournet.com.ar
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
To: "Netfilter lista (iptables)" <netfilter@lists.netfilter.org>

Dear all,

I have two short question please:

1) Machine A from Internet accesses machine B from (web server) my DMZ
behind my linux/iptables, is it necessary to build a NAT rule from A to
B and from B to A, or just A to B is enough ???


2) I want my LAN users to access all FTP servers from Internet, and I
have loaded the ip_conntrack_ftp module.

Are this rules enough or do I have to specify something else (taking
into account FTP active and passive modes) ???

$IPTABLES -A FORWARD  -i eth0  -m state --state ESTABLISHED,RELATED  -j
ACCEPT

$IPTABLES -A FORWARD -p tcp -m tcp  -s 192.168.0.0  --dport 21  -m state
--state NEW  -j ACCEPT


Thanking in advance !!!!

Alejandro

