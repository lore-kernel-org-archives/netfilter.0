From: "P theodorou" <props666999@hotmail.com>
Subject: SSH fails on 22 - Restrictive rules
Date: Sun, 13 Nov 2005 22:44:50 +0000
Message-ID: <BAY102-F16251BBCA3EA823A8003A6AE5B0@phx.gbl>
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hello

i'm testing my SSH server from an external IP (my mate's pc)
and i've noticed than whenever i allow connections on eth0 with dport 22
i can see the username login page BUT, if apply the following rules

the  usual user name cannot be displayed

$IPTABLES -A TCPbad -p tcp --tcp-flags SYN,ACK SYN,ACK -m state --state NEW 
-j REJECT --reject-with tcp-reset
$IPTABLES -A TCPbad -p tcp ! --syn -m state --state NEW -j DROP # DROP NEW 
NOT SYN
$IPTABLES -A TCPbad -p tcp --tcp-flags SYN,FIN SYN,FIN -j DROP #DROP SYN-FIN 
SCANS
$IPTABLES -A TCPbad -p tcp --tcp-flags SYN,RST SYN,RST -j DROP #DROP SYN-RST 
SCANS
$IPTABLES -A TCPbad -p tcp --tcp-flags ALL FIN,URG,PSH -j DROP #DROP X-MAS 
SCANS
$IPTABLES -A TCPbad -p tcp --tcp-flags ALL FIN -j DROP #DROP NMAP FIN SCAN
$IPTABLES -A TCPbad -p tcp --tcp-flags ALL NONE -j DROP #DROP NULL SCANS
$IPTABLES -A TCPbad -p tcp --tcp-flags ALL ALL -j DROP #DROP ALL/ALL SCANS

any help very appreciated



