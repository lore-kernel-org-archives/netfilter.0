From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Is DIVERT w/o forwarding feasible? (fwd)
Date: Tue, 10 Sep 2002 09:14:16 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020910081417.NRJF292.mta01-svc.ntlworld.com@there>
References: <Pine.LNX.4.33.0209100903440.8488-100000@panda.center-f1.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.33.0209100903440.8488-100000@panda.center-f1.ru>
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
To: netfilter@lists.netfilter.org

On Tuesday 10 September 2002 3:04 am, Yury Bokhoncovich wrote:

> Hello!
>
> I need an advice for this topic: is diverting without forwarding feasible?
>
>  At present time we've managed to work SSL-tunnels via our MAN-provider
> for a few several protocols by well-known method "connect this app to
> border gateway, it takes care all the rest" and with (essentially!)
> forwarding disabled in the kernel at all. But this method fails to meet
> challenge of deploying fully-functional VPN with transparent packet
> crossing over the MAN. In principle situation can be easily resolved if
> there's a way to divert packets to an program on the border gateway
> without need to enable forwarding in the kernel.

Why is it so important that you do not have forwarding enabled in the kernel ?

What's wrong with enabling forwarding (so that the kernel can do it when you 
want it to) and then specifying filtering rules in netfilter's FORWARD chain 
so that it doesn't forward packets you don't want ?

Set a default DROP policy on your forward chain, and then the only packets 
which get forwarded will be the ones you specify in your rules.

Antony.

-- 

The difference between theory and practice is that
in theory there is no difference, whereas in practice there is.

