From: Andy Furniss <andyqos@ukfsn.org>
Subject: Re: prio + policing filter on ingress?
Date: Thu, 15 Dec 2011 20:48:31 +0000
Message-ID: <4EEA5D1F.6080805@ukfsn.org>
References: <op.v6dujdvsx1lyi3@debiandesk2.net>  <1323800724.1995.58.camel@andybev-desktop>  <op.v6f2p4edx1lyi3@debiandesk2.net>  <1323813101.1995.116.camel@andybev-desktop>  <1323816812.8451.3.camel@denise.theartistscloset.com> <1323893613.1995.152.camel@andybev-desktop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1323893613.1995.152.camel@andybev-desktop>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Andrew Beverley <andy@andybev.com>
Cc: "John A. Sullivan III" <jsullivan@opensourcedevel.com>, Lloyd Standish <lloyd@crnatural.net>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Andrew Beverley wrote:

>
> Well according to a question just posted to the (new) LARTC mailing
> list,

Interesting - where's the new list please?


>> HFSC might not be a bad idea for you.  I'm still trying to get my head
>> around it
>
> Ah yes, I've noticed the questions on the netdev list. Thanks for that -
> I just need to spend some time reading through the details now!

That's a lot to digest.

One thing that I recall from when hfsc first came out is that when 
testing it wouldn't limit bulk if the class wasn't backlogged.

For most people if you have enough bandwidth I doubt this is an issue, 
but at the time I was limiting for a 256kit dsl line with five users.

The hfsc paper says (IIRC) that the system will be backlogged until the 
last bit is transmitted - this would have made it really useful for me, 
but the Linux implementation didn't (doesn't?) seem to behave like this, 
so with five empty bulk classes firing five packets at them all would 
instantly dequeue borking my latency 5x more that I could achieve with 
htb classes with low burst set.

Of course htb isn't perfect and will sometime dequeue more than one at a 
time when multiple classes backlogged (hfsc probably wins in this case) 
it's just that one test put me off hfsc. Now I have more bandwidth this 
new documentation could be very useful - thanks for taking the time and 
effort.

I assume it's still "mean" by dropping unclassified traffic if you don't 
set a default class - that used to catch people out as htb was the 
opposite so at least you didn't loose your arp while playing around.
