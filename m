From: Robert White <rwhite@pobox.com>
Subject: Re: Are "device chains" a real thing?
Date: Wed, 8 Feb 2017 17:15:07 +0000
Message-ID: <d11a96cd-d427-9556-1b2d-cd57eb3430cf@pobox.com>
References: <43d968b3-03a8-1872-63bf-5bedad33ecba@pobox.com>
 <20170208090528.GA2054@salvia>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20170208090528.GA2054@salvia>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org




On 02/08/17 09:05, Pablo Neira Ayuso wrote:
>  # nft add table netdev x
>  # nft add chain netdev x y { type filter hook ingress device eth0 priority 0\; }

Device specific chains for ingress is cool.

Device specific chains for prerouting and postrouting simplify the heck 
out of NAT for complex systems since I've got boxes with eight NICs 
(okay, it's two four-port NICs) in various bridges and only one 
interface that does NAT. So that's a lot of null (all tests fail) 
traversals of those chains for no purpose on those other NICs.

I trim that down by using a single rule such as

"iif ext0 jump DNAT_ext0"

to keep all the tests out of the pat for the internal bridges then put 
all the elaborate stuff in that secondary chain. So it's not a killer.

