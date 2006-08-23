From: Jarek Poplawski <jarkao2@o2.pl>
Subject: Re: Where the de-SNAT actually takes place?
Date: Wed, 23 Aug 2006 13:43:41 +0200
Message-ID: <echf05$tib$1@sea.gmane.org>
References: <44E74CA0.9080808@gazeta.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <44E74CA0.9080808@gazeta.pl>
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
To: netfilter@lists.netfilter.org

On 19-08-2006 19:38, longraider wrote:
> Hi
...
> And all that I want to do is ingress queuing using IMQ. I want to fwmark
> packets according to their de-SNATed destination adress (and some other
> things also), and then put them into the IMQ ingress queue.
> I could use the packet matching available in the ingress queue itself
> (by ip tool), but I don't know if the packets that go into IMQ are
> de-SNATed or not.

IMQ can be configured, at which point of the traversal packets 
should be send to an IMQ pseudo-device (e.g. imq0). This diagram 
shows default variant (so called BA - Before PREROUTING - After 
POSTROUTING), which in my opinion isn't appropriate for common 
nat situations. So try to recompile your kernel after changing 
IMQ config to AB variant and it will see de-nated adresses both 
incoming (-j IMQ in PREROUTING) and outgoing (-j IMQ in 
POSTROUTING - beter don't use one imq device for both).

> So, where the de-SNAT actually takes place?

But you rather should use tc filter then (on imq it is egress 
always). MARK (fwmark) will see incoming packets de-nated only 
begining from FORWARD or INPUT so to use it like you planed, you 
should add IMQ rule for incoming packets in POSTROUTING, which is 
impractical (and excludes INPUT part).

Jarek P.


