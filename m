From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: nftables: drop ssh brute force with ip block
Date: Thu, 23 Jun 2016 13:01:32 +0200
Message-ID: <20160623110132.GB2149@salvia>
References: <5766E34B.4040008@gmail.com>
 <20160623103430.GA10616@salvia>
 <576BBC72.8030507@gmail.com>
 <20160623104847.GA18850@salvia>
 <576BC023.4040001@gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <576BC023.4040001@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Irwin L." <biatche@gmail.com>
Cc: netfilter@vger.kernel.org

On Thu, Jun 23, 2016 at 06:55:31PM +0800, Irwin L. wrote:
> On 2016-06-23 18:48, Pablo Neira Ayuso wrote:
> >On Thu, Jun 23, 2016 at 06:39:46PM +0800, Irwin L. wrote:
> >>I currently use:
> >>tcp dport {22222,40022,42222} ct state new counter flow table bruteforce {
> >>ip saddr limit rate 3/minute } counter accept comment "limit bruteforce"
> >>
> >>Is this ok?
> >Looks good to me. I would probably check for ct state new in first
> >place, given that this only matches the first packet a new TCP
> >connections. It will save you the tcp dport set lookup.
> >
> >Note that you can even limit this per port, ie.
> >
> >         ct state new tcp dport {22222,40022,42222} counter \
> >                 flow table bruteforce { ip saddr . tcp dport limit rate 3/minute } \
> >                         counter accept comment "limit bruteforce"
> >
> >using the 'ip saddr . tcp dport' concatenation. But I guess you want
> >globally ban anyone spamming you to those ports anyway.
> >
> >>I wanted to ban spamming ips altogether, but I've since learned that this is
> >>the job of 'fail2ban'
>
> >fail2ban is nice to have to simplify this administrative hassle, but I
> >think it is still using iptables (it's been a while a I didn't look at
> >that code), we can do much better now with nft to resolve this problem.
> 
> By that do you mean "counter ct state new" instead of "counter flow table" ?
> 
> Thing is with this method, it only limits, I wonder if nft can blacklist the
> ip for 1 day or even 1 week with the option of manually removing blacklisted
> ips manually.
>

I mean, instead of:

        tcp dport {22222,40022,42222} ct state new counter

use this:

        ct state new tcp dport {22222,40022,42222} counter

so just place the 'ct state new' check in first place, as most packets
will not go further in the rule evaluation, given that the rule
evaluation happens from left to right. If one of the statements
evaluates false, we stop evaluating and look at the next rule.
