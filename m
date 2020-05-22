From: Florian Westphal <fw@strlen.de>
Subject: Re: Timestamps, NFLOG, and ULOG
Date: Fri, 22 May 2020 02:21:34 +0200
Message-ID: <20200522002134.GB26949@breakpoint.cc>
References: <CAKOsuLo6wdEXEdb9gEbnXhU9uEoFvaWS1SKjaUitm9SaRyz17Q@mail.gmail.com>
 <20200521232626.GA26949@breakpoint.cc>
 <CAKOsuLopu0VZna9YTK7u-bri7RjodX6ufrqz_n4tLGXHOLNw7w@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAKOsuLopu0VZna9YTK7u-bri7RjodX6ufrqz_n4tLGXHOLNw7w@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Korodev <korodev@gmail.com>
Cc: Florian Westphal <fw@strlen.de>, netfilter@vger.kernel.org

Korodev <korodev@gmail.com> wrote:
> On Thu, May 21, 2020 at 6:26 PM Florian Westphal <fw@strlen.de> wrote:
> > Its expected.  If you want rx timestamps you should set
> > SO_TIMESTAMP(NS) socket option,
> 
> Thank you for your reply. My understanding is that SO_TIMESTAMP is a
> socket option I could set for an application that I control, but how
> would I go about enabling that such that IPTables, Netlink, and ULOGd
> are aware?

Setting this option makes the kernel record a timestamp at reception
time for all packets it receives (it won't know the socket the packet
will be delivered to yet, so it can't do this in a fine-grained way).

This is off by default for performance reasons.
Ideally ulogd should have an option to enable this (it doesn't have
one).

> I assumed I would at least get the software timestamp at
> which the kernel received the packet.

No, the kernel does not record a timestamp by default.
