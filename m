Received: from mail.inliniac.net (static-27.netfusion.at [83.215.238.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86F1F13BC0C
	for <netfilter@vger.kernel.org>; Sun,  9 Feb 2025 11:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.215.238.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739098827; cv=none; b=PS9nnLwvu8gL7uUHeX/HC4lmMXWknPfqtIl540ORQSuw1d4VS80MzKBB+FYCvynDj6DjmFGxg0wRHI7dMHQCtcp25ywlDipNYCwipvbARE41sLG0ENp3AMHCtb5JAFUQjF+VVtMeDmOyx72N7P7O250BK21/vHNAFhJynfZ7YQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739098827; c=relaxed/simple;
	bh=gWkiJ3YvrPVAvDUmkgyux6XqqEg0K/H0k8TB9o6lMdU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=r/Va0yfac5qTJLlX9nL2JqJ4j4A+QgPKKpv6V9jgQpF1D3gsAdqDGiUHmo/wpgg4GJ7iqX64u71S7x100eZzXcRRiIRRqkqfBg3thE9/lfeBRr4wzLSbccsRRTByMVr6Oi7MlP6gz8DmjWkVZnbz0gvNPXKDqpiDlOLZOVt7CHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inliniac.net; spf=pass smtp.mailfrom=inliniac.net; arc=none smtp.client-ip=83.215.238.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inliniac.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inliniac.net
Received: from [192.168.0.5] (82-169-178-200.fixed.kpn.net [82.169.178.200])
	(Authenticated sender: victorlists)
	by mail.inliniac.net (Postfix) with ESMTPSA id 9353E297
	for <netfilter@vger.kernel.org>; Sun,  9 Feb 2025 12:00:20 +0100 (CET)
Message-ID: <d33b9a31-2e67-4983-b1e2-549647256b3d@inliniac.net>
Date: Sun, 9 Feb 2025 11:58:56 +0100
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: named counters vs flush ruleset
To: netfilter@vger.kernel.org
References: <5f970dae-b21b-4837-9e96-955bedbdf69f@inliniac.net>
 <Z6fRedYWO14e0l7e@calendula>
Content-Language: en-US, nl
From: Victor Julien <lists@inliniac.net>
In-Reply-To: <Z6fRedYWO14e0l7e@calendula>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08-02-2025 22:49, Pablo Neira Ayuso wrote:
> On Sat, Feb 08, 2025 at 03:35:27PM +0100, Victor Julien wrote:
>> Hi all,
>>
>> I'm working on finally supporting nftables in Vuurmuur.
>>
>> In the iptables support, I have special rules per interface to get per iface
>> packets and bytes. Essentially my tool reads the iptables -vnL output and
>> parses all the things. When a user applies a ruleset change, Vuurmuur reads
>> the most current values, constructs a new input file to `iptables-restore`
>> and loads the rules. This works but is tedious, and also lacks some
>> precision as we are not counting the packets/bytes while Vuurmuur is
>> working.
>>
>> In the nftables support, I'm more or less looking at the same logic. The
>> ruleset is build as a .nft file that is loaded with `nft -f`.
>>
>> Now I found the the named counter feature, and also the json output `nft -j
>> list counters`. This combination seems perfect.
>>
>> I guess my main question is if we can make these counters persistent
>> somehow. As part of the ruleset reload, I issue a `flush ruleset`, which
>> also removes the counters.
>>
>> So can we make counters survive a `flush ruleset`, or is there a better way
>> to load a new ruleset?
> 
> Would it work for you to destroy all other existing objects (not the
> table and counters) instead?

Thanks Pablo. Here's what I'm thinking now:

I create an additional table "vrmr_accounting"

table ip vrmr_accounting {
         counter vrmr_enp1s0 {
                 packets 17546 bytes 3901328
         }

         chain INPUT {
                 type filter hook input priority -100; policy accept;
                 iifname "enp1s0" counter name "vrmr_enp1s0" comment 
"lan-nic"
         }

         chain OUTPUT {
                 type filter hook output priority dstnat; policy accept;
                 oifname "enp1s0" counter name "vrmr_enp1s0"
         }

         chain FORWARD {
                 type filter hook forward priority -100; policy accept;
                 iifname "enp1s0" counter name "vrmr_enp1s0"
                 oifname "enp1s0" counter name "vrmr_enp1s0"
         }
}

Then I create regular a regular filter table, where the normal rules are 
created. My assumption is that due to the lower priority value the 
`vrmr_accounting` table goes first in the processing.

In my reload instead of a `flush ruleset`, I do:

# clear existing tables/rules
destroy table ip filter
...
add table ip filter
add chain ip filter INPUT { type filter hook input priority 0; policy 
drop; }
add chain ip filter OUTPUT { type filter hook output priority 0; policy 
drop; }
add chain ip filter FORWARD { type filter hook forward priority 0; 
policy drop; }

...
# clear accounting chains (incl rules), but not the counter itself
add table ip vrmr_accounting
destroy chain ip vrmr_accounting INPUT
destroy chain ip vrmr_accounting OUTPUT
destroy chain ip vrmr_accounting FORWARD
add chain ip vrmr_accounting INPUT { type filter hook input priority 
-100; policy accept; }
add chain ip vrmr_accounting OUTPUT { type filter hook output priority 
-100; policy accept; }
add chain ip vrmr_accounting FORWARD { type filter hook forward priority 
-100; policy accept; }
...
add counter ip vrmr_accounting vrmr_enp1s0
add rule ip vrmr_accounting INPUT iifname "enp1s0" counter name 
vrmr_enp1s0 comment lan-nic
...

This appears to leave the counters intact.

Does this make sense to you?

Cheers,
Victor

-- 
----------------------------------------------
Victor Julien
https://www.inliniac.net/
PGP: https://www.inliniac.net/victorjulien.asc
----------------------------------------------

