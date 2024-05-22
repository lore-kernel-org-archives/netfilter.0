Received: from mail.muppetz.com (mail.muppetz.com [142.93.19.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 370B554720
	for <netfilter@vger.kernel.org>; Wed, 22 May 2024 09:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=142.93.19.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716371036; cv=none; b=NYwn0p/V1mAauY1ZV9R4BTFzNESbBLWUcgwboxHzDA8Uq2HaTIvAGl5b34rxVOilJTmlf9keaGewP08Lm0PYwDYXzSpenRguQdqfo+vRL3enO7ilrSqR87d7JpnzDbbMgWrodSU96HFkY4ZoDLam+QpjYu1oDklFUSEB1kLnr+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716371036; c=relaxed/simple;
	bh=RY6M9U1St7inUJEzyWUe8/KqueJMwMnYdsWbItD8WIA=;
	h=MIME-Version:Date:From:To:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=OeTwxDfgg3ZY8NhdDtPQMTr7i3ZvrNClF4xUGkrNrD32CfKn5/qwa1hzlnzDkRhW/gwqV4e3MYo/2r9GQ1Ab3ipuUwG7ndbZV8F2BjobNoHfYz4f6kpKvPwLTd8PdAUbb7eDj0fCUwGXYff2h0l305GOvyb5BDnMT3PUbupNfW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=muppetz.com; spf=pass smtp.mailfrom=muppetz.com; dkim=pass (2048-bit key) header.d=muppetz.com header.i=@muppetz.com header.b=eNUz2JSI; arc=none smtp.client-ip=142.93.19.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=muppetz.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=muppetz.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=muppetz.com header.i=@muppetz.com header.b="eNUz2JSI"
Received: from mail.muppetz.com (localhost [127.0.0.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	(Authenticated sender: tim)
	by mail.muppetz.com (Postfix) with ESMTPSA id D1B4C20037
	for <netfilter@vger.kernel.org>; Wed, 22 May 2024 21:43:51 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=muppetz.com; s=mail;
	t=1716371031;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g5dJVfPSEfzrjlwuurjQaXEyKAi9IHV3p3dwxbzo6vY=;
	b=eNUz2JSIwP8D9rmzTTZU3PL7n/lhjNyMipfrD8qV7ZDCdU4xxR6LBmN4gwC3rpuECTGSb8
	jQq0WdMFSGCFARhqFEC0MgKdO/uK99jdYgtzQcM8wkka74w8TOkBamEWcgrZUEC2L7dhI2
	iVoe4QzTekXfCDjRWv+Hvm+qbj5bfEiMN1RlRS/7zLZCfqKZcwHfbmftbKU5aB7yfiAGIN
	vDpilO7ClzAdW2k3vRjz7zzND0TyyfL75EDK7N9dsl+xoSbcR2aqAnkj+fmvna/5BO2cV0
	zdGdG/ZW8oU3fhKMzcxSi9OeIAEGvkzKfue0Y0DSFeahIHVCRmhvvZtGd+IHeA==
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 22 May 2024 21:43:51 +1200
From: Tim Harman <tim@muppetz.com>
To: netfilter@vger.kernel.org
Subject: Re: Clash Resolve Counter Increasing
In-Reply-To: <7550008a3fc0a6c745272eded7fa686f@muppetz.com>
References: <7550008a3fc0a6c745272eded7fa686f@muppetz.com>
Message-ID: <1dca8b5934764616adbb1a85a2a8273f@muppetz.com>
X-Sender: tim@muppetz.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

> The same output a minute later:
> 
> tim@ferrari# sudo conntrack -S
> cpu=0           found=11150 invalid=48766 insert=0 insert_failed=1691 
> drop=1691 early_drop=0 error=1792 search_restart=0 clash_resolve=901897 
> chaintoolong=0
> cpu=1           found=10497 invalid=48631 insert=0 insert_failed=1748 
> drop=1748 early_drop=0 error=1422 search_restart=0 clash_resolve=907859 
> chaintoolong=0
> 
> So ~300 clash_resolve's a minute.
> 

Replying to myself, but documenting it for future reference in case 
anyone else stumbles on this.

My router has a DNS server on it.  Every query from a LAN client to the 
DNS server, even though it's the same subnet, created a conntrack entry. 
  I have a Zabbix server that generates A LOT of DNS queries, it was this 
Zabbix server and its huge amount of DNS queries causing the 
clash_resolve to kick in.

The fix has been to put in a conntrack ignore rule, so that queries to 
the DNS server from the local LAN aren't conntracked (They don't need to 
be).

This has

a) Removed a bunch of DNS conntrack entries I didn't need taking up 
conntrack space
b) Stopped clash_resolve from incrementing at all.

Hope this helps someone in the future.

Tim
