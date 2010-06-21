From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: noob question howto using iptables limit ip access times
Date: Mon, 21 Jun 2010 06:53:03 -0500
Message-ID: <20100621115303.GO19868@cardinal>
References: <AANLkTimidapf_oJzL3tN2U275oX-nubojD5YRC6mwS-H@mail.gmail.com>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <AANLkTimidapf_oJzL3tN2U275oX-nubojD5YRC6mwS-H@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

On Mon, Jun 21, 2010 at 07:30:32PM +0800, Zhu Jing wrote:
> My aim is limit ip access to my squid server with 1000 times per day.
> If this ip connections counts more then 1000,iptables will drop it.
snip
>    iptables -A squid -m limit --limit 1/hour --limit-burst 1000 -j RETURN
> 
>    IMO: this rule means ,the limit-burst token bucket is set to 1000
> initially, for each hour token count goes up by 1, when token bucket
> is empty---> not match --> go next rule

No, the burst is the number of packets arriving at once. I think you 
want:
    iptables -A squid -m limit --limit 1000/day -j RETURN
optionally with a reasonable burst limit: --limit-burst 100

See also the more featureful connlimit and hashlimit matches. Perhaps 
-m recent might meet your need, too.
-- 
    Offlist mail to this address is discarded unless
    "/dev/rob0" or "not-spam" is in Subject: header
