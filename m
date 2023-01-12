From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: [nft] src: allow for updating devices on existing netdev chain -
 Test result
Date: Thu, 12 Jan 2023 12:53:31 +0100
Message-ID: <Y7/0ux6h0jk7Fdk/@salvia>
References: <DD658C3B-2FB9-451E-893C-EE37ABDC678A@gmail.com>
 <72087908-1387-4D9F-A4D1-7DC5C276155E@gmail.com>
 <E87AFF49-E4A3-43B7-8799-C0A5E3591BCD@gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <E87AFF49-E4A3-43B7-8799-C0A5E3591BCD@gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Martin Zaharinov <micron10@gmail.com>
Cc: netfilter <netfilter@vger.kernel.org>, netfilter-devel@vger.kernel.org

On Thu, Jan 12, 2023 at 01:50:38PM +0200, Martin Zaharinov wrote:
> Hi Pablo 
> 
> Do you have time to check this ?

Busy here sorry.

Why don't you use batch mode to speed up registration rather than
triggering lots of forks, one after another?

for i in `seq 2 9999`; do echo "link add d$i type dummy" >> /tmp/batch; done     
for i in `seq 2 9999`; do echo "create chain netdev x int$i { type filter hook egress priority -500; policy accept; }" >> /tmp/ruleset.nft; done
for i in `seq 2 9999`; do echo "add chain netdev x int$i { devices = { d$i }; }" >> /tmp/ruleset.nft; done

I can't reproduce the bug you report here, you provide more detailed
description.
