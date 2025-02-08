Received: from mail.inliniac.net (static-27.netfusion.at [83.215.238.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77CCD182BC
	for <netfilter@vger.kernel.org>; Sat,  8 Feb 2025 14:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.215.238.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739025841; cv=none; b=KgeUkNgKphFJeo3LkQjgVyINMA0wzFcUP5g/7oFH75611HhFjKnftPD+xaTKzQNsnLjonozcSzh24oWv3XZoO1Ov5gx262/TIYnNr5Pc7Ve5VF5vwQrsO6A2gpe4stU96JlHTYzDyZeBSJQc8Fj80LiCInPwKBcYEdZHKATbhBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739025841; c=relaxed/simple;
	bh=1TGqqi04hZjX/Ef5Zo7alnb+k59uwmc7+S0sdNn7UiY=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=SK6NkWI9uKdWgMFrMzYJdW5HHfyKmgUNdoUFJfIilhNqYhZPgvNhiEDSiFiZpOTiFgK/Tszot5KOaKyPkl7oE89RT4PzLdxt5Sn6l+5zR2+g0pmSLv8JBRyaUxYN7No6QUH7inCa3Ac/FFVWtNT13xjy5aauEkncz/yX0Jkw+kA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inliniac.net; spf=pass smtp.mailfrom=inliniac.net; arc=none smtp.client-ip=83.215.238.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inliniac.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inliniac.net
Received: from [192.168.0.5] (82-169-178-200.fixed.kpn.net [82.169.178.200])
	(Authenticated sender: victorlists)
	by mail.inliniac.net (Postfix) with ESMTPSA id A60E4297
	for <netfilter@vger.kernel.org>; Sat,  8 Feb 2025 15:36:51 +0100 (CET)
Message-ID: <5f970dae-b21b-4837-9e96-955bedbdf69f@inliniac.net>
Date: Sat, 8 Feb 2025 15:35:27 +0100
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, nl
To: netfilter@vger.kernel.org
From: Victor Julien <lists@inliniac.net>
Subject: named counters vs flush ruleset
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,

I'm working on finally supporting nftables in Vuurmuur.

In the iptables support, I have special rules per interface to get per 
iface packets and bytes. Essentially my tool reads the iptables -vnL 
output and parses all the things. When a user applies a ruleset change, 
Vuurmuur reads the most current values, constructs a new input file to 
`iptables-restore` and loads the rules. This works but is tedious, and 
also lacks some precision as we are not counting the packets/bytes while 
Vuurmuur is working.

In the nftables support, I'm more or less looking at the same logic. The 
ruleset is build as a .nft file that is loaded with `nft -f`.

Now I found the the named counter feature, and also the json output `nft 
-j list counters`. This combination seems perfect.

I guess my main question is if we can make these counters persistent 
somehow. As part of the ruleset reload, I issue a `flush ruleset`, which 
also removes the counters.

So can we make counters survive a `flush ruleset`, or is there a better 
way to load a new ruleset?

Thanks!
Victor

-- 
----------------------------------------------
Victor Julien
https://www.inliniac.net/
PGP: https://www.inliniac.net/victorjulien.asc
----------------------------------------------


