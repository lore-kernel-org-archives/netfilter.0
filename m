Received: from mail3.g1.pair.com (mail3.g1.pair.com [66.39.3.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA8D182B4
	for <netfilter@vger.kernel.org>; Sat, 24 Aug 2024 04:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=66.39.3.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724474356; cv=none; b=u5Gi05V/iO43s5iTTvn64eE2g3VjCpHg45WCK1b54aSLTHq+YS0egAT3Emh5Jz0Ejt24IRTqZh7S15ty8rbGU6EbnN3SzKy0sAQ27/dRyE6j142+1dj+vZ2KpT8hmwM3wFB4uyYZT3jQEEXD5EqBwigXktMST14jq2gHGMiYWWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724474356; c=relaxed/simple;
	bh=Td9U0CQ8t0c/qdLw0RcSxx4WvLFli8pmj8kGoH9Q9xg=;
	h=Date:From:To:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=qgGzCUBe8UGt1SROj+66PLxBLiJN6tnb8scmDP8vjnLXvJwkt1wm5y8iveaJbgyOZt5TTI/6mir+BbxK5Q8Jmr6j0xSb8xf0Xkii0NLI8ycuHRQtsklcjUdPfLo7WzVmzSf5+zeGnKo8BXoz6FOMIBdwSxt5BxwwOd5ziPQwAxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fourthriver.com; spf=pass smtp.mailfrom=fourthriver.com; dkim=pass (2048-bit key) header.d=fourthriver.com header.i=@fourthriver.com header.b=jWv7LQbH; arc=none smtp.client-ip=66.39.3.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fourthriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fourthriver.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fourthriver.com header.i=@fourthriver.com header.b="jWv7LQbH"
Received: from mail3.g1.pair.com (localhost [127.0.0.1])
	by mail3.g1.pair.com (Postfix) with ESMTP id 1277DA1C465
	for <netfilter@vger.kernel.org>; Sat, 24 Aug 2024 00:39:12 -0400 (EDT)
Received: from macmini (unknown [172.56.216.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail3.g1.pair.com (Postfix) with ESMTPSA id C022790845D
	for <netfilter@vger.kernel.org>; Sat, 24 Aug 2024 00:39:11 -0400 (EDT)
Date: Sat, 24 Aug 2024 00:39:02 -0400
From: Brian Sammon <bds@fourthriver.com>
To: netfilter@vger.kernel.org
Subject: Re: Understanding output from "nft list"
Message-Id: <20240824003902.7c838f9e49773fa44b7d037d@fourthriver.com>
In-Reply-To: <a4f113dd-9749-4fd8-bb9e-21eff30370dc@app.fastmail.com>
References: <20240823185036.85bd988a1ee2baab2f73b307@fourthriver.com>
	<a4f113dd-9749-4fd8-bb9e-21eff30370dc@app.fastmail.com>
Reply-To: netfilter@vger.kernel.org
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.32; i686-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fourthriver.com; h=date:from:to:subject:message-id:in-reply-to:references:reply-to:mime-version:content-type:content-transfer-encoding; s=pair-202402142043; bh=lEZBnqBuGwQBJazE8i447eI98AD9HKqSfEaPEXkFEBY=; b=jWv7LQbHSur/H7K7T8qI9G34vbldlGGIkB3+exlUy/Jm3OKzjH/zTchc0JMj1Bnt0DevFYMVgaLviyfp2pqHim59Ia9JVtg2gBOcjpT5WWO6+EtzAMLB+hGCBkbPSZ/5aUE4nPD03HRgbe64Wkicr/iAxFGlfDcewfZedQl6FB2Tk6xEAaLIKOvDGsk7AHy9vwuXxItwpzYrC0kxEdEIiACPecXpHiseTN8ohKH0SrjcJ0POfeXf3Jy3YG/9GF4I9kLNQ664E+HyW9S6YNs6hp9z9BdYuegIFykSfJ5MbTAJvmMQlRgBHK/60uNGb3LTXt6VQWBeS3wEUPGnng5n+A==
X-Scanned-By: mailmunge 3.11 on 66.39.3.170

On Sat, 24 Aug 2024 01:08:53 +0100
"Kerin Millar" <kfm@plushkava.net> wrote:

> > The first questions I have:
> > Can/should I assume that each line in the output of "nft list" is a 
> > separate, uh... "thing"[1] that can be (human-)parsed independently 
> > from every other line?
> 
> No, though it is possible to compose rulesets in the iptables-esque 
> fashion that you imply. That is, by writing consecutive commands of the 
> form of "add table", "add chain", "add rule" and so forth. However, the 
> nft(8) utility does not have an option to list the loaded ruleset in that 
> way. Instead, it always lists the ruleset in the declarative style.

I'm wondering if there's a misunderstanding here.

I'm thinking that the output of "nft list" could be like (90% of) python code, where a line like
    a = b + c
can be understood (somewhat) in isolation, even though you don't have the context to know what a, b, and c are.

Or, the output of "nft list" could be more like SQL, where you can have lines like
  SELECT x FROM
      or
  users INNER
which are each, an incomplete "thing", but can be part of a valid statement.

Is the "nft list" output more like python, or more like SQL?

