From: <sc2@gmx.at>
Subject: forward again
Date: Thu, 4 Dec 2003 13:21:53 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000f01c3ba61$3418f230$7cd36c50@anonymous>
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

hello
when i want forward ip > to > ip. (.51 > 58)
what i must do that it works? maybe a rule too on the destination adre to
reply with other source ip??
thx bye
--------------tables--------
echo "1" > /proc/sys/net/ipv4/ip_forward
iptables -I FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

iptables -F FORWARD
iptables -t nat -F


iptables -A FORWARD -p udp -d xx.xxx.xx.58 --dport 27021 -j ACCEPT
iptables -A PREROUTING -p udp -d xx.xxx.xx.51 --dport 27021 -j DNAT --to
62.116.24.58:27021
iptables -A FORWARD -p tcp -d xx.xxx.xx.58 --dport 27021 -j ACCEPT
iptables -A PREROUTING -p tcp -d xx.xxx.xx.51 --dport 27021 -j DNAT --to
xx.xxx.xx.58:27021



