From: "John A. Sullivan III" <jsullivan@opensourcedevel.com>
Subject: Re: prio + policing filter on ingress?
Date: Thu, 15 Dec 2011 16:29:30 -0500
Message-ID: <1323984570.8451.305.camel@denise.theartistscloset.com>
References: <op.v6dujdvsx1lyi3@debiandesk2.net>
	 <1323800724.1995.58.camel@andybev-desktop>
	 <op.v6f2p4edx1lyi3@debiandesk2.net>
	 <1323813101.1995.116.camel@andybev-desktop>
	 <1323816812.8451.3.camel@denise.theartistscloset.com>
	 <1323893613.1995.152.camel@andybev-desktop>  <4EEA5D1F.6080805@ukfsn.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4EEA5D1F.6080805@ukfsn.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andy Furniss <andyqos@ukfsn.org>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hi, Andy.  I'll respond in line - John

On Thu, 2011-12-15 at 20:48 +0000, Andy Furniss wrote:
> Andrew Beverley wrote:
> 
> >
> > Well according to a question just posted to the (new) LARTC mailing
> > list,
> 
> Interesting - where's the new list please?
> 
> 
> >> HFSC might not be a bad idea for you.  I'm still trying to get my head
> >> around it
> >
> > Ah yes, I've noticed the questions on the netdev list. Thanks for that -
> > I just need to spend some time reading through the details now!
> 
> That's a lot to digest.
> 
> One thing that I recall from when hfsc first came out is that when 
> testing it wouldn't limit bulk if the class wasn't backlogged.
> 
> For most people if you have enough bandwidth I doubt this is an issue, 
> but at the time I was limiting for a 256kit dsl line with five users.
I haven't played around with it enough in the lab yet so I'm going
strictly on the theory.  I believe the class should backlog as soon as
there is a packet in queue.  An environment where bandwidth is so
constrained sounds like an ideal place to have separate rt and ls
curves.

The rt curve would allocate and guarantee a small amount of bandwidth to
each queue. If some of those classes have time sensitive traffic, you
could define a dilinear rt curve which would help jump those packets in
front of the others.  Then, with the ls curves, you could allocate spare
bandwidth.

> 
> The hfsc paper says (IIRC) that the system will be backlogged until the 
> last bit is transmitted - this would have made it really useful for me, 
> but the Linux implementation didn't (doesn't?) seem to behave like this, 
> so with five empty bulk classes firing five packets at them all would 
> instantly dequeue borking my latency 5x more that I could achieve with 
> htb classes with low burst set.
I think only one queue should dequeue and it will be chosen to ensure
that all rt guarantees are met.  Of course, with five full queues firing
full sized packets at 256kbit one can expect almost 250ms latency and
can only guarantee 50 kbits.  I suppose, if there was a latency
sensitive class, you could set all the rt m2 curves to something like
20kbit and set the time sensitive curve to something like umax 1514b
dmax 120ms which should ensure no more than 120ms latency for those
packets yet keep everything from starving.  If using something like VoIP
with smaller, 220b packets, you could do something like umax 220b dmax
20ms  The ls curves could then divvy up the bandwidth in the proportion
you want between the five streams.
> 
> Of course htb isn't perfect and will sometime dequeue more than one at a 
> time when multiple classes backlogged (hfsc probably wins in this case) 
> it's just that one test put me off hfsc. Now I have more bandwidth this 
> new documentation could be very useful - thanks for taking the time and 
> effort.
> 
> I assume it's still "mean" by dropping unclassified traffic if you don't 
> set a default class - that used to catch people out as htb was the 
> opposite so at least you didn't loose your arp while playing around.
I believe so.  Good luck - John

