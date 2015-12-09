From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: nftables rate limit logging and then drop
Date: Wed, 9 Dec 2015 22:44:13 +0100
Message-ID: <20151209214413.GA20365@salvia>
References: <565F73F5.3090004@heinlein-support.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <565F73F5.3090004@heinlein-support.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Robert Sander <r.sander@heinlein-support.de>
Cc: netfilter <netfilter@vger.kernel.org>, Shivani Bhardwaj <shivanib134@gmail.com>

On Wed, Dec 02, 2015 at 11:43:01PM +0100, Robert Sander wrote:
> Hi,
> 
> How do I implement something like this in nftables:
> 
> iptables -A INPUT -m conntrack --ctstate INVALID -m limit --limit 3/m --limit-burst 5 -j LOG --log-level debug --log-prefix "INVALID DROP: "
> iptables -A INPUT -m conntrack --ctstate INVALID -j DROP

The translation is:

nft add rule filter input ct state invalid \
        limit rate 3/minute burst 5 packets \
        log level debug prefix \"INVALID DROP: \" counter
nft add rule filter input ct state invalid counter drop

Note that rule counters are optional in nftables, unlikely iptables
where we always have them on.
