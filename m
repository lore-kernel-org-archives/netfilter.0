From: Ronny Fauth <jadefalkner@imperium-noctem.de>
Subject: Problems with Portforwarding
Date: Mon, 15 Mar 2004 22:48:18 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <405624A2.60906@imperium-noctem.de>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi there, i'm new on this list and i'm from germany, so excuse my english.
Well i have a problem, i have a router/gateway with Redhat 9 running on it
and i have 2 W2k Computers behind it. Now i want to forward some ports
to the Windows-Clients, i have tried some configurations but i still get 
the
"connection refused" error. Here the part of my script whitch belongs to 
the
port-forwarding.

---

$IPTABLES -t nat -A PREROUTING -j DNAT -p tcp -s 0/0 --dport 4711 -i 
ppp0 --to-destination 192.168.0.2:4711
$IPTABLES -A FORWARD --dport 4711 -j ACCEPT -m state --state 
NEW,ESTABLISHED,RELATED -p tcp -s 0/0 -d 192.168.0.2

$IPTABLES -t nat -A PREROUTING -j DNAT -p tcp -s 0/0 --dport 4712 -i 
ppp0 --to-destination 192.168.0.3:8080
$IPTABLES -A FORWARD --dport 8080 -j ACCEPT -m state --state 
NEW,ESTABLISHED,RELATED -p tcp -s 0/0 -d 192.168.0.3

---

don't know where the Problem is, so i hope you can help me,

thnx.

