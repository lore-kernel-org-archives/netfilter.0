From: J Doe <general@nativemethods.com>
Subject: Re: Using sets for protocols ?
Date: Sat, 12 Aug 2017 21:01:10 -0400
Message-ID: <D1AB5D57-5FAF-45BF-86DD-0285F4341F0B@nativemethods.com>
References: <3F149C27-5E77-455F-B870-68307C3A87DF@nativemethods.com> <1502237500.3812.1.camel@regit.org>
Mime-Version: 1.0 (1.0)
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1502237500.3812.1.camel@regit.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Eric Leblond <eric@regit.org>
Cc: netfilter@vger.kernel.org

Hi Eric and Noel,

> On Aug 8, 2017, at 8:11 PM, Eric Leblond <eric@regit.org> wrote:
> 
> Well, there is a series of mistakes here. First, usual way to write the
> rules is to have one rule for established packets (that can also
> include related)
> 
>  add rule filter input ct state established accept
>  add rule filter output ct state established accept
> 
> This rule will take care of all replies and other packets. The only
> thing you have to do after that is to accept packet that open a
> exchange.
> 
> As you want to allow dns resolution, you need to open dns trafic:
> 
>  add rule filter output ct state new udp dport domain accept
> 
> Client don't use TCP often but you will indeed need a extra rule if
> ever ou want to:
> 
>   add rule filter output ct state new tcp dport domain accept

Ok, thanks for the correction regarding style.

Out of curiosity - was the original syntax I specified logically incorrect (in the sense that there would be errors in my firewall ruleset), as well as being poor style ?

I want to follow the convention, I'm just wondering if the way I am forming rules can lead to errors as well.

Thanks,

- J


