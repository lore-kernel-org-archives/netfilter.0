Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc [91.216.245.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A7A40C03
	for <netfilter@vger.kernel.org>; Sat, 28 Jun 2025 12:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.216.245.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751113822; cv=none; b=K86L12IH+NysgYz7O9dY9+nzwieKgrzKpI2px10TQna/vbnst4WPko+ubJLf4QomkhTC4Ju8b/QpCJdJpTOUxefsy4fAgWX1b4XlYEc/YJlN4WRcbt4+Ao9zGaxTgQyfpmZ4XTYc+CstE80rbM1a1aInOzaMgnSD8+4iX+SIS1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751113822; c=relaxed/simple;
	bh=wfCkWc7Yt9JKrtapaVyifzCpMn2E7G3OmxM/qm1jcIk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cXJY+H+MGkyrjstlIgxmvf/PVB59LJwXQbfqOyc66cbeaZNg5NF2bYuFSyI85FPp1ZumGEISXlzFDiusY8kQkqr3bwFqCT0sHdVMsqueOt3GjCXk/4h8aKvdC2b53fl2yV8zk06P9Cd1rdKRp76wqYpxk5rY7jO8VpPujXwjfkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de; spf=pass smtp.mailfrom=strlen.de; arc=none smtp.client-ip=91.216.245.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=strlen.de
Received: by Chamillionaire.breakpoint.cc (Postfix, from userid 1003)
	id EE098602AA; Sat, 28 Jun 2025 14:30:18 +0200 (CEST)
Date: Sat, 28 Jun 2025 14:30:13 +0200
From: Florian Westphal <fw@strlen.de>
To: sontu mazumdar <sontu21@gmail.com>
Cc: netfilter@vger.kernel.org
Subject: Re: Element-Level Logging Support in nftables Sets
Message-ID: <aF_gVaCX8789SYVl@strlen.de>
References: <CANgxkqwQpVQDM7AP20A0pCsGkPhte9tr-1gwdJJRVxqB9M2nng@mail.gmail.com>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANgxkqwQpVQDM7AP20A0pCsGkPhte9tr-1gwdJJRVxqB9M2nng@mail.gmail.com>

sontu mazumdar <sontu21@gmail.com> wrote:
> I am exploring whether it's possible to add logging support at the
> element level within an nftables set. Specifically, I'm looking for
> functionality where an individual element in a set can trigger a log
> when it's matched—something like the following:
> 
> table inet mytable {
> set s {
> typeof ip saddr
> counter
> elements = { 1.1.1.1 log prefix "element1" level info,
>                      1.1.1.3 log prefix "element2" level info }
>         }
> }

Could be done, however, typically "log" is combined with "limit" to
prevent log flooding.

> I understand that nftables sets currently do not support logging at
> the element level. Is there any plan to introduce this feature in
> future releases?

Not that I know of.  Whats your use case?
