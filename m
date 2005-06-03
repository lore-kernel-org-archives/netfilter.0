From: =?ISO-8859-1?Q?J=F6rg_Harmuth?= <harmuth@mnemon.de>
Subject: Re: 2 Questions--state (est, rel) and tuning
Date: Fri, 03 Jun 2005 16:38:25 +0200
Message-ID: <42A06B61.4020009@mnemon.de>
References: <B80488675062364A909EE60F4A66603807840EAE@usilms23.ca.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <B80488675062364A909EE60F4A66603807840EAE@usilms23.ca.com>
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

Ginter, Jeff A schrieb:

> For example on a Checkpoint or PIX you would NOT need the 
> established or related rules.  They are aware that a 
> conversation has started and will let return packets in....of course, 
> it is possible that there is an implicit rule on a Checkpoint or PIX 
> that is "hidden" that allows established and related and the user just 
> doesn't see this and in iptables you do...but I thought this was part 
> of the state engine.

I can't give a proof for Checkpoint and PIX, but I think that's exactly
the way it is: You simply can't see these rules, they are generated in
the background, if you decide to have a stateful firewall, and are then
compiled into the rule set.

Looking at pf from the BSD folks, you can say "keep-state" and the
meaning is, that from this point on pf creates the needed rules on the
fly and puts it in the state table (and later on automatically deletes
these dynamic rules).

iptables - as far as I know - doesn't have such "automatics" and thus
you have to specify est,rel rules explicitely.

Any other / additional notions ?

Have a nice time,

Joerg


