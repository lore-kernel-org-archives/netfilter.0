From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Is DIVERT w/o forwarding feasible? (fwd)
Date: Tue, 10 Sep 2002 13:53:48 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200209101253.g8ACrsv06951@vulcan.rissington.net>
References: <Pine.LNX.4.33.0209101914460.12984-100000@panda.center-f1.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.33.0209101914460.12984-100000@panda.center-f1.ru>
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

On Tuesday 10 September 2002 1:23 pm, Yury Bokhoncovich wrote:

> On Tue, 10 Sep 2002, Antony Stone wrote:
> >
> > What's wrong with enabling forwarding (so that the kernel can do it when
> > you want it to) and then specifying filtering rules in netfilter's
> > FORWARD chain so that it doesn't forward packets you don't want ?
>
> Your tagline show the difference :-) :
> "The difference between theory and practice is that
> in theory there is no difference, whereas in practice there is."
>
> In theory this works fine but we all make mistakes, happen to be misled,
> etc. The best known firewall in my practice is complete denying of
> unwanted packets from outside by forwarding set OFF.

Sounds like a proxy firewall to me, not a packet filter :-)

> Let's not discuss the reasons to disable kernel forwarding and to have
> "transparent" diverting! Just give me a clue if you can!
> I didn't catch purpose of PREROUTING target, can it help in my issue?
> IIRC, there was a patch for FBSD's ipfw some time ago to make diverting
> w/o forwarind enabled. I'm looking for something alike but for Pingo.:-)

The PREROUTING chain is for changing the destination address (in the nat 
table) or otherwise mucking about with the packet headers (in the mangle 
table) before the kernel routing system gets to look at it.

I don't see that it would help you get packets to go through the machine if 
kernel forwarding is turned off, because the kernel will simply not send 
packets between interfaces in this situation.

I notice you said above that "The best known firewall in my practice is 
complete denying of unwanted packets from outside by forwarding set OFF."

Since it is packets from the outside that you want to block, why do you say 
that the following two rules at the top of the ruleset will not work 
effectively ?

iptables -A FORWARD -i $extIF -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -i $extIF -j DROP

Antony.

-- 

Documentation is like sex:
when it's good, it's very very good;
when it's bad, it's still better than nothing.

