From: ASHISH <ashishis@gmail.com>
Subject: Re: --limit 5/m doesn't work
Date: Wed, 23 Mar 2005 23:56:33 +0530
Message-ID: <558224e305032310262146144c@mail.gmail.com>
References: <000001c52f53$ed3f3220$1500a8c0@itasam>
	<558224e30503222255158832bc@mail.gmail.com>
	<558224e305032300217c4772c9@mail.gmail.com>
	<1111585483.4513.12.camel@hubcap.ljm.dom>
	<Pine.LNX.4.61.0503230853200.5803@localhost.localdomain>
Reply-To: ASHISH <ashishis@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <Pine.LNX.4.61.0503230853200.5803@localhost.localdomain>
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

I believe that's true. Even i did check that through logging when was
about to present this to my students in network security course. This
is coarsely analogous to a tap that leaks in a bucket every fixed
amount of time in order to fill it, but the bucket rejects the new
drops when it is full.


On Wed, 23 Mar 2005 08:59:11 -0500 (EST), Robert P. J. Day
<rpjday@mindspring.com> wrote:
> On Wed, 23 Mar 2005, Jason Opperisano wrote:
> 
> > On Wed, 2005-03-23 at 03:21, ASHISH wrote:
> > > The rule that you have mentioned will "Accept" the first five matches.
> >
> > to split hairs here--the way the OP has the rule written:
> >
> > iptables -A INPUT -i eth0 -m limit --limit 5/m --limit-burst 5 -j ACCEPT
> >
> > it will actually accept the first 10 packets, the limit of 5 + the burst
> > of 5--then the limit will enforce for 5 minutes.
> 
> huh?  i'm pretty sure that's not true, as i remember figuring this out
> once upon a time.  i'll go back to my notes but, as i *remember* it,
> it's easiest to think in terms of tokens.  "limit-burst" means you get
> that many tokens with which to "pay" to accept incoming packets.  if
> you start with a limit burst of, say, 20, then you can accept the
> first 20 packets, regardless of how fast they arrive -- they just cost
> you all of your tokens almost immediately.
> 
> the "limit" of 5/m means that you are replenished with another token
> at that rate -- effectively every 12 seconds -- but only up to your
> limit-burst maximum of 20.
> 
> what this means is that, if you're getting just hammered, when you
> start, you'll accept the first 20 packets and, after that, another one
> every 12 seconds.  if things quiet down, then you're allowed to build
> up your reserve of tokens again, but only up to your burst-limit.
> 
> i actually set up a set of rules once and *watched* this happen.
> 
> does that make sense?
> 
> rday
> 
> 


-- 
cheers
Ashish

