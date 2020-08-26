From: Florian Westphal <fw@strlen.de>
Subject: Re: Multiple labels with connlabel
Date: Wed, 26 Aug 2020 23:43:05 +0200
Message-ID: <20200826214305.GB7319@breakpoint.cc>
References: <CAPicJaHyWhrz8VxZ8tfpSUNcc_KPSF-cHUPYe1JmGwxroAFX8A@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAPicJaHyWhrz8VxZ8tfpSUNcc_KPSF-cHUPYe1JmGwxroAFX8A@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Amiq Nahas <m992493@gmail.com>
Cc: netfilter@vger.kernel.org

Amiq Nahas <m992493@gmail.com> wrote:
> Currently this can be done
> iptables -t mangle -I PREROUTING -m connlabel --label portforward
> 
> What if someone wants to use multiple labels? One would have to write
> this same rules several times.
> Can we do something like this:
> iptables -t mangle -I PREROUTING -m connlabel --label
> portforward-something-somethingelse-...

No, thats not supported.  You can use matches multiple times:

iptables -t mangle -I PREROUTING \
  -m connlabel --label portforward \
  -m connlabel --label something \
  -m connlabel --label somethingelse
