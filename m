From: Phil Oester <kernel@linuxace.com>
Subject: Re: Bug in owner module
Date: Sun, 15 Dec 2013 08:38:33 -0800
Message-ID: <20131215163832.GA4337@home>
References: <52ADB534.7020700@zensecurity.su>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <52ADB534.7020700@zensecurity.su>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ZenSecurity <mailto@zensecurity.su>
Cc: netfilter@vger.kernel.org

On Sun, Dec 15, 2013 at 04:57:08PM +0300, ZenSecurity wrote:
> Hi, i have some issue with module (owner) in iptables v1.4.14 (debian
> wheezy 7.2.0)

what kernel version?

> Current rule fails:
> 
> iptables -t nat -A OUTPUT -o eth0 -p tcp -s x.x.x.x -m owner --gid-owner
> usergroup -j DNAT --to-destination x.x.x.x:80;
> 
> I tried to use numeric gid, it failed too..

Fails how??  Can't add the rule?  Doesn't match?  More details please.

Phil
