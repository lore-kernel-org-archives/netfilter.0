From: "Asim Ejaz Butt" <asim.butt@streaming-networks.com>
Subject: MSN and Yahoo Block through IPTABLES
Date: Wed, 25 Jun 2003 15:23:37 +0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <010a01c33b03$d78da1f0$5505a8c0@asimejaz>
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

Hello Gurus,

I am trying to block MSN and Yahoo Instant Messengers with my LAN using
IPTABLES. Following commands are used to block them but unsuccessful.

 /sbin/iptables -A FORWARD -p tcp -s 192.168.5.85 --dport 1863 -j REJECT
 /sbin/iptables -A FORWARD -p tcp -s 192.168.5.85 -d 64.4.0.0/18 -j REJECT

 /sbin/iptables -A FORWARD -d cs.yahoo.com -j REJECT
 /sbin/iptables -A FORWARD -d scsa.yahoo.com -j REJECT

Anyone help in blocking them through IPTABLES.

Asim Ejaz Butt
asim.butt@streaming-networks.com


