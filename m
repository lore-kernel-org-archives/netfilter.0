From: "Giacomo" <delleceste@gmail.com>
Subject: thanks jozsef!
Date: Mon, 12 Sep 2005 20:15:33 +0200
Message-ID: <006701c5b7c5$f9e03d30$0300a8c0@giacomino>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: netfilter lists <netfilter@lists.netfilter.org>

Thanks a lot Jozsef  for your answer to the news about my question about a 
conntrack
comment on tcp window.

The precious hint you gave me is that i don't need to play with seq/ack!

So, if i understood well, i don't need to worry about window sizes as well,
to do simple nat...

I was quite sure about those things, but the problem is that my nat works
fine if i call an Internet Service Provider,
but if I call another one, web sites and images are corrupted and things
don't work well...

i tried to lower mtu, and tried with the rule "clamp-tcpmss-to-pmtu", but
did not solve.
Then i tried to see if packets arrived fragmented and so lost in nat, but a
printk put in netfilter code,
wher defrag takes place, revealed that packets were not fragmented.

Now i'm quite desperate, cause i don't know where to look for an answer!
Could it be that i use bad functions to recalculate checksum? But why with
an ISP that works
while with the other not?
I use ip_fast_csum() for ip, and

tcp_v4_check(transport_header, skb->len-4*iph->ihl, saddr, daddr,
csum_partial( transp_header, skb->len-4*iph->ihl, 0) )

for tcp/udp chacksum.

tcpdump always says it's correct.

Thanks for your help and any other suggestions!
best regards,

Giacomo S, Italy




