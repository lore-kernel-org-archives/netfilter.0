From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Use ipset and conntrack with nftables
Date: Tue, 18 Aug 2020 12:13:52 +0200
Message-ID: <20200818101352.GB10691@salvia>
References: <CAPicJaE9qBs4NAKGzzKLU5GzNneJa6056WbdGn_RzVqKJhSrWg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAPicJaE9qBs4NAKGzzKLU5GzNneJa6056WbdGn_RzVqKJhSrWg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Amiq Nahas <m992493@gmail.com>
Cc: netfilter@vger.kernel.org

On Tue, Aug 18, 2020 at 03:14:04PM +0530, Amiq Nahas wrote:
> Hi Guys,
> 
> What would be the nftables equivalent for this rule:
> iptables -D FORWARD -m conntrack --ctorigsrc 172.5.1.123 --ctproto tcp
> -j MARK --set-mark 123

# iptables-translate -A FORWARD -m conntrack --ctorigsrc 172.5.1.123 --ctproto tcp
nft add rule ip filter FORWARD ct original protocol tcp ct original saddr 172.5.1.123 counter

> Also how can such a rule be made for a collection of different
> ip-addresses in an ipset.
> 
> So as an example: 172.5.1.123, 172.5.1.124, 172.5.1.125, 172.5.1.126
> all these ips are part of an ipset called 'myset'
>
> How can a rule like mentioned above be applied to a collection of ips
> denoted by an ipset 'myset'?

  nft add rule ip filter FORWARD ct original protocol tcp ct original saddr @myset counter

You have to define the set:

  nft add set ip filter myset { type ipv4_addr \; }
