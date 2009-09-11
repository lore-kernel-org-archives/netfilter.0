From: Julien Vehent <julien@linuxwall.info>
Subject: SFQ hash question
Date: Fri, 11 Sep 2009 15:50:45 +0200
Message-ID: <0322d4853c39162f0819db9263a210ed@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter <netfilter@vger.kernel.org>

Hi there,

Since LARTC is down, I believe the best place to ask traffic control
questions is here.
I hope you guys won't mind...

I was reading the code of SFQ, and since I'm no C expert I don't
understand exactly on what the hash is computed:


-------
static unsigned sfq_hash(struct sfq_sched_data *q, struct sk_buff *skb)
{
	u32 h, h2;

	switch (skb->protocol) {
	case htons(ETH_P_IP):
	{
		const struct iphdr *iph = ip_hdr(skb);
		h = iph->daddr;
		h2 = iph->saddr ^ iph->protocol;
		if (!(iph->frag_off&htons(IP_MF|IP_OFFSET)) &&
		    (iph->protocol == IPPROTO_TCP ||
		     iph->protocol == IPPROTO_UDP ||
		     iph->protocol == IPPROTO_UDPLITE ||
		     iph->protocol == IPPROTO_SCTP ||
		     iph->protocol == IPPROTO_DCCP ||
		     iph->protocol == IPPROTO_ESP))
			h2 ^= *(((u32*)iph) + iph->ihl);
		break;
	}
------

OK for "h" and h2" before the "if", but what does this "if
(!(iph->frag_off&htons(IP_MF|IP_OFFSET))" really does?

And, also, I'm not sure about this: "h2 ^= *(((u32*)iph) + iph->ihl);"

Does it XOR h2 with the first 32 bits of the L4 protocol header ?


Thanks,
Julien

