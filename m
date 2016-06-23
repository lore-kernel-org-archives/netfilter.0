From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: nftables: drop ssh brute force with ip block
Date: Thu, 23 Jun 2016 12:48:47 +0200
Message-ID: <20160623104847.GA18850@salvia>
References: <5766E34B.4040008@gmail.com>
 <20160623103430.GA10616@salvia>
 <576BBC72.8030507@gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <576BBC72.8030507@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Irwin L." <biatche@gmail.com>
Cc: netfilter@vger.kernel.org

On Thu, Jun 23, 2016 at 06:39:46PM +0800, Irwin L. wrote:
> I currently use:
> tcp dport {22222,40022,42222} ct state new counter flow table bruteforce {
> ip saddr limit rate 3/minute } counter accept comment "limit bruteforce"
> 
> Is this ok?

Looks good to me. I would probably check for ct state new in first
place, given that this only matches the first packet a new TCP
connections. It will save you the tcp dport set lookup.

Note that you can even limit this per port, ie.

        ct state new tcp dport {22222,40022,42222} counter \
                flow table bruteforce { ip saddr . tcp dport limit rate 3/minute } \
                        counter accept comment "limit bruteforce"

using the 'ip saddr . tcp dport' concatenation. But I guess you want
globally ban anyone spamming you to those ports anyway.

> I wanted to ban spamming ips altogether, but I've since learned that this is
> the job of 'fail2ban'

fail2ban is nice to have to simplify this administrative hassle, but I
think it is still using iptables (it's been a while a I didn't look at
that code), we can do much better now with nft to resolve this problem.
