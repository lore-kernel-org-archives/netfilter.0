From: Florian Westphal <fw@strlen.de>
Subject: Re: Timestamps, NFLOG, and ULOG
Date: Fri, 22 May 2020 01:26:26 +0200
Message-ID: <20200521232626.GA26949@breakpoint.cc>
References: <CAKOsuLo6wdEXEdb9gEbnXhU9uEoFvaWS1SKjaUitm9SaRyz17Q@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAKOsuLo6wdEXEdb9gEbnXhU9uEoFvaWS1SKjaUitm9SaRyz17Q@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Korodev <korodev@gmail.com>
Cc: netfilter@vger.kernel.org

Korodev <korodev@gmail.com> wrote:
> Additionally if I implement any sort of queuing or thresholding, which
> I'd like to eventually, the timestamps are affected. This seems to
> indicate I'm not getting the actual packet timestamps. Any ideas on
> what could be causing this or is this expected behaviour?

Its expected.  If you want rx timestamps you should set
SO_TIMESTAMP(NS) socket option,
