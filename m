From: Payal Rathod <payalrathod@gmail.com>
Subject: LAN accessing DMZ
Date: Sun, 18 Jul 2004 18:53:53 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <f51b72bc040718062373640612@mail.gmail.com>
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
To: netfilter <netfilter@lists.netfilter.org>

Hi,
I am trying out DMZ. But my LAN users (192.168 range) can access DMZ 
(10.10.10.x) range without any restrictions. On this firewall machines
there are 3 cards 1 for DMZ range, 1 for LAN range  and for my ISP.

I have,
$IPTABLES -P INPUT DROP
$IPTABLES -P OUTPUT ACCEPT  # Is this a Bad Idea?
$IPTABLES -P FORWARD DROP

For FORWARD I allow just,
$IPTABLES -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A FORWARD -s 192.168.0.0/16 -p tcp --dport 3128 -j ACCEPT
$IPTABLES -A FORWARD -s 192.168.0.0/16 -p tcp --dport 53 -j ACCEPT
$IPTABLES -A FORWARD -s 192.168.0.0/16 -p udp --dport 53 -j ACCEPT

$IPTABLES -A FORWARD -s 10.0/8 -p tcp -j ACCEPT
$IPTABLES -A FORWARD -s 10.0/8 -p udp -j ACCEPT
$IPTABLES -A FORWARD -d 10.10.10.2 -p tcp --dport 25 -j ACCEPT
(This I am just testing whether  I can access my DMZ port 25 from outside)

But still my LAN users can access 10.10.10.2:25 and also the webin 10000 port.
What am I missing?

Thanks a lot in advance and waiting eagerly for any answers.

With warm regards,
-Payal

