From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: nftables vmap concatenations with interval
Date: Tue, 27 Sep 2016 21:11:01 +0200
Message-ID: <20160927191101.GA3195@salvia>
References: <11357773.LdaEAIBM0O@nemmerle>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <11357773.LdaEAIBM0O@nemmerle>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Martin Bednar <martin@serafean.cz>
Cc: netfilter@vger.kernel.org

On Tue, Sep 27, 2016 at 05:10:45PM +0200, Martin Bednar wrote:
> hi, 
> 
> using nftables, I want to create a vmap : 
> 
> map mymap {type ipv4_addr . iface_index : verdict }
> 
> I'd like the first argument to be an ip range/ network, so that I can add like 
> so :
> nft add element inet filter mymap { 172.18.0.1/24 . eth0 : accept }
>
> nft add element inet filter mymap { 172.18.0.1-172.18.0.255 . eth0 : accept }
> 
> Any hints as to what to do it?

nft add table inet filter
nft add map inet filter mymap { type ipv4_addr . iface_index : verdict \; }
nft add element inet filter mymap { 172.18.0.0  . eth0 : accept }
nft add rule inet filter forward ip saddr and 255.255.255.0 . iif vmap @mymap
                                 ^^^^^^^^^^^^^^^^^^^^^^^^^^

The idea here is to mask the address, then add to the set the result
of this operation, thus, 172.18.0.0
