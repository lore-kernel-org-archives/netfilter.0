From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: nftables: DNAT state in connection tracking?
Date: Tue, 15 Mar 2016 01:51:11 +0100
Message-ID: <20160315005111.GA23518@salvia>
References: <56D81A2B.2010704@babioch.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <56D81A2B.2010704@babioch.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Karol Babioch <karol@babioch.de>
Cc: netfilter@vger.kernel.org

On Thu, Mar 03, 2016 at 12:04:11PM +0100, Karol Babioch wrote:
> Hi,
> 
> in my old iptables setup I've used something like this in the FORWARD
> chain to allow traffic that has been redirected through DNAT beforehand
> (i.e. in the NAT PREROUTING table).
> 
> iptables -A FORWARD -m conntrack --ctstate DNAT -j ACCEPT
>
> This way I don't have to specify rules twice, which is not only a
> massive overhead, but also prone to errors. Apparently nftables does not
> know anything about the "DNAT" and "SNAT" states.
> 
> Is there a way to simulate something like this? Marking all packages
> that are redirected using DNAT in the nat table, and allowing all marked
> packages through in the forwarding chain, should work, shouldn't it? Is
> this in any way different to the iptables approach?

I think:

        nft add rule filter forward ct status dnat accept

should do the trick for you.
