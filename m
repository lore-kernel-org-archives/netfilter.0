From: Valentijn Sessink <valentyn+netfilter-users@nospam.openoffice.nl>
Subject: more IPsec NAT troubles
Date: Sat, 31 Jan 2004 18:52:45 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040131175245.GA21239@openoffice.nl>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hello list,

As a side note, but relevant in the light of the recent IPsec/NAT
interoperability, I found another bug in the IPsec implementation.

2.6 + IPsec causes problems for connections that need fragmentation. My
setup:

desktop			masq'ing $router
2.4.24+ipsec	          2.6.1
10.x.y.25--------10.x.y.1 MASQ a.b.c.d ---> Internet

Now if a packet from the Internet larger than 1444 bytes arrives (which is
perfectly legal), $router will send the rather odd response "icmp
a.b.c.d unreachable, need to frag (1444 bytes)". So you get the $router tell
that $router is unreachable when a packet reaches the $router.

ip_output.c says:

        if (skb->len > mtu) {
                icmp_send(skb, ICMP_DEST_UNREACH, ICMP_FRAG_NEEDED, htonl(mtu));
                ret = -EMSGSIZE;

So if I understand this correctly, the IPsec tunnel relies on the end to end
MTU detection and simply drops packets when they're too large to
encapsulate. However, in a masq'ing/IPsec combination, this won't work, as
there is no "end to end". The fragmentation is needed for a local process
(namely after de-masq'ing the packet when the kernel finds out it needs to
encrypt the packet) and I think the FRAG_NEEDED is illegal here.

I sent this to linux-net where it's probably more appropriate. (I hope my
e-mail reaches the list, as anti spam measures here and there are starting
to prevent any communication)

V.
-- 
http://www.openoffice.nl/   Open Office - Linux Office Solutions
Valentijn Sessink  valentyn+sessink@nospam.openoffice.nl

