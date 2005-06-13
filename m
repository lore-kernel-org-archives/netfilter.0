From: Ulisses <ulisses.alonso@unavarra.es>
Subject: CONFIG_IP_NF_NAT_LOCAL and REDIRECT
Date: Mon, 13 Jun 2005 17:21:36 +0200
Message-ID: <20050613152136.GA434@s163m108.unavarra.es>
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


Hello

I'm trying to guess why the REDIRECT tarjet is not applied to local 
process having CONFIG_IP_NF_NAT_LOCAL enabled

Having the following rule

iptables -t nat -A OUTPUT --destination $HOSTB/32 --protocol udp --destination-port 123 \
         -j REDIRECT --to-ports $ABPORT


doesn't apply to local ip address, please note that I'm not referring to the loopback.

If the packet is sent form 127.0.0.1 works ok. I'm running kernel 2.6.9 vanilla

Any comment or suggestion will be greatly appreciated

Thanks in advance

	Ulisses
                Debian GNU/Linux: a dream come true
-----------------------------------------------------------------------------
"Computers are useless. They can only give answers."            Pablo Picasso

"Debugging is twice as hard as writing the code in the first place.
Therefore, if you write the code as cleverly as possible, you are,
by definition, not smart enough to debug it." - Brian W. Kernighan


