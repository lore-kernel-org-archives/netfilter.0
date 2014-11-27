From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: unable to install libnftnl Error : "XT_EXTENSION_MAXNAMELEN
 undeclared here"
Date: Thu, 27 Nov 2014 13:01:56 +0100
Message-ID: <20141127120156.GA22329@salvia>
References: <CAA5aLPgXUgF4JsTh6YR-0Mw9+NSW8bmMAp2wJLGf85QdsVKErQ@mail.gmail.com>
 <20141127103549.GA3271@salvia>
 <CAA5aLPih82HGtTugrE9ekiMcj-xkwH4KhV7t5FB=f0PpOU9bow@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAA5aLPih82HGtTugrE9ekiMcj-xkwH4KhV7t5FB=f0PpOU9bow@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Akshat Kakkar <akshat.1984@gmail.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Thu, Nov 27, 2014 at 04:53:16PM +0530, Akshat Kakkar wrote:
> Thanks for the info.
> 
> I downloaded latest snapshot. It installed atleast on 2.6.36.
> 
> I want it to test skbinfo feature of ipset (released in 6.22), so I
> was installing iptables which required libnftnl

I think you're mixing up things.

You seem to be refering to ipset, while installing nftables libraries.
