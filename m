From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: nftables set - network/netmask
Date: Thu, 1 Feb 2018 12:19:17 +0100
Message-ID: <20180201111917.vefjklcrgnubivmr@salvia>
References: <39fdc646-1ef4-a42c-c9f1-705c18b709ec@metu.edu.tr>
 <beb5146e-837f-fb5d-c766-e69547a6287f@metu.edu.tr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <beb5146e-837f-fb5d-c766-e69547a6287f@metu.edu.tr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: hdemir <hdemir@metu.edu.tr>
Cc: netfilter@vger.kernel.org

On Thu, Feb 01, 2018 at 10:50:53AM +0300, hdemir wrote:
> Hi,
> 
> I found this conversation;
> 
> https://www.spinics.net/lists/netfilter/msg56947.html
> 
> It would be useful to have NET function as ipset has.
> 
> 
> hash:net,net
> hash:net,port,net
> hash:net,iface

It's already possible, eg.

nft add table filter
nft add chain filter x
nft add set filter whitelist2 { type ipv4_addr . inet_proto . inet_service . ipv4_addr \;}
nft add element filter whitelist2 { 10.1.1.0 . tcp . 2 . 1.1.1.1 comment "test2" }
nft add rule filter x ip saddr and 255.255.255.0 . ip protocol . tcp dport . ip daddr @whitelist2 counter

So the trick is to do this from rules:

nft add rule filter x ip saddr and 255.255.255.0 . ip protocol . tcp dport . ip daddr @whitelist2 counter
                               ^^^^^^^^^^^^^^^^^

We should support /24 (cidr notation) instead at some point though,
this just needs some code in the userland.
