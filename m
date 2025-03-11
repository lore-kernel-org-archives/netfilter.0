Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 997AF262D21
	for <netfilter@vger.kernel.org>; Tue, 11 Mar 2025 18:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741718398; cv=pass; b=NC52cZj6mZmtM7CEXQtWezfzRALgi4nzKSeoT0bP0FlXjm5iAUbJZ+TXcmAhvheMY4jWxYA6temIkA77u1b4sDm2L2Ri9U3P3Tw/NfkI+s1z8uEhTXeA/XF/mzRmL2K0OOXOD8PItqsxPidLrCdZGo8qZRlIN6pKNzqgXqnpdXA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741718398; c=relaxed/simple;
	bh=ircX+pw5BUJNfmt0V1n1nDp0T/HG8dxnsetOK1dciaY=;
	h=Date:From:To:Message-ID:In-Reply-To:Subject:MIME-Version:
	 Content-Type; b=OIUidbsSpTFnvyxU1EZlhzisIeRvDW+nktnWSEXv3HxaBQ0Pjto8TnxwpeSPzktkEG33HgbjQL3didXb1oYJrY53fdNCZsGBbIqqjP77h41B8CdyjRSsmT4XIVamcAci8DBulD/qGrwUDgHvQeo/3yfGhaEC9D9nAhgqSJxBT84=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=eray.ca; spf=pass smtp.mailfrom=eray.ca; dkim=pass (1024-bit key) header.d=eray.ca header.i=bilgin@eray.ca header.b=TUA9ydoP; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=eray.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eray.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=eray.ca header.i=bilgin@eray.ca header.b="TUA9ydoP"
ARC-Seal: i=1; a=rsa-sha256; t=1741718394; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=QV5clyXisCuhJh8Kk6PSGuyN8My+Oq0YrVb04qxVKV5KIcdgugrkP2fSESBqxcxv2DBLETrEKWGsG2XNLpKipYZmRZm0mK0T9pcZ0tRiMmc9tnlMbnfZ257NMZOZf2r4otIx7uSfan2q3MjHy1EtR7Jtn8ukXRG3GzE9QZ5SKcw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1741718394; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=/r2Qkvnhfezu9pSzL50Vql6Wmuf/3pdDzpdASJD7FbU=; 
	b=ICRx01K/AYdXMuL7d+86H5Lbd14iRD+VLqsln7T5Yyc85fYptgDp2OM0VRwA/oQJrSj0Nc+CeK0NC1nW6oEHnVoCqSIHZNtxikyRxIw+FzGAGFNJZRwhCxsplhum1wnbciBrD3bxc2NIvdNqs3vEoM8DqUNUuMHvWFzyC/5Re1Q=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=eray.ca;
	spf=pass  smtp.mailfrom=bilgin@eray.ca;
	dmarc=pass header.from=<bilgin@eray.ca>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1741718394;
	s=zmail; d=eray.ca; i=bilgin@eray.ca;
	h=Date:Date:From:From:To:To:Message-ID:In-Reply-To:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=/r2Qkvnhfezu9pSzL50Vql6Wmuf/3pdDzpdASJD7FbU=;
	b=TUA9ydoPtfzbB25/PZdPdINvE0ki4D9UTRsWhR/4JxKMVzCtf2/AiA/f3qOiiKuc
	BcuW70Qa6d+kPlKq38+uBmd9sWKkwQi/LqGRJZMu48XM9VgyYYMYxEEIE+nbRh9kP6t
	nThnAA7QsXS2PbSNlnTl2rdRVRp0HIP47BewdECA=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1741718392273953.2424390152023; Tue, 11 Mar 2025 11:39:52 -0700 (PDT)
Date: Tue, 11 Mar 2025 14:39:52 -0400
From: Eray Bilgin <bilgin@eray.ca>
To: "netfilter" <netfilter@vger.kernel.org>
Message-ID: <19586818db9.1064ef7c7193134.8119049596746200083@eray.ca>
In-Reply-To: 
Subject: Re: connection tracking fails to update udp timer
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail

---- On Tue, 11 Mar 2025 10:48:12 -0400 Florian Westphal <fw@strlen.de> wrote ---

    >Replies during first 2 seconds are ignored in order to prevent
    >DNS requests from triggering assured state + 2m timeout.

i see.. is there a run-time option that overrides this behavior, at least
for select ports? my other router which runs dd-wrt doesn't have this
problem

eray
