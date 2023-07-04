From: Florian Westphal <fw@strlen.de>
Subject: Re: Best practices on iif usage at persistent ruleset
Date: Tue, 4 Jul 2023 15:09:21 +0200
Message-ID: <20230704130921.GA3751@breakpoint.cc>
References: <ede291f8-c556-0d0c-d598-7c69f387ed74@at.encryp.ch>
 <20230703152544.GD7043@breakpoint.cc>
 <66270f9c-6465-62bd-e100-c6615df86ac2@gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <66270f9c-6465-62bd-e100-c6615df86ac2@gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: George Shuklin <george.shuklin@gmail.com>
Cc: Florian Westphal <fw@strlen.de>, Serg <seentr@at.encryp.ch>, netfilter@vger.kernel.org

George Shuklin <george.shuklin@gmail.com> wrote:
> On 03/07/2023 18:25, Florian Westphal wrote:
> > Serg <seentr@at.encryp.ch> wrote:
> > > I know that there is iifname as a safe alternative, but as far as I know it
> > > has huge performance drawback and thus its' usage is discouraged in my case.
> > Not really. Its copy and compare 4 bytes vs. copy and compare 16 bytes.
> 
> Is iface name lookup o(1)?

Yes, its just dev->name vs. dev->ifindex.
