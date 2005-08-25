From: Tien-Ren Chen <trchen1033@gmail.com>
Subject: Re: Problem with conntrack, all packet are marked as invalid.
Date: Fri, 26 Aug 2005 03:57:09 +0800
Message-ID: <430E2295.6010305@gmail.com>
References: <201E6F5AC48C274996A5AD8304FAEF860BFC93@p001ex03.porta.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <201E6F5AC48C274996A5AD8304FAEF860BFC93@p001ex03.porta.local>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Baake, Matthias" <m.baake@porta.de>
Cc: netfilter@lists.netfilter.org

Baake, Matthias wrote:

>Hi
>
>if you have a static ip situation i would use the snat target, thats not the problem but just noticed..
>please post your iptables startup script or the output of iptables-save.
>one thing i've never seen before is the "ctstate" output anybody any idea?!
>
>greets matthias
>  
>
Thank you for the SNAT target suggestion.

And I've already solved my problem by downgrading my kernel to 2.6.11.
It seems like a bug in the bridge netfilter code in 2.6.12.

I first tried to use iptables with LOG target to find where the 
connection tracking info disappeared.
Even after processed by the NF_IP_PRE_ROUTING filters the packets seemed ok,
but when they went to the NF_IP_FORWARD/NF_IP_PRI_MANGLE, their ctstate 
became INVALID.
Then I added some printk in the kernel sources, found the packets are 
still ok even when they went to beginning of NF_IP_FORWARD hooks,
however, when they finally came to ctstate match, skb->nfct was already 
cleaned with 0 (skb->nfctinfo still held correct value).
Then I examined the bridge netfilter code, I was suprised that it 
blocked the packets with NF_STOP -- how did the packets go to the 
NF_IP_PRI_MANGLE hook?
I tried to find document explaining what the NF_STOP does, but got 
nothing except that it's something new in the 2.6.12 kernel.
At last I tried to downgrade by kernel to 2.6.11, it worked, and the 
story ends.

I think the netfilter Hacking HOWTO should be updated to meet the change.
And I'm wondering what's the use of NF_STOP?
It seems little difference between NF_STOP and NF_STOLEN, but what's the 
essential?
--
Tien-Ren Chen, 2005/08/26.

