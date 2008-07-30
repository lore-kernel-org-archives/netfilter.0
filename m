From: Thomas Jacob <jacob@internet24.de>
Subject: Re: iptables, NAT, DNS & Dan Kaminsky
Date: Wed, 30 Jul 2008 18:39:30 +0200
Message-ID: <1217435970.14516.17.camel@enterprise.ims-firmen.de>
References: <2d460de70807300753h6673017i29374763ca9f763@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <2d460de70807300753h6673017i29374763ca9f763@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Richard Hartmann <richih.mailinglist@gmail.com>
Cc: netfilter@vger.kernel.org

On Wed, 2008-07-30 at 16:53 +0200, Richard Hartmann wrote:
> Hi all,
> 
> as you are very likely all aware, Dan Kaminsky uncovered a major exploit
> in RFC-compliant DNS caching servers the successful execution of which
> relies on port prediction/guessing.
> 
> After quite some research, I have come up with the following facts which
> I want to cross-check with you guys so I can be _sure_.
> 
> 
> 1) The --random target for SNAT exists since 2.6.22 to allow 'fixing' of
> broken DNS servers in your NATted LAN along the lines of
> 
> iptables -t nat -I POSTROUTING 1 -p udp -s 1.2.3.4 --dport 53 -j SNAT \
> --to 1.2.3.4 --random
> 
> Is that correct?

One of the main points of the Kaminsky exploits allegedly is
(but who knows for sure, it hasn't been published yet) that
the bind people weren't using a cryptographically secure
random number generator for the transaction ids (which aren't
affected by SNAT I gather) and the fixed but random query
source port. Sure they also didn't change the query source
port for each query, but the question is if this is really
the most important part of the equation. 

I rather suspect that the random32 generator in the Linux
kernel is not cryptographically secure, and you will not
be changing the transaction ids.

The question therefore is if you will really gain a lot
of security with respect to the exploit in question. Hmm..

We'll know next week :)

