From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: iptables rules to connect through a linux firewall
Date: Thu, 26 Jan 2006 22:45:21 +0100
Message-ID: <002701c622c1$ce7f9ca0$0101000a@sterenborg.info>
References: <9d5ddd1f0601261310j4892f2br8b411c801f2b3810@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <9d5ddd1f0601261310j4892f2br8b411c801f2b3810@mail.gmail.com>
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
To: netfilter@lists.netfilter.org

> I'm trying to connect a windows XP client to a remote pptp server. I'm
> using windows XP at home on my home network which connects to the
> internet via a fedora linux firewall using iptables with nat.
> 
> What iptables rules do I need to insert to allow this to happen. I
> guess I just need to forward packets.


$modprobe ip_nat_pptp  
$modprobe ip_nat_proto_gre
$modprobe ip_conntrack_pptp
$modprobe ip_conntrack_proto_gre

$ipt -P FORWARD DROP
$ipt -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
$ipt -A FORWARD -m state --state NEW -i <if_lan> -o <if_inet> \
  -s <net_lan> -p gre -j ACCEPT
$ipt -A FORWARD -m state --state NEW -i <if_lan> -o <if_inet> \
  -s <net_lan> -p tcp --dport 1723 -j ACCEPT

$ipt -t nat -A POSTROUTING -o <if_inet> -s <net_lan> \
  -j SNAT --to <inet_ip>

And don't forget to enable ip forwarding...


Gr,
Rob


