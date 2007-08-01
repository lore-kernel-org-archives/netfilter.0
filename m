From: Maximilian Wilhelm <max@rfc2324.org>
Subject: Re: blocking access to port 22 when INPUT policy is ACCEPT
Date: Wed, 1 Aug 2007 15:28:25 +0200
Message-ID: <20070801132825.GA8336@outback.rfc2324.org>
References: <b400c69a0707311002j46a9505du414c2058edbe79e2@mail.gmail.com>
	<b400c69a0707311504g653c5bcdv86f100f5278a8fda@mail.gmail.com>
	<20070731221833.GA589@outback.rfc2324.org>
	<46AFC850.5060307@riverviewtech.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <46AFC850.5060307@riverviewtech.net>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Am Tuesday, den 31 July hub Grant Taylor folgendes in die Tasten:

> >But what's wrong with the two rules?

> Nothing.  The old saying "If it isn't broke, don't fix it..." with it's 
> third stanza "...optimize it!" comes to mind.

:)

[...]
> >You might have noticed that I've changed the "DROP" to "REJECT" with 
> >fitting type which will make the live of you and other people easier 
> >when debugging anything related to ssh access to this box.

> The problem with this is that if you have an IP address of e.f.g.h, the 
> first rule will reject the connection.  Negative logic does not work 
> quite as you would expect it to.  You have to work with inverted 
> positive logic below (invert the result of the entire set of logic).

Argh.
I should not write mails when totally tired.
I'm really sorry for the fnord.
Thanks for getting it right.

> There is also the fact that fewer and fewer things know how to handle 
> error messages like this, or if they do they do not display them to the 
> end user.  (Thanks M$!)  You may have better luck with a basic REJECT 
> target than one that specifies the ICMP error code unless you know that 
> you are working with a client application that can correctly interpret.
[...]

You're sadly right here, too.
But I have to state that tcpdump (which most probably will be most
often used when debugging network problems) shows this correct.
I think ethereal^Wwhireshark will do so, too.

Ciao
Max
-- 
	Follow the white penguin.

