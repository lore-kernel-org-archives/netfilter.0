From: Korodev <korodev@gmail.com>
Subject: Re: Timestamps, NFLOG, and ULOG
Date: Thu, 21 May 2020 18:58:20 -0500
Message-ID: <CAKOsuLopu0VZna9YTK7u-bri7RjodX6ufrqz_n4tLGXHOLNw7w@mail.gmail.com>
References: <CAKOsuLo6wdEXEdb9gEbnXhU9uEoFvaWS1SKjaUitm9SaRyz17Q@mail.gmail.com>
 <20200521232626.GA26949@breakpoint.cc>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pOwSwwUEL5NZH/ulb+xg+59xg2X+WW5IuOerP/pwGsk=;
        b=H4bFAtnjyT7mBtHfWGzCv7y1jQxjMQ44dkpUSkAy1gZq86TaQYi4PLFhZ2Q8p8t//Y
         wfdLbfPyCKLDFuFFQ08jsQ0z4DO3AKfgr4PG4rNK5MzGay7SWuK2LPp19vxzC3x1p5ai
         RdYhjqnz0TI90CBt91CwIk9ioCOMk7Zb6GAl0maa1HcTqAMbdE1SyGEpEEnYepb8SgyH
         Ew+em0PsIdioIwRY6XyAxvBUrMIq6Ny7Xi//NHJoB++oF14gUbMcSj+HBFNcsnPg3Q8p
         C37hRRHBiLPEZiRuEBtRnc9kw16D2FuBNq3BJXEEZ3p2+ICT+13DHMr01XpH+655dPF1
         gBfg==
In-Reply-To: <20200521232626.GA26949@breakpoint.cc>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Florian Westphal <fw@strlen.de>
Cc: netfilter@vger.kernel.org

On Thu, May 21, 2020 at 6:26 PM Florian Westphal <fw@strlen.de> wrote:
> Its expected.  If you want rx timestamps you should set
> SO_TIMESTAMP(NS) socket option,

Thank you for your reply. My understanding is that SO_TIMESTAMP is a
socket option I could set for an application that I control, but how
would I go about enabling that such that IPTables, Netlink, and ULOGd
are aware? I assumed I would at least get the software timestamp at
which the kernel received the packet. Am I correct in assuming that
the IPTables LOG action has simply been providing me the timestamp at
the time printk is called all this time?

\\korodev
