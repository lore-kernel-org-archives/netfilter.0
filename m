Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc [91.216.245.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 041AA1EDA33
	for <netfilter@vger.kernel.org>; Tue, 22 Apr 2025 12:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.216.245.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745326436; cv=none; b=lqUHJ1hwaf3EJh1/iyqGYAMTp49CKow2fjGt0mXNYPtWZkQ0bFc6eJp/vkND+i3So9DXsU1jKI/TOf7Z+EjTpS7Nu1T2T4zaYCtoUv4zKj7kgwAxtEr/V0sY6gZaNVWuk1SqjTlpjOC67H3hz/W0lrKq9MxKiPukDwjmEkLIVrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745326436; c=relaxed/simple;
	bh=UEiG7Ucqcu3EJfxx2yRokWClg6PHe53HRn1MBuYgd2U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n7wFf6ufEowCS4Hrn1OtTo/UQumeHCNezkFIkgoIjaHW3quU9saCeyPRcDl84R6mqn6PO6z8ghvHzpx3DKXB5sxvHHCSdFOZp86TKLw4XFY4HvE1qJjls53iQZsIhFG/bjdGBx/sQO9FHTSZgO7SJYP63dmFY5m8YuwzbMzjsZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de; spf=pass smtp.mailfrom=strlen.de; arc=none smtp.client-ip=91.216.245.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=strlen.de
Received: from fw by Chamillionaire.breakpoint.cc with local (Exim 4.92)
	(envelope-from <fw@strlen.de>)
	id 1u7D8J-0001bc-UU; Tue, 22 Apr 2025 14:53:51 +0200
Date: Tue, 22 Apr 2025 14:53:51 +0200
From: Florian Westphal <fw@strlen.de>
To: Slavko <linux@slavino.sk>
Cc: netfilter ML <netfilter@vger.kernel.org>
Subject: Re: nftables RP filter and loopback
Message-ID: <20250422125351.GC2092@breakpoint.cc>
References: <905173BB-6745-4B59-8795-F9AC1E063A38@slavino.sk>
 <20250422114352.GA2092@breakpoint.cc>
 <622E44D0-8F02-4663-ABAD-01497C7D6692@slavino.sk>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <622E44D0-8F02-4663-ABAD-01497C7D6692@slavino.sk>
User-Agent: Mutt/1.10.1 (2018-07-13)

Slavko <linux@slavino.sk> wrote:
> + from 6.15 it will work even in input hook and lo as expected

Yes.

> + before 6.15 it doesn't work (properly) outside of prerouting
>   hook only with lo traffic (other ifaces works)

Yes.  fib works fine but not for loopback traffic.
