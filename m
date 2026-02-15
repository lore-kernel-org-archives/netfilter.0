Received: from out.good-with-numbers.com (out.good-with-numbers.com [70.36.235.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C0F13C2E
	for <netfilter@vger.kernel.org>; Sun, 15 Feb 2026 03:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=70.36.235.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771124646; cv=none; b=DKIn6CzRuhC4sCBp8a7q4Kuxb8gUE5w2rYp0LfVqhu1D0vATTPfs4qjG6Xn0rj6tzcXBAM3BVkecUh9JoosXWvki/STvt6dLjJlgYsdwrb8NS+O1iRleKjc2jBOFVL/H6Oo3k+tud0ShWLkDBWiEoOBXrfmmqDFP9KpbPdVhqcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771124646; c=relaxed/simple;
	bh=E7U81INzIYdOpulXu0vyqVhMUQrs9nH64codIXPPzTQ=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RGUoaAY8MekGaqtkATIcLYy3U7MZ4xv9khktLKr/TxZHHY9ZKHFbTAgNKOBeS05nnDVwEbnJlPf0OHse/9/Ujl3bZ8C1whJeuQ+bFXjQe89rzgcwCA8f5DDWxOsm8uIjscH/fP/GPEVLMM0r1woBlFLnc8BTFhuub6IFJ66FXJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=good-with-numbers.com; spf=pass smtp.mailfrom=good-with-numbers.com; arc=none smtp.client-ip=70.36.235.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=good-with-numbers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=good-with-numbers.com
Date: Sun, 15 Feb 2026 02:57:00 +0000
From: Mike <debian@good-with-numbers.com>
To: netfilter@vger.kernel.org
Subject: standard for dropping in a modular setup?
Message-ID: <aZE1/DlyD/ZyoVa4@70-36-235-101.dsl.static.fusionbroadband.com>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I imagine that this has been asked before; please point me to the discussion
if so.

It's well known that if you attach two base chains to a hook, and they both
have a default drop policy, the lower priority chain will drop all the
packets that were accepted in the other chain.  So if you want to set up a
configuration that aims to be "modular", you have to address the question of
how to drop packets by default that were accepted by no chain.

One way to do that would be to have a lowest priority base chain that drops
packets that don't have a particular mark bit set.  Then set that mark bit
whenever you accept a packet in any other chain.  The bit then serves as a
"definitively accepted" flag.  All the chains would use the default "accept"
policy (but would not necessarily set this bit by default).

The problem is then which bit do you choose.  If all the rules are your own,
it doesn't matter.  But if you're trying to integrate your rules with those
from another source like firewalld, there needs to be some agreement on which
bit to use.

So the question: is there any such agreement?
