From: Pablo Allietti <pablo@lacnic.net>
Subject: dnat other problem
Date: Tue, 25 Jan 2005 15:49:25 -0300
Message-ID: <20050125184925.GB30422@omega.lacnic.net.uy>
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

i found the problem. i have 2 servers in the net 192.168.1.x




		internet
		|
		|200.20.0.12
		Firewall
		 192.168.1.1
		|
		|
		|
	----------------------
192.168.1.79                192.168.1.143



and i have this rules


$IPTABLES -A INPUT   -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A OUTPUT  -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A FORWARD -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -j ACCEPT -p tcp --dport 1248
iptables -t nat -A PREROUTING -i eth0 -p tcp  --dport 1248 -j DNAT --to
192.168.1.143:22

iptables -A FORWARD -j ACCEPT -p tcp --dport 1350
iptables -t nat -A PREROUTING -i eth1 -p tcp --dport 1350 -j DNAT --to
192.168.1.79:22


target     prot opt source               destination         
DNAT       tcp  --  anywhere             anywhere            tcp
dpt:1248 to:192.168.1.143:22 
DNAT       tcp  --  anywhere             anywhere            tcp
dpt:1350 to:192.168.1.79:22 
DNAT       icmp --  anywhere             anywhere
to:192.168.1.143 
DNAT       tcp  --  anywhere             anywhere            tcp
dpt:mysql to:192.168.1.143 


when i restart the firewall one dnat not working.

	if i connect first to port 1248
		ssh 200.20.0.12 -p 1248
	work good but port 1350 doesnt working.


	if i connect first to port 1350 1248 dont work. is really
extrange no ???  any help?

	
-- 


Pablo Allietti
LACNIC
--------------


