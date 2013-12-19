From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: BUG ip6tables and helper
Date: Thu, 19 Dec 2013 10:22:52 +0100
Message-ID: <20131219092252.GA4828@localhost>
References: <1387438538.10463.0.camel@tardis>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1387438538.10463.0.camel@tardis>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Noel Butler <noel.butler@ausics.net>
Cc: netfilter@vger.kernel.org

Hi Noel,

On Thu, Dec 19, 2013 at 05:35:38PM +1000, Noel Butler wrote:
> Hi Pablo,

Please, CC me if this is addressed to me. I read all mailing lists
quite often but I have lots of email and chances are this gets lost
increases.

> Bug with ip6tables and helpers
> 
> -j CT --helper irc
> 
> ip6tables: No chain/target/match by that name.
> 
> This *does* work with iptables

I sent this patch time ago, just compiled tested:

http://www.spinics.net/lists/netfilter/msg54642.html

But got no feedback on it. Could you take it, give it a try and let me
know if it fixes this issue? Thanks!
