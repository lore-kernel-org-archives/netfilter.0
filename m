From: Ola Nilsson <ola@fam-nilsson.org>
Subject: Re: IPSec through my firewall (SOLVED!!)
Date: Sun, 20 Feb 2005 09:23:37 +0100
Message-ID: <877jl3wsfq.fsf@helmut.nilsson.homedns.org>
Mime-Version: 1.0
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

"Samuel Jean" <sj-netfilter@cookinglinux.org> writes:

> On Wed, February 16, 2005 7:46 am, Ola Nilsson said:
>> So, going back to my initial question; How can I go about finding out
>> where my packets are droped? Since it's most likelly not because of
>> any netfilter rule entry, who else can decide that a packet can not be
>> NATed?
>
> Sorry, I haven't followed the thread at all.
>
> To answer this question, some malformed, suspicious packets can be dropped
> by the netfilter code itself, and even the networking code.

First, a big thanks to Samuel for that reply. It got me started
debugging the issue. Drop-table didn't help me though. After making a
lame effort to port it to 2.6.10, the kernel compiled ok, but iptables
did not. However, it gave me directions where to look.

Yesterday I could conclude that the packets where dropped here:

code from ip_nat_standalone.c line 92, function ip_nat_fn():

	ct = ip_conntrack_get(*pskb, &ctinfo);
	/* Can't track?  It's not due to stress, or conntrack would
	   have dropped it.  Hence it's the user's responsibilty to
	   packet filter it out, or implement conntrack/NAT for that
	   protocol. 8) --RR */
	if (!ct) {
		/* Exception: ICMP redirect to new connection (not in
                   hash table yet).  We must not let this through, in
                   case we're doing NAT to the same network. */
		if ((*pskb)->nh.iph->protocol == IPPROTO_ICMP) {
			struct icmphdr _hdr, *hp;

			hp = skb_header_pointer(*pskb,
						(*pskb)->nh.iph->ihl*4,
						sizeof(_hdr), &_hdr);
			if (hp != NULL &&
			    hp->type == ICMP_REDIRECT)
				return NF_DROP;
		}
		return NF_ACCEPT;
	}

So since connection tracking didn't recognize the ESPinUDP packets,
they where never routed by ip_nat_fn().

The ESPinUDP packets where seen as bad packets by
ip_conntrack_proto_udp.c on line 105 function udp_error():

	/* Truncated/malformed packets */
	if (ntohs(hdr->len) > udplen || ntohs(hdr->len) < sizeof(*hdr)) {
		if (LOG_INVALID(IPPROTO_UDP))
			nf_log_packet(PF_INET, 0, skb, NULL, NULL, 
				  "ip_ct_udp: truncated/malformed packet ");
		return -NF_ACCEPT;
	}

By removing this code from udp_error() I can successfully connect my
IPSec tunnel.

Now, what would be the correct fix? To write a new connection tracking
module that handles the ESPinUDP packets? Or can the code in
udp_error() be changed in some safe way? I'm new to the netfilter
code, so I might need some advice.

For now I'm happy since with all your help, I now have a IPSec tunnel
:-)

Regards,
-- 
/Ola Nilsson


