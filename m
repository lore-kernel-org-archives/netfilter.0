From: Frank <Frank@duranicub.sytes.net>
Subject: active Ftp Problems on different Port
Date: 30 Sep 2002 17:28:25 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1033406904.1239.3.camel@duranicub.duranicub.sytes.net>
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

Hi

i have an FTP Server on the Firewall Machine itself but listen to Port
21 and 210. For Port 21 active/passive Mode works fine, but for the Port
210 it works only with passive Mode. My Question is, how can i enable
active Mode for Port 210 ?

modprobe ip_nat_ftp ports=21,210
modprobe ip_conntrack_ftp ports=21,210
#
$IPTABLES -t filter -P INPUT DROP
$IPTABLES -t filter -P OUTPUT DROP
$IPTABLES -t filter -P FORWARD DROP
#
$IPTABLES -A INPUT -p tcp ! --syn -m state --state NEW,INVALID -j DROP
#
$IPTABLES -A INPUT  -i ppp0 -p tcp --sport 21 -m state --state
ESTABLISHED -j ACCEPT
$IPTABLES -A OUTPUT -o ppp0 -p tcp --dport 21 -m state --state
NEW,ESTABLISHED -j ACCEPT
$IPTABLES -A INPUT  -i ppp0 -p tcp --sport 20 -m state --state
ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A OUTPUT -o ppp0 -p tcp --dport 20 -m state --state
ESTABLISHED -j ACCEP
#
#
$IPTABLES -A INPUT -t filter -i ppp0 -p tcp --dport 21 -m state --state
NEW,ESTABLISHED -j ACCEPT
$IPTABLES -A OUTPUT -t filter -o ppp0 -p tcp --sport 21 -m state --state
ESTABLISHED,RELATED -j ACCEPT
#
$IPTABLES -A INPUT -t filter -i ppp0 -p tcp --dport 20 -m state --state
ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A OUTPUT -t filter -o ppp0 -p tcp --sport 20 -m state --state
NEW,ESTABLISHED -j ACCEPT
#

Any Suggestions what wrong here ?


Regards
Frank




