From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Is DIVERT w/o forwarding feasible?
Date: Wed, 11 Sep 2002 16:37:06 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200209111537.g8BFbCv08909@vulcan.rissington.net>
References: <Pine.LNX.4.33.0209111953130.19450-100000@panda.center-f1.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.33.0209111953130.19450-100000@panda.center-f1.ru>
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

On Wednesday 11 September 2002 2:39 pm, Yury Bokhoncovich wrote:

> > Err, please explain why you do not want forwarding enabled.
>
> Because rule #1: "People makes mistakes". Disabled forwarding gives more
> strict and reliable control under possible traffic.

People make mistakes.   Agreed.

But why does disabling forwarding in the kernel, and then providing some 
other mechanism for packets to get between the inside & outside, make 
mistakes any less likely ?   Surely there's still plenty of opportunities to 
make mistakes in whatever system you *do* set up to allow connectivity to the 
Internet, and if it's not as clear and standard as using netfilter, you might 
find it a lot less simple to locate and correct those mistakes ?

> > When there are Ferraris out there for
> > free, why build your own skoda?
>
> I didn't catch exactly what you mean as "skoda"

Try Skoda = Trabant.   Does that help :-) ?

> And ole good ipchain was more suitable to tweak packets as I want, right?8-)

ipchains is not stateful.   iptables is stateful.   Stateful inspection is 
regarded as a Good Thing(TM).   Therefore we now use iptables.

Antony.

-- 

Documentation is like sex:
when it's good, it's very very good;
when it's bad, it's still better than nothing.

