Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc [91.216.245.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C13EF15CD74
	for <netfilter@vger.kernel.org>; Mon, 23 Feb 2026 19:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.216.245.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771874651; cv=none; b=RodLYYnkot25y4vXPx6ci4aDRASkgY+8RQ2qYQQvCOiPQyge4drsbH64OKL+f56xybVu8/xxnUqBMoTkRh8omzo7RsOZF9x9E2atcSimZrsNXE1F5AeKR95H1lpEf3FHTcSM6n9klMtByCb/06xI//QdC6TQCnPX6Y0E69xszVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771874651; c=relaxed/simple;
	bh=pmAWm7fEHc9iBkr3rZ0eUnR4sRGOwtZEqfZd/KWFO4I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dWP80hK8+9Xofkc2GBkGhe0rBgmoguyRxS9wLpAOZvJd7g3yOojCIUYaQJfbV0KztTiUL1psIOM0TtUp4WWAORRJeARtSZpO8//xXd6TmsA4VT7bldMGzGeW+wXyXCDKiZkhyA4+EC016+aQwN6X/ixUgf3ldAgbKrUxemMFIWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de; spf=pass smtp.mailfrom=strlen.de; arc=none smtp.client-ip=91.216.245.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=strlen.de
Received: by Chamillionaire.breakpoint.cc (Postfix, from userid 1003)
	id A723D60CFC; Mon, 23 Feb 2026 20:24:07 +0100 (CET)
Date: Mon, 23 Feb 2026 20:24:07 +0100
From: Florian Westphal <fw@strlen.de>
To: Michal Soltys <msoltyspl@yandex.pl>
Cc: netfilter@vger.kernel.org
Subject: Re: [BUG] "ether type ip" forgotten/implied when listing rules for
 'netdev' family
Message-ID: <aZypV4D7kP0lMwXx@strlen.de>
References: <6dbbb6b3-da22-4a09-8de7-ec2dc60d179f@yandex.pl>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6dbbb6b3-da22-4a09-8de7-ec2dc60d179f@yandex.pl>

Michal Soltys <msoltyspl@yandex.pl> wrote:
> While testing the behavior of early filtering in netdev / ingress, I 
> noticed something that possibly looks like a bug.

Yes, this is a bug, both in nftables and in the tests/py/netdev
directory, at least one of the existing files needs to be expanded
to trigger this bug for regression testing.

Not sure if I can get to it this week but I will put it on my todo list
in case noone else can pick this up.
