Received: from mail.inliniac.net (static-27.netfusion.at [83.215.238.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB16D1D5CDE
	for <netfilter@vger.kernel.org>; Sun,  2 Mar 2025 12:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.215.238.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740917367; cv=none; b=ucT9teXdu5Ux+CdngX0jwHOUIhahwlaS+2RnC345hwMwSf4Viu1tdPWRJKcH6YFo8jAAhSh4Bd1JDDpN33soPoOqwtmIcjXYyOr/l3vnPG/FITPvNbTFcXp1lBwKBlgfPJCKbFcfVwE5d1Rrq6J9QoqfljucWUs2dPuFXqGQQ0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740917367; c=relaxed/simple;
	bh=Fne79k03R6lRaLU70OyKtVHABpVFDomoAoXb41sjAww=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D6Tc/RHVCk7cUGdXbePXv1jPHXyVSZbzZDvfArP1dslM0xdpKj1o+Zp8/YovUep1S2rKuLdZXRmLIe6HbJvF6DVZsaMoL9tqbwL7j7/kuUxqq4i+L8DXAt96nvCadtGbsA5SV+PWNPfP+Mu5lWsKn70oVwXQPZ2I8IoRyQ2FKzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inliniac.net; spf=pass smtp.mailfrom=inliniac.net; arc=none smtp.client-ip=83.215.238.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inliniac.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inliniac.net
Received: from [192.168.0.5] (82-169-178-200.fixed.kpn.net [82.169.178.200])
	(Authenticated sender: victorlists)
	by mail.inliniac.net (Postfix) with ESMTPSA id B9BDC108;
	Sun,  2 Mar 2025 13:04:04 +0100 (CET)
Message-ID: <5abf321f-3950-4d0e-bdd5-ab2f0d773f24@inliniac.net>
Date: Sun, 2 Mar 2025 13:01:28 +0100
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: named counters vs flush ruleset
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org
References: <5f970dae-b21b-4837-9e96-955bedbdf69f@inliniac.net>
 <Z6fRedYWO14e0l7e@calendula>
 <d33b9a31-2e67-4983-b1e2-549647256b3d@inliniac.net>
 <Z75WkjyCSmptettz@calendula>
Content-Language: en-US, nl
From: Victor Julien <lists@inliniac.net>
In-Reply-To: <Z75WkjyCSmptettz@calendula>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Pablo,

On 26-02-2025 00:47, Pablo Neira Ayuso wrote:
>>>> I'm working on finally supporting nftables in Vuurmuur.
>>>>
>>>> In the iptables support, I have special rules per interface to get per iface
>>>> packets and bytes. Essentially my tool reads the iptables -vnL output and
>>>> parses all the things. When a user applies a ruleset change, Vuurmuur reads
>>>> the most current values, constructs a new input file to `iptables-restore`
>>>> and loads the rules. This works but is tedious, and also lacks some
>>>> precision as we are not counting the packets/bytes while Vuurmuur is
>>>> working.
>>>>
>>>> In the nftables support, I'm more or less looking at the same logic. The
>>>> ruleset is build as a .nft file that is loaded with `nft -f`.
>>>>
>>>> Now I found the the named counter feature, and also the json output `nft -j
>>>> list counters`. This combination seems perfect.
>>>>
>>>> I guess my main question is if we can make these counters persistent
>>>> somehow. As part of the ruleset reload, I issue a `flush ruleset`, which
>>>> also removes the counters.
>>>>
>>>> So can we make counters survive a `flush ruleset`, or is there a better way
>>>> to load a new ruleset?
>>>
>>> Would it work for you to destroy all other existing objects (not the
>>> table and counters) instead?
>>
>> Thanks Pablo. Here's what I'm thinking now:
>>
>> I create an additional table "vrmr_accounting"
>>

[...]

>>
>> Then I create regular a regular filter table, where the normal rules are
>> created. My assumption is that due to the lower priority value the
>> `vrmr_accounting` table goes first in the processing.
> 
> I see, you are using a table that contains rules for metering only.

Do you see disadvantages for this?


>> In my reload instead of a `flush ruleset`, I do:
>>
>> # clear existing tables/rules
>> destroy table ip filter
>> ...
>> add table ip filter
>> add chain ip filter INPUT { type filter hook input priority 0; policy drop;
>> }
>> add chain ip filter OUTPUT { type filter hook output priority 0; policy
>> drop; }
>> add chain ip filter FORWARD { type filter hook forward priority 0; policy
>> drop; }
> 
> Maybe you could use?
> 
>    flush table ip filter
> 
> to leave the table and chain in place. Similar semantics to
> iptables -F.

I kind of want to avoid reading which tables and chains already exist, 
and craft a .nft file that will do "the right thing" when loaded into a 
fresh system or when loaded as a ruleset "reload".

`flush table ip filter` is invalid if `ip filter` doesn't exist yet, 
while `destroy table ip filter` works even if `ip filter` doesn't exist.

A create + flush also doesn't work, as create fails if the table already 
exists.

So far this is the only scheme I've been able to come up with that 
allows me to "blindly" load a rules, so w/o caring about whether the 
relevant tables and chain exist or not.

Cheers,
Victor

-- 
----------------------------------------------
Victor Julien
https://www.inliniac.net/
PGP: https://www.inliniac.net/victorjulien.asc
----------------------------------------------

