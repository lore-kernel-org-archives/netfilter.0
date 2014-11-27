From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: unable to install libnftnl Error : "XT_EXTENSION_MAXNAMELEN
 undeclared here"
Date: Thu, 27 Nov 2014 11:35:49 +0100
Message-ID: <20141127103549.GA3271@salvia>
References: <CAA5aLPgXUgF4JsTh6YR-0Mw9+NSW8bmMAp2wJLGf85QdsVKErQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAA5aLPgXUgF4JsTh6YR-0Mw9+NSW8bmMAp2wJLGf85QdsVKErQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Akshat Kakkar <akshat.1984@gmail.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Thu, Nov 27, 2014 at 03:47:50PM +0530, Akshat Kakkar wrote:
> My kernel is 2.6.36

nftables requires >= 3.13.

> I am trying to install libnftnl-1.0.2
> I executed following commands
> 
> tar xvf libnftnl-1.0.2.tar.bz2
> cd libnftnl-1.0.2
> ./configure
> 
> 
> Till this point everything is OK.
> When I execute command ""make""
> I get following error
> 
> make  all-recursive
> make[1]: Entering directory `/usr/local/libnftnl-1.0.2'
> Making all in src
> make[2]: Entering directory `/usr/local/libnftnl-1.0.2/src'
>   CC     expr/match.lo
> expr/match.c:31: error: 'XT_EXTENSION_MAXNAMELEN' undeclared here (not
> in a function)

That is an old bug that is already resolved in the git snapshot.
