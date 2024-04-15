Received: from river.fysh.org (river.fysh.org [87.98.248.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B55767C53
	for <netfilter@vger.kernel.org>; Mon, 15 Apr 2024 12:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=87.98.248.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713182976; cv=none; b=cnfabr9ohfHrWPCydoT0imDQXjghq7w7STq/5BAWs+0Oq86AXopX6FPEfznl3JDq2S+0FOCKT8r9mY4WhjAFJCt6Dhc3hgz0lv6syjxKMPwuQzTAimJxj674/kegJfq5wA+XI8Kq9+YCHypTZwyUKsAvcu91wZew8IfLqcADeL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713182976; c=relaxed/simple;
	bh=MU5zvJ2Lra7Io0ZXS32rTnmjChDlQvpf1eLqpHZoI6s=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XLdNwHkJ/GmL0wYQHUaO9XA0SXcVoyTbesuGFrfTWO1S0iy40wOWV9YvnTUVmAEwsOjyAKVWg3GO/NrSZQqDgLNgLW8JXYfW+ReE1qNEb06PMTtzOL499u3tXZQQ1gjQzOWtl6XlRwKl8mdYRcVzN93bWgp0v/dsmb7HcmBqdCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=miggy.org; spf=pass smtp.mailfrom=miggy.org; dkim=pass (1024-bit key) header.d=miggy.org header.i=@miggy.org header.b=Uon/kJGM; arc=none smtp.client-ip=87.98.248.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=miggy.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=miggy.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=miggy.org header.i=@miggy.org header.b="Uon/kJGM"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=miggy.org;
	s=20170316; h=Content-Type:MIME-Version:Message-ID:Subject:To:From:Date:
	Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=IWyUTBWQ9mNkkgrhREsVkkkB7uJtnEbQT+rICQ0HmU4=; b=Uon/kJGMEdwAyLNKcJOMdEhs7R
	jtecKZRuDscBB4Vo4nytRhrh0xM/jS0yAiPTPj6Uo7PUv+CLOh3BSMlve0wBGcV0o6xteZVl1RX1l
	p0JLSo4m4B0yYO1Y7jjJhc7hZlyqn1sY/v803aGcHLGschKHUV+zGHmRYW9tPM/XiXKQ=;
Received: from athan by river.fysh.org with local (Exim 4.96 #2 (Debian))
	id 1rwL9O-00EPza-1J
	for netfilter@vger.kernel.org;
	Mon, 15 Apr 2024 13:09:30 +0100
Date: Mon, 15 Apr 2024 13:09:30 +0100
From: Athanasius <netfilter.org@miggy.org>
To: netfilter@vger.kernel.org
Subject: NFQUEUE usage and interaction with later chain rules
Message-ID: <Zh0Y-j3NAbRmAi03@fysh.org>
Mail-Followup-To: netfilter@vger.kernel.org
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

  I'm in the middle of trying to implement some firewall bans based on
GeoIP data.  It seemed that implementing an NFQUEUE userspace helper
to do the lookups and decision making was the most feasible solution,
but I have run into some issues.  I can probably work around them,
but it does make this setup more fragile than I'd like.

  So, I'd like to ensure I'm properly understanding some things.

  1. The only practical verdicts the userspace helper can return are
  ACCEPT or DROP.  Checking through some documentation, examples, and
  kernel code I've come across 'STOLEN', 'QUEUE' and 'REPEAT', but I
  cannot find any actual documentation on what these might achieve.

  2. There appears to be no way to have an NFQUEUE rule act in a manner
  where the userspace verdict can cause subsequent rules in the chain to
  be considered.

    I'd specifically like my userspace helper to be able to say 'DROP',
  but otherwise allow rule evaluation to continue in the chain, rather
  than blindly accepting all else.

    If I could cause rule evaluation to jump to another chain that would
  also be acceptable, simply placing rules that would normally be later
  in the current chain into that one.

As a result I'm going to have to very carefully consider the nature and
position of my iptables chain rules:

  1. Anything else that should cause a packet to be DROPPED must have its
  rules come before the NFQUEUE one, else the 'not DROP' decision from
  the helper will cause packets to be accepted that should not be.

  2. Any rules that would otherwise cause ACCEPT of a packet need to
  come after the NFQUEUE one, else they're going to negate the filtering
  it implements.

  3. Because once the NFQUEUE rule is matched no other rules will even
  be considered, I need to construct this rule so that it matches only
  packets that don't need to be considered by subsequent rules.

    In my case this would mean, e.g. only matching on specific port
  numbers and forgoing usually later rules that would affect such
  packets.

  Oh, also I found `--queue-bypass` to ensure it's not a "fail close" if
there's no userspace helper listening to the queue... but this literally
turns the rule into an ACCEPT, rather than passing evaluation to later
rules.  Presumably the 'fail open' socket option, to not cause all
packets to be dropped if the queue buffer is filled, has the same issue.
It's then blind ACCEPT rather than "let later rules look at the packet".

  Is any of my understanding in error?  Can I actually implement this
how I'd prefer, with later rules being evaulated upon some specific
verdict returned from userspace ?

P.S. The 'Mailing Lists' part of https://netfilter.org/ is out of date.
It still points to the old Majordomo pages on vger.kernel.org.
Attempting to subscribe there elicited a reply stating to use
https://subspace.kernel.org/vger.kernel.org.html instead.
-- 
- Athanasius (he/him) = Athanasius(at)miggy.org / https://miggy.org/
                  GPG/PGP Key: https://miggy.org/gpg-key
	   "And it's me who is my enemy. Me who beats me up.
Me who makes the monsters. Me who strips my confidence." Paula Cole - ME
