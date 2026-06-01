Received: from forward103d.mail.yandex.net (forward103d.mail.yandex.net [178.154.239.214])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0804F377031
	for <netfilter@vger.kernel.org>; Mon,  1 Jun 2026 12:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.214
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780316367; cv=none; b=PeqQHl07IbLScRAe7n3/ZwkJa1seY5TbzWn0+iwN5If0h50/JRYQLQtavVHNV10jPqE+hUmUY1NN/Y90JTXqxswJNhGsXcsUzlpLhB8X/Szqwu1WrbwYs/DnZEM9DpDsZL0Tf0NMVfhl+yaN4lZxI8aefYeOm4TSw0ajBBzERzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780316367; c=relaxed/simple;
	bh=AXZmhqrpZ4wmNNA/hjAhd4FywLm++GMdxKpKBP4Qb7A=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=tb8X2vYRsrKnPemt3iFgvBkqSl2wEEolemyT2JogV9PV2A7PXKFNlFQPhg7qBZIrsjAwR2j6Obo5AlWuSN+Ad5Of/KKg4lduDwK2JKew2yJR2u5VBgINqU9ySO3Pu4ShLGfPkXEG34ZaTSkETMeU2HQb5wxlw1644l8CuRY5oW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.pl; spf=pass smtp.mailfrom=yandex.pl; dkim=pass (1024-bit key) header.d=yandex.pl header.i=@yandex.pl header.b=lJCoXb8e; arc=none smtp.client-ip=178.154.239.214
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yandex.pl header.i=@yandex.pl header.b="lJCoXb8e"
Received: from mail-nwsmtp-smtp-production-main-94.klg.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-94.klg.yp-c.yandex.net [IPv6:2a02:6b8:c42:6c24:0:640:92d0:0])
	by forward103d.mail.yandex.net (Yandex) with ESMTPS id 8BF19C00AD
	for <netfilter@vger.kernel.org>; Mon, 01 Jun 2026 15:19:15 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-94.klg.yp-c.yandex.net (smtp) with ESMTPSA id CJdeUTle1eA0-ksbSw1kN;
	Mon, 01 Jun 2026 15:19:15 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.pl; s=mail;
	t=1780316355; bh=9k+rlhKGTu9bhS1FocSYjPL6yXJCMwD47Mr6N7nxa70=;
	h=Subject:From:To:Date:Message-ID;
	b=lJCoXb8eUGRd710/0segkZeyQ2ybmXmuUoQoINB+OyTCc2yxpcLAXpUX2Ln9octtw
	 ZA6PRUHGXLp8I6RzK4x38aF6RwqU6JBvmqWXKbwATS/2Qf1UyB1oa/OqawyagINfWP
	 GkFE7Y50CLnu7NZKsxRM2NYwt3yvri+JddUAIQt4=
Authentication-Results: mail-nwsmtp-smtp-production-main-94.klg.yp-c.yandex.net; dkim=pass header.i=@yandex.pl
Message-ID: <287a4898-f45f-417a-8b00-a44801139ae2@yandex.pl>
Date: Mon, 1 Jun 2026 14:19:12 +0200
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US-large
To: netfilter@vger.kernel.org
From: Michal Soltys <msoltyspl@yandex.pl>
Subject: [BUG?] success of adding interval elements to map/set depends on
 order
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Consider the following ruleset file:

#!/usr/bin/nft -f
flush ruleset

table ip Main {
   map snatmap {
     typeof oifname . ip saddr : ip saddr
     flags interval
     elements = {
       "egress0" . 10.192.0.88/29 comment "generic": 1.2.3.4,
       "egress0" . 10.192.0.93 comment "sip": 5.6.7.8,
     }
     comment "SNAT map"
   }
}

trying to load such ruleset fails with elements in this order will fail 
with:

/etc/nftables-test.conf:10:25-61: Error: Could not process rule: File exists
                         "egress0" . 10.192.0.93 comment "sip": 5.6.7.8,
                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

But if we swap the order of those two elements so the more narrow one is 
present earlier, the rules will load successfully. Same applies for 
manual adding via "nft add element". And same happens if it was a 
regular set instead of a map.

This should probably either fail in both cases, or succeed in both cases ?

Then there is also a question how that would/should behave in case of a 
map, e.g. would

snat ip to oifname . ip saddr map @snatmap comment "snat map"

use 1.2.3.4 or 5.6.7.8 for 10.192.0.93 ?
