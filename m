From: <sc2@gmx.at>
Subject: Forwarding help
Date: Wed, 26 Nov 2003 23:03:14 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000701c3b469$17203ba0$14d36c50@anonymous>
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
i use iptables .7, but it does not work (forward) , any ideas?
thank you , 
ps: same rules down i have make for tcp match not only for udp

echo "1" > /proc/sys/net/ipv4/ip_forward
iptables -F FORWARD
iptables -t nat -F
iptables -A FORWARD -j LOG
iptables -A FORWARD -p udp -d ip --dport port -j ACCEPT
iptables -t nat -A PREROUTING -p udp -d ip --dport port -j DNAT --to 
ip:port


