From: alan@gravity-cs.com
Subject: mangling netfilter extension and PMTU discovery question
Date: Wed, 23 Oct 2002 14:18:30 +0200 (IST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0210231406280.14013-100000@localhost.localdomain>
Mime-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

hi,

i'm writing a target iptables extension, which adds data to packets on 
PREROUTING and OUTPUT chains of mangle table
as the target adds data to a packet, i need to reduce originating stack MTU
to avoid fragmentation.
i'm doing this by issuing an icmp ICMP_FRAG_NEEDED request from the target:

if ( (add_len + skb->len > ETH_MTU) && (ntohs(iph->frag_off) == IP_DF)){
	icmp_send(skb, ICMP_DEST_UNREACH, ICMP_FRAG_NEEDED, htonl(NEW_MTU));
	return NF_DROP;
}

this works perfectly with packets routed through the box (in PREROUTING chain),
however with local packets (OUTPUT chain) i get strange behaviour:

MTU is reduced, i start multiple SSH/FTP/HTTP connections using new MTU,
however when first connection ends, other connections opened during that time
get stuck, as if ACKs for data transfer are never delivered.

i'm using RH7.3 with vanilla 2.4.18-3 and iptables 1.2.5

ideas anyone?

--alan.










