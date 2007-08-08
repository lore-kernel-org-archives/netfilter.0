From: "Maxim Veksler" <hq4ever@gmail.com>
Subject: Re: can't ssh outside with OUTPUT (policy ACCEPT)
Date: Thu, 9 Aug 2007 01:46:18 +0300
Message-ID: <b400c69a0708081546r394f0123x108cec305d3dda55@mail.gmail.com>
References: <b400c69a0708080942j69063e1em16ef7224f78f6fea@mail.gmail.com>
	<46BA013D.6020709@rtij.nl>
	<b400c69a0708081235t3ff42d69yb28f60cb79231032@mail.gmail.com>
	<46BA39CD.1010802@rtij.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	b=OOqKVMmiRBmxw3Gc9n8F7LTEj/PpTbzRcVbj4GMUwvwsanwJpp1qvSOO1jrhVf44K/4u2CMPqnWqnijFKvcEYgDQ/yd+DLaY3shszqwNEJRl8lb5HIgQCZADUZd+bR5FEMq/zC9jWZMvmAONixZEVZt4b6dNIU0mlFaFzYt61rA=
In-Reply-To: <46BA39CD.1010802@rtij.nl>
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
To: Martijn Lievaart <m@rtij.nl>
Cc: netfilter@lists.netfilter.org

On 8/9/07, Martijn Lievaart <m@rtij.nl> wrote:
> Maxim Veksler wrote:
> > On 8/8/07, Martijn Lievaart <m@rtij.nl> wrote:
> >
> >> Maxim Veksler wrote:
> >>
> >>> Hello,
> >>>
> >>> Follwing a recent theread on this list, I've configued my firewall to
> >>> allow incoming traffic from specific IP's only. Now I can't ssh
> >>> outside, could some please explain why this happening ?
> >>>
> >>> The system is redhat 4.
> >>>
> >>>
> >> You don't allow the return packets in. Add a -m state --state
> >> ESTABLISHED,RELATED match as the first rule in your INPUT chain.
> >>
> >>
> >
> > That was it, thank you very much.
> > How could I've debug it myself ?
> >
>
> Good question!
>

Thank you.

> Add LOG rules for dropped traffic.

I would appreciate an example for this tip.

> Get out wireshark (formerly ethereal)

Got it, tcpdump -w /tmp/iptables_lock.cap, it seems that iptables hook
drops the packet before libpcap has a chance on seeing it.

> to see what goes on at the line. Read up on how to construct good
> rulesets

Would very much appreciate good links here.

and maybe even on IP (no sorry, I don't have any links).
>

rfc791, that's for IP. Please correct me if I'm wrong but you meant
read on TCP because IP is stateless and has no verification what so
ever buildin, the only tracking IP does is for fragmentation and
reconstruction of packets. I don't think this was the case here and
further more I don't see how --state ESTABLISHED,RELATED could have
any effect on it. Again, please correct me if I'm wrong.

> HTH,

It does !

> M4
>
>

Thank you.

-- 
Cheers,
Maxim Veksler

"Free as in Freedom" - Do u GNU ?

