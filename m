From: Pablo Allietti <pablo@lacnic.net>
Subject: dnat ouside/inside
Date: Tue, 1 Feb 2005 16:32:25 -0200
Message-ID: <20050201183225.GA5042@micron.lacnic.net.uy>
Mime-Version: 1.0
Content-Disposition: inline
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

hi all. i have this problem. this dnat rules work perfectly from outside
networks example . from a cybercafe, my home and all of outside network.

but when i connect my computer insede the lan 192.168.1.x this rules
dont working is any way to use this rules in the same network?


iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 110  -j DNAT
--to-destination 192.168.1.143
iptables -A FORWARD -i eth1 -o eth0 -p tcp -s 0/0 -d 192.168.1.143
--dport 110  -j ACCEPT
iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 25  -j DNAT
--to-destination 192.168.1.143
iptables -A FORWARD -i eth1 -o eth0 -p tcp -s 0/0 -d 192.168.1.143
--dport 25  -j ACCEPT
iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 995  -j DNAT
--to-destination 192.168.1.143
iptables -A FORWARD -i eth1 -o eth0 -p tcp -s 0/0 -d 192.168.1.143
--dport 995  -j ACCEPT
iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 465  -j DNAT
--to-destination 192.168.1.143
iptables -A FORWARD -i eth1 -o eth0 -p tcp -s 0/0 -d 192.168.1.143
--dport 465  -j ACCEPT





			200.0.20.2
			    |
			    |
			Firewall
			192.168.1.143
			    |
			    |
   -----------------------------------------------
		clients 192.168.1.x


