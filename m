From: Eliezer Croitoru <eliezer@ngtech.co.il>
Subject: Re: How to use TROXY target only for specific outgoing interface
Date: Tue, 15 Jan 2013 20:54:04 +0200
Message-ID: <50F5A5CC.7090904@ngtech.co.il>
References: <1358067281.1669.27.camel@localhost.localdomain>    <alpine.LNX.2.01.1301131229450.31714@nerf07.vanv.qr>   <1358095169.1668.9.camel@localhost.localdomain>   <50F33624.3010208@ngtech.co.il>  <1358190735.2257.12.camel@localhost.localdomain>  <50F54560.4080200@ngtech.co.il> <1358275060.1792.8.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1358275060.1792.8.camel@localhost.localdomain>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Sebastian Poehn <sebastian.poehn@googlemail.com>
Cc: jengelh@inai.de, netfilter@vger.kernel.org

Very nice!!

Can you share this code by any chance?

Eliezer
On 1/15/2013 8:37 PM, Sebastian Poehn wrote:
> Thanks Eliezer. You are right. Creating a ipset containing all routes is
> the only thing you can do in PREROUTING. As this solution is not useable
> for me, I ended up writing a small piece of code taking a packet from
> NFQUEUE and performing a nexthop lookup and outgoing if and accordingly
> setting a fwmark.
>
> -m mark --mark LOCAL -j CONNMARK --set-mark LOCAL
> -m mark --mark WIDE -j CONNMARK --set-mark WIDE
> -m connmark --mark LOCAL -j ACCEPT
> -m connmark --mark WIDE -j TPROXY
> -m TPROXYTRAFFIC -j NFQUEUE
>
> Notice the usage of connmark so only one lookup is needed for a stream.

