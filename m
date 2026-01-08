Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc [91.216.245.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E2233A033
	for <netfilter@vger.kernel.org>; Thu,  8 Jan 2026 17:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.216.245.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767892519; cv=none; b=E0b2kokbQm3AXXvSpARFnAXmg16BRNQMTVo0g3f0A9y53xaSP+YOzfWJ4hHiwwm4LvLcuhMoPViTk1AVmNZsAPoXzxsKb2b14KYLU05NfJf0I21pS/JzmH/uHStj0YNriHUDwNnyXqnO05AYjLVoe7rcrrtNk/ndEYzsAdhaYs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767892519; c=relaxed/simple;
	bh=+bnSW94o+ZGb+xuSBmbMNEsOqV3rlJOgii+4FM0sqNk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZaMM0JdJyHHJXTIONkTywUgVBo6iYuM55I7OK14vQeQgYuihOK0XYKx6VB4qJRxi7Perrfw5G+mJdYn5sImmS+YHXW2h14+ix5icPthQO853AHmzCKt4udwsKeNdej0CK6dMzZ09oCSyybXExnVTjvjifZrpOJ/Wn64p+qVOBhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de; spf=pass smtp.mailfrom=strlen.de; arc=none smtp.client-ip=91.216.245.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=strlen.de
Received: by Chamillionaire.breakpoint.cc (Postfix, from userid 1003)
	id 6C8386035A; Thu, 08 Jan 2026 18:15:14 +0100 (CET)
Date: Thu, 8 Jan 2026 18:15:12 +0100
From: Florian Westphal <fw@strlen.de>
To: Michal Slabihoudek <michal.slabihoudek@gooddata.com>
Cc: netfilter@vger.kernel.org,
	Jaroslav Pulchart <jaroslav.pulchart@gooddata.com>,
	Tomas Klouda <tomas.klouda@gooddata.com>, fmancera@suse.de
Subject: Re: [BUG] connlimit breaks localhost connections since 6.17.13
Message-ID: <aV_mILsZWZQg0SbW@strlen.de>
References: <6989BD9F-8C24-4397-9AD7-4613B28BF0DB@gooddata.com>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6989BD9F-8C24-4397-9AD7-4613B28BF0DB@gooddata.com>

Michal Slabihoudek <michal.slabihoudek@gooddata.com> wrote:

[ CC Fernando ]

> This happens specifically when connecting from localhost to a non-localhost
> IP address (i.e. not in 127.0.0.0/8). The first connection succeeds, but
> subsequent connections immediately time out.
>  Removing the iptables rule with the connlimit match fully resolves the issue.
> 
>  Expected behavior:
> • connlimit should only match and log packets
> • connection handling should remain unaffected when using -j LOG
> 
>  Actual behavior:
> • connections are silently dropped
> • client experiences TCP connection timeout

We have very little test cases or real world examples, especially
for iptables.  Hence constant breakage is expected.

Fernando, can you please have a look?

>  iptables rule used (for custom logging only):
>  ```
> iptables -I INPUT -p tcp --dport 443 \
>   --tcp-flags FIN,SYN,RST,ACK SYN \
>   -m connlimit --connlimit-above 500 \
>   --connlimit-mask 32 --connlimit-saddr \
>   -j LOG --log-prefix "IPT-443: "
>  ```
> 
> iptables ruleset:
>  ```
> Chain INPUT (policy ACCEPT)
> num  pkts bytes target prot opt in out source      destination
> 1      0     0 LOG    tcp  --  *  *   0.0.0.0/0   0.0.0.0/0
>        tcp dpt:443 flags:0x17/0x02 #conn src/32 > 500
>        LOG flags 0 level 4 prefix "IPT-443: "
>  ```
> 
> Test case:
>  First connection from localhost to instance IP (X.X.X.X):
>  ```
> curl -I -L -k -m 3 https://X.X.X.X
> -> HTTP/2 200 OK
>  ```
> Immediate second connection:
>  ```
> curl -I -L -k -m 3 https://X.X.X.X
> -> curl: (28) Connection timed out after 3001 milliseconds
>  ```
> 
> Without the iptables rule applied, repeated connections succeed without
> any issue.
>  Notes:
> • This looks like a regression introduced in 6.17.13
> • The behavior resembles an implicit drop, despite using LOG only
> • Regression might be introduced by https://github.com/torvalds/linux/commit/69894e5b4c5e28cda5f32af33d4a92b7a4b93b0e
> 
>  Please let me know if further debugging data (conntrack state, traces,or kernel logs) would be helpful.
> 
> Best regards.
