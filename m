From: Pablo Allietti <pablo@lacnic.net>
Subject: dnat work only for 5 minutes
Date: Mon, 31 Jan 2005 09:32:01 -0300
Message-ID: <20050131123201.GA27247@omega.lacnic.net.uy>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
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

hi all again.

i have this rules

iptables -A FORWARD -j ACCEPT -p tcp --dport 1350
iptables -t nat -A PREROUTING -i eth0 -p tcp -d 200.20.0.2 --dport
1350 -j DNAT  --to 192.168.1.79:22

iptables -A FORWARD -j ACCEPT -p tcp --dport 1351
iptables -t nat -A PREROUTING -i eth0 -p tcp -d 200.20.0.2 --dport
1351 -j DNAT  --to 192.168.1.143:22

iptables -A FORWARD -j ACCEPT -p tcp --dport 81
iptables -t nat -A PREROUTING -i eth0 -p tcp -d 200.20.0.2  --dport
4381 -j DNAT  --to 192.168.1.143:80


and the problem is that this rules work for a while and down.... i have
a port dnatting to ICMP and work very well, anybody can say me what
happend?

firewall 200.20.0.2 Fedora Core2
server 192.168.1.143 freebsd

thanks a lot.
-- 


--------------


