From: Yury Bokhoncovich <byg@center-f1.ru>
Subject: Re: Is DIVERT w/o forwarding feasible?
Date: Thu, 12 Sep 2002 11:21:03 +0700 (NOVST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.33.0209121057380.15402-100000@panda.center-f1.ru>
References: <200209111537.g8BFbCv08909@vulcan.rissington.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200209111537.g8BFbCv08909@vulcan.rissington.net>
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

On Wed, 11 Sep 2002, Antony Stone wrote:

> On Wednesday 11 September 2002 2:39 pm, Yury Bokhoncovich wrote:
>
> > > Err, please explain why you do not want forwarding enabled.
> >
> > Because rule #1: "People makes mistakes". Disabled forwarding gives more
> > strict and reliable control under possible traffic.
>
> People make mistakes.   Agreed.
>
> But why does disabling forwarding in the kernel, and then providing some
> other mechanism for packets to get between the inside & outside, make
> mistakes any less likely ?   Surely there's still plenty of opportunities to
> make mistakes in whatever system you *do* set up to allow connectivity to the
> Internet, and if it's not as clear and standard as using netfilter, you might
> find it a lot less simple to locate and correct those mistakes ?

I do not intent to connect insiders to Internet as is through a router:
there are various proxies to do this. I gonna use Internet as communicaton
media to deliver traffic on different parts of our internal network (just
like 2W copper dedicated line or FO-link we have already) 'cos such media
is cheap and easy to get (in my case, of course).:-)

Agreed that to get Internet access a router is easiest and simplest
way, that's what iptables is for.:)

Understand that there is no out-of-box solution to do my intention yet.
Question: Should I go to the dev list or the PREROUTING/QUEUE features
save my life? I.e. is it possible to tweak iptables rules w/o hacks in
code? 8)

>
> > > When there are Ferraris out there for
> > > free, why build your own skoda?
> >
> > I didn't catch exactly what you mean as "skoda"
>
> Try Skoda = Trabant.   Does that help :-) ?
Ah. Gotcha. But I need Hummer, not Ferrari and, of course, not Trabant.
'cos that Ferrari cannot ride without roads. Hummer can do this.
Understandable analogy?8)

> regarded as a Good Thing(TM).   Therefore we now use iptables.
understand.

-- 
WBR, Yury Bokhoncovich, Senior System Administrator, NOC of F1 Group.
Phone: +7 (3832) 106228, ext.140, E-mail: byg@center-f1.ru.
Unix is like a wigwam -- no Gates, no Windows, and an Apache inside.



