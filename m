From: =?ISO-8859-15?Q?Sven_K=F6hler?= <skoehler@upb.de>
Subject: PPTP server behind NAT
Date: Tue, 30 Sep 2003 03:35:14 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <blamm8$bvm$1@sea.gmane.org>
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

Hi,

i'm not using the pptp-conntrack patch yet. So i tried to forward port 
1723 and protocol 47 to the target machine. That's is what should work - 
but it didn't.

A tcpdump revealed that my Linux box rejected the GRE packets with "icmp 
protocol 47 unreachable" packets. What did i do wrong?

I turned of my whole firewall and flushed all tables.
The rules

iptables -t nat -A PREROUTING -p tcp --dp 1723 -j DNAT --to <ip>
iptables -t nat -A PREROUTING -p 47 -j DNAT --to <ip>

simply didn't work.
My Linux box keeps sending the icmp packets.

Does anybody know why it does that?

Thx
   Sven



