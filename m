From: Yury Bokhoncovich <byg@center-f1.ru>
Subject: Re: Is DIVERT w/o forwarding feasible? (fwd)
Date: Tue, 10 Sep 2002 19:23:41 +0700 (NOVST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.33.0209101914460.12984-100000@panda.center-f1.ru>
References: <20020910081417.NRJF292.mta01-svc.ntlworld.com@there>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20020910081417.NRJF292.mta01-svc.ntlworld.com@there>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Antony Stone <Antony@Soft-Solutions.co.uk>
Cc: netfilter@lists.netfilter.org

Hello!

On Tue, 10 Sep 2002, Antony Stone wrote:

> > I need an advice for this topic: is diverting without forwarding feasible?
>
> Why is it so important that you do not have forwarding enabled in the kernel ?
>
> What's wrong with enabling forwarding (so that the kernel can do it when you
> want it to) and then specifying filtering rules in netfilter's FORWARD chain
> so that it doesn't forward packets you don't want ?

Your tagline show the difference :-) :
"The difference between theory and practice is that
in theory there is no difference, whereas in practice there is."

 In theory this works fine but we all make mistakes, happen to be misled,
etc. The best known firewall in my practice is complete denying of
unwanted packets from outside by forwarding set OFF.

 Let's not discuss the reasons to disable kernel forwarding and to have
"transparent" diverting! Just give me a clue if you can!
I didn't catch purpose of PREROUTING target, can it help in my issue?
IIRC, there was a patch for FBSD's ipfw some time ago to make diverting
w/o forwarind enabled. I'm looking for something alike but for Pingo.:-)

>
> Set a default DROP policy on your forward chain, and then the only packets
> which get forwarded will be the ones you specify in your rules.

-- 
WBR, Yury Bokhoncovich, Senior System Administrator, NOC of F1 Group.
Phone: +7 (3832) 106228, ext.140, E-mail: byg@center-f1.ru.
Unix is like a wigwam -- no Gates, no Windows, and an Apache inside.



