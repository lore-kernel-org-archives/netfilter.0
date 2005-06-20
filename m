From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: iptables leaking blocked ip addresses.
Date: Mon, 20 Jun 2005 15:19:07 -0500
Message-ID: <200506201519.07430.rob0@gmx.co.uk>
References: <49bf7d7050620083448c1dee9@mail.gmail.com>
	<200506201329.19701.rob0@gmx.co.uk>
	<49bf7d7050620123646910d40@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <49bf7d7050620123646910d40@mail.gmail.com>
Content-Disposition: inline
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
To: "terry l. ridder" <artisticforge@gmail.com>
Cc: netfilter@lists.netfilter.org

On Monday 20 June 2005 14:36, terry l. ridder wrote:
> > > > I prefer to do filtering in the filter table as $DEITY
> > > > intended. :)
> >
> > For me that is more or less a matter of faith. I hope someone who
> > knows more about it will come along and explain why your NAT use is
> > poor design.

(Sven did this, thanks again, Sven.)

> do you have anything to contribute besides sniping at the manner in
> which i run and manage my network?

I do apologise for the tone which came across. I understand and
validate your feelings: I definitely could have worded it better. But
in fact I do believe I offered some useful suggestions; do with them 
what you will.

> > > connection tracking is turned off since at one time i was
> > > using tarpit instead of just dropping the connections.
> >
> > Whatever. Without connection tracking you might as well use
> > ipchains.
>
> the tarpit howto does say to turn connection tracking off.

Ah, I did not know this. TY for the information. But that itself brings 
the whole tarpitting concept into question, in my mind. Anything which 
throws away the main benefit of iptables can't be worth the trouble.
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

