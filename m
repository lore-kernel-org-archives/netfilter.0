From: "nicolas boussekeyt" <nicolas.boussekeyt@free.fr>
Subject: Configure my firewall
Date: Wed, 17 Mar 2004 10:35:4 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040317093303.81268C194@postfix3-2.free.fr>
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
To: netfilter@lists.netfilter.org, netfilter@lists.netfilter.org

Hi, I want filter my firewall for raleka worm.

Actually, i have used :
iptables -A FORWARD -p tcp -i $EXTIF --dport 135 -j DROP
iptables -A FORWARD -p tcp -i $EXTIF --dport 135 -j LOG
iptables -A FORWARD -p udp -i $EXTIF --dport 135 -j DROP
iptables -A FORWARD -p udp -i $EXTIF --dport 135 -j LOG
iptables -A FORWARD -p tcp -i $EXTIF --dport 6667 -j DROP
iptables -A FORWARD -p tcp -i $EXTIF --dport 6667 -j LOG
iptables -A FORWARD -p udp -i $EXTIF --dport 6667 -j DROP
iptables -A FORWARD -p udp -i $EXTIF --dport 6667 -j LOG
iptables -A FORWARD -p tcp -i $EXTIF --dport 32767 -j DROP
iptables -A FORWARD -p tcp -i $EXTIF --dport 32767 -j LOG
iptables -A FORWARD -p udp -i $EXTIF --dport 32767 -j DROP
iptables -A FORWARD -p udp -i $EXTIF --dport 32767 -j LOG
iptables -A FORWARD -p tcp -i $EXTIF --dport 32768 -j DROP
iptables -A FORWARD -p tcp -i $EXTIF --dport 32768 -j LOG
iptables -A FORWARD -p udp -i $EXTIF --dport 32768 -j DROP
iptables -A FORWARD -p udp -i $EXTIF --dport 32768 -j LOG

But the worm is back.

Can you give me information.



