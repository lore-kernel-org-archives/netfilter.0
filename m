From: Andy Furniss <andyqos@ukfsn.org>
Subject: Re: prio + policing filter on ingress?
Date: Thu, 15 Dec 2011 22:08:51 +0000
Message-ID: <4EEA6FF3.4020807@ukfsn.org>
References: <op.v6dujdvsx1lyi3@debiandesk2.net>  <1323800724.1995.58.camel@andybev-desktop>  <op.v6f2p4edx1lyi3@debiandesk2.net>  <1323813101.1995.116.camel@andybev-desktop>  <1323816812.8451.3.camel@denise.theartistscloset.com>  <1323893613.1995.152.camel@andybev-desktop>  <4EEA5D1F.6080805@ukfsn.org> <1323984570.8451.305.camel@denise.theartistscloset.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1323984570.8451.305.camel@denise.theartistscloset.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "John A. Sullivan III" <jsullivan@opensourcedevel.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

John A. Sullivan III wrote:

>> One thing that I recall from when hfsc first came out is that when
>> testing it wouldn't limit bulk if the class wasn't backlogged.
>>
>> For most people if you have enough bandwidth I doubt this is an issue,
>> but at the time I was limiting for a 256kit dsl line with five users.
> I haven't played around with it enough in the lab yet so I'm going
> strictly on the theory.  I believe the class should backlog as soon as
> there is a packet in queue.  An environment where bandwidth is so
> constrained sounds like an ideal place to have separate rt and ls
> curves.

Yea, I believe I did - but then it was a longtime ago. I think the issue 
was that an empty the class would dequeue instantly but the transmission 
time of that now gone packet didn't seem to affect other empty classes 
also receiving a packet. It would probably have only affected further 
packets to the same class.

I did raise it at the time and IIRC the author said that he would have 
to make hfsc even more non work conserving to deal with this case.

My test was a bit contrived I guess.

> The rt curve would allocate and guarantee a small amount of bandwidth to
> each queue. If some of those classes have time sensitive traffic, you
> could define a dilinear rt curve which would help jump those packets in
> front of the others.  Then, with the ls curves, you could allocate spare
> bandwidth.

I'll have to dig out my old tests - I guess I did try to do this - but 
may have failed :-)

> Of course, with five full queues firing
> full sized packets at 256kbit one can expect almost 250ms latency and
> can only guarantee 50 kbits.

I recall that I did manage to set things up so my rt was not delayed by 
more than one bulk packet in the bulks backlogged test.

> Good luck - John

Thanks - I'll need it :-)

Andy.
