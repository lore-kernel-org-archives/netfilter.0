Received: from mta203a-ord.mtasv.net (mta203a-ord.mtasv.net [104.245.209.203])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73FFE1C9ECA
	for <netfilter@vger.kernel.org>; Thu, 10 Oct 2024 19:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=104.245.209.203
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728588305; cv=none; b=qIE0SaKDI2JbM9/rxtMFu21NFVDIgoH+LqDmRN9MX3esqUiO6ZKDBOfEL8Gr86g+YYxnQbkASDqa/+JEHaZ8+r7TaK46pL27B7QrON8bi+I1l0492o7/+ympBDqI1ob6eLkWoQxJkIPkbOGUq2bK0b3dn5CmiqhbzUppuUxntnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728588305; c=relaxed/simple;
	bh=VRzeqlZ6E7W8O6NAVFFCsX2SxFldaN44QT3zlUPRv9o=;
	h=From:Date:Subject:Message-Id:To:References:In-Reply-To:
	 MIME-Version:Content-Type; b=Jr7G5kpkWnAGw2vlj72QOnIov30UJSHISqUFh5IpEB/aSuu3JiPrU7z6bSjUl2PKD2DhfQK3LNkBl6MCUyCY5rdb5oEKSQn2OCLlmNQ7dASdFt0+bS/amogkDFJBxAl9mCg+yQ6D8dhSLpAUd4f8VfNcF7aoz5YUZG62mlWI7VY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=black-sheep-research.com; spf=pass smtp.mailfrom=pm-bounces.black-sheep-research.com; dkim=pass (2048-bit key) header.d=pm.mtasv.net header.i=@pm.mtasv.net header.b=C9Jc9eB4; dkim=pass (1024-bit key) header.d=black-sheep-research.com header.i=martin@black-sheep-research.com header.b=eLyKioJG; arc=none smtp.client-ip=104.245.209.203
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=black-sheep-research.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm-bounces.black-sheep-research.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.mtasv.net header.i=@pm.mtasv.net header.b="C9Jc9eB4";
	dkim=pass (1024-bit key) header.d=black-sheep-research.com header.i=martin@black-sheep-research.com header.b="eLyKioJG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=pm20241004; d=pm.mtasv.net;
 h=From:Date:Subject:Message-Id:Reply-To:To:References:In-Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:Message-ID:
 Reply-To:Sender:Subject:To:CC; t=1728588303; x=1728674703;
 bh=VRzeqlZ6E7W8O6NAVFFCsX2SxFldaN44QT3zlUPRv9o=;
 b=C9Jc9eB4v9ySKc8QlurneJbco41FSXv1/vgoPcgkTbBmzaps7sXY8xONDHFatL2xupaI9tr6qYJT
   ICz8+B720hgpTNF++pR34tMGM+4lMUZzzod0TYY09XQ77Xtw8JbJiBmePVOlMmV27tJPDHybJ2kN
   PIsZrjjaJ0F3cpVQLeIMGuKXBAWMlPGg13d3mykimxOknM86VKKQnhQNUjeE8KzRykfGuJybHqXy
   3IwMUJeR0iCGgHM+Uo5prCExb+9i8jbFGY3j8/tXIPCjPW7C/WhvRIiFv5Byjgxo7MEWztn/HLB+
   0EZU/Z+XYnpNMTKpMRVp/nwg9XhAUPIEDpJ6ng==
Received: by mta203a-ord.mtasv.net id h10l0s3864o8 for <netfilter@vger.kernel.org>; Thu, 10 Oct 2024 15:25:02 -0400 (envelope-from <pm_bounces@pm-bounces.black-sheep-research.com>)
X-PM-IP: 104.245.209.203
X-IADB-IP: 104.245.209.203
X-IADB-IP-REVERSE: 203.209.245.104
DKIM-Signature: v=1; a=rsa-sha256; d=black-sheep-research.com;
	s=20220127112152pm; c=relaxed/relaxed; i=martin@black-sheep-research.com;
	t=1728588302; x=1728761102;
	h=date:date:from:from:message-id:reply-to:reply-to:sender:subject:subject:to:
	to:cc:references:in-reply-to:feedback-id:mime-version:content-type:
	content-transfer-encoding;
	bh=VRzeqlZ6E7W8O6NAVFFCsX2SxFldaN44QT3zlUPRv9o=;
	b=eLyKioJGrE3n7z8fmcsrF1c+rElLL7OrzhveHAUret5mI2+eWAKPZVI8xTn3fleMU98VKPr23E1
	VNPT8CDYJ1DQiQ/sW8K4gXWXKDQ3M/7KGGha4FZCz5kPF0PmDBbdGNXTQGKhwZVuxsUO9Jw+cfFEx
	RyxYLA1+rRWxMrk7UC8=
From: Martin Brampton <martin@black-sheep-research.com>
Date: Thu, 10 Oct 2024 19:25:02 +0000
Subject: Re: VPN nftables
Message-Id: <f1f09316-a0f3-43e8-854a-a7d6a7138aaa@mtasv.net>
Reply-To: martin@black-sheep-research.com
To: netfilter@vger.kernel.org
User-Agent: Mozilla Thunderbird
References: <b80835b3-5e07-4631-92b3-3c04b58a43d0@mtasv.net> <59586f06-cb9e-4810-b7ad-e397ea111485@tootai.net>
In-Reply-To: <59586f06-cb9e-4810-b7ad-e397ea111485@tootai.net>
Feedback-ID: s8569101-_:s8569101:a226829:postmark
X-Complaints-To: abuse@postmarkapp.com
X-PM-Message-Id: f1f09316-a0f3-43e8-854a-a7d6a7138aaa
X-PM-RCPT: |bTB8MjI2ODI5fDg1NjkxMDF8bmV0ZmlsdGVyQHZnZXIua2VybmVsLm9yZw==|
X-PM-Message-Options: v1;1.bd-9TlyI2N2xp6XpzUQVHA.zTS72hym3jhGEyBdsL5glZIFQ9vTzL-TBsQO1fGf8ScSixVtBOZG2Cl6-Ca8DWRs2aEUfGP8CFR6LxwBNfbV4Ekmfu-fk9IsF08jBNsSqlOsW_qRQ-9ZKDU0OYCxbm2FQWJJkHBO3tDAU0gJUV3Quz-0-aX4xZVEo_y2wc5MpMVXQOacjDXwIx-vhHcS5P67
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-PM-MTA-Pool: transactional-3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Thanks. Unfortunately that doesn't help.

In fact, it seems that installing and configuring nftables destroys openvpn=
.

 > In the output set policy to accept or add new to ct state

