From: ASHISH <ashishis@gmail.com>
Subject: Fwd: Block outbound host to specific port(s) using Masq./NAT?
Date: Tue, 4 Jan 2005 14:36:34 +0530
Message-ID: <558224e305010401066da5a05d@mail.gmail.com>
References: <5dda57be050103135225b4e665@mail.gmail.com>
	<1104789905.6759.8.camel@hubcap.ljm.dom>
	<558224e3050103150559aea7cc@mail.gmail.com>
Reply-To: ASHISH <ashishis@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <558224e3050103150559aea7cc@mail.gmail.com>
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

Sometimes knowing something about the protocol amy help. For example
all ymessenger messages start with the string "YMSG" as a header in
application payload. I believe you can use string match to detect such
packets and drop them.

 iptables -A FORWARD -m string --string 'YMSG' -j DROP

I haven't analysed any other IM protocol as of now, but i'm sure a
little bit of googling will help ya out of the situation.


On Mon, 03 Jan 2005 17:05:06 -0500, Jason Opperisano <opie@817west.com> wrote:
> On Mon, 2005-01-03 at 16:52, Jerry2A wrote:
> > Hello - this is probably a dumb question....I'm using iptables for my
> > home network (DSL) and I have masquerading, some port forwarding,
> > etc., etc., and everything works great...EXCEPT....I have a situation
> > where I occaisionally want to block outbound traffic from a certain
> > host inside to a certain destination IP and/or port.  For example, I'd
> > like to block one host from within my network from using Instant
> > Messenger but still allow web surfing.  I've been able to dynamically
> > block ALL outbound access to the internet but I'm unable to restrict
> > access to certain destination ports.
> >
> > So this works:
> > iptables -A INPUT -s 10.1.1.10 -j DROP
> > iptables -A OUTPUT -d 10.1.1.10 -j DROP
> > iptables -A FORWARD -d 10.1.1.10 -j DROP
> >
> > And I thought I could do something like this:
> > iptables -A OUTPUT -s 10.1.1.10 -p tcp -m tcp --dport 5190 -j DROP
> > iptables -A FORWARD -d 10.1.1.10 -p tcp -m tcp --dport 5190 -j DROP
> > ....but it has no effect.
> >
> > I've tried different combinations of "-d and -s" and "--dport and
> > --sport" just to see if I was doing something backwards....no dice.  I
> > was wondering if I needed to set up some kind of pre or post routing
> > because of the masquerading?
> >
> > Any help would be appreciated.
> >
> > Thanks!
> >
> > Jerry A.
>
> first--NAT/MASQ has nothing to do with this--we're talking about
> FILTER-ing here.
>
> second--INPUT and OUTPUT have nothing to do with blocking Internet
> access for a host behind a gateway--that is the domain of FORWARD.
>
> third--whatever rule you use to block access from host 10.1.1.10 needs
> to come *before* any rule that allows all traffic from network
> 10.1.1.0/24 or from interface $inside.
>
> finally:
>
>   iptables -I FORWARD -p tcp -s 10.1.1.10 --dport 5190 -j DROP
>
> will insert a rule as the first rule in FORWARD that drops port 5190
> traffic from 10.1.1.10.
>
> keep in mind that blocking IM apps from connecting is often much more
> complicated than dropping a single port, as they have a habit of
> tunneling themselves through port 80.
>
> -j
>
> --
> "I have thought this through. First, I will send Bart the money to
>  fly home. Then I will murder him."
>         --The Simpsons
>
>


--
cheers
Ashish


-- 
cheers
Ashish

