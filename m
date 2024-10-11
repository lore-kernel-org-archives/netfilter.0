Received: from mta235b-ord.mtasv.net (mta235b-ord.mtasv.net [104.245.209.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F373B209664
	for <netfilter@vger.kernel.org>; Fri, 11 Oct 2024 07:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=104.245.209.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728633443; cv=none; b=e/+mDokx2AOOI5esFT64fISG25ZWY9FOWGUHHyXh5mFCUHCZLU4si1wO2BNKyV9PsiHVe6E7FH74pFk/kJCa3nCYu5/Q1TIJg7j4QkoN5rpjpCArmw4aU97Bdc6GnaGiaAxZvmw3l1UKqgiR/8/h4a6BCdZKFrXAk4ClDlRTZrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728633443; c=relaxed/simple;
	bh=WYdNbEz5Cfow2rp8EHfl946vwbfSyOStfikf8QA1TpQ=;
	h=From:Date:Subject:Message-Id:To:References:In-Reply-To:
	 MIME-Version:Content-Type; b=LlEadGf4c1qn4LE7BTIC0dvvPxRUlWaYPaI5oAQompoVEt8136y4GEeR2BWbsvkOKQMuHN5rTM0H2CWqfDbNyFduM2zLWhB38aVyepL86a2pPMnrFnADX4BH4I9Cv7M4ujfknLMR4OUfUfsk31FHlhz5psdIGGYFfUucggGGeuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=black-sheep-research.com; spf=pass smtp.mailfrom=pm-bounces.black-sheep-research.com; dkim=pass (2048-bit key) header.d=pm.mtasv.net header.i=@pm.mtasv.net header.b=fMkWSFSc; dkim=pass (1024-bit key) header.d=black-sheep-research.com header.i=martin@black-sheep-research.com header.b=hvSEkUJf; arc=none smtp.client-ip=104.245.209.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=black-sheep-research.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm-bounces.black-sheep-research.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.mtasv.net header.i=@pm.mtasv.net header.b="fMkWSFSc";
	dkim=pass (1024-bit key) header.d=black-sheep-research.com header.i=martin@black-sheep-research.com header.b="hvSEkUJf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=pm20241004; d=pm.mtasv.net;
 h=From:Date:Subject:Message-Id:Reply-To:To:References:In-Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:Message-ID:
 Reply-To:Sender:Subject:To:CC; t=1728633440; x=1728719840;
 bh=WYdNbEz5Cfow2rp8EHfl946vwbfSyOStfikf8QA1TpQ=;
 b=fMkWSFScNwfiYc/+dpIUk2lYAEE6e4RvE8zZPxglfKooUBkv5dN5ukFM+L11luE6jeDV+nktKtd5
   Gz5Dtu716WRzzHC9OyAaFegNefhfSZcg+qt+eHqORPok1T/S+7EtdG4PVmaDCp53+kak3Tl1jHxA
   8hlDAdqMAqJ6otfbutCeQ+QRMRCYjAzKh8mSYQfxXodG3MN+XFAiD7FgcDjqd1WgfYRrT8RmwArW
   6T0s7J/mAvTruSWXu08SMLSpPK9BzgxEqr1Qg3DvJoCVmJO6y+MedACLzZeFY3TdQnCsskFFCZEG
   qqAkgPuvRSHvcxh1mhnfra0X5RhYmNXdVz5fLg==
Received: by mta235b-ord.mtasv.net id h13d603864o9 for <netfilter@vger.kernel.org>; Fri, 11 Oct 2024 03:47:14 -0400 (envelope-from <pm_bounces@pm-bounces.black-sheep-research.com>)
X-PM-IP: 104.245.209.235
X-IADB-IP: 104.245.209.235
X-IADB-IP-REVERSE: 235.209.245.104
DKIM-Signature: v=1; a=rsa-sha256; d=black-sheep-research.com;
	s=20220127112152pm; c=relaxed/relaxed; i=martin@black-sheep-research.com;
	t=1728632834; x=1728805634;
	h=date:date:from:from:message-id:reply-to:reply-to:sender:subject:subject:to:
	to:cc:references:in-reply-to:feedback-id:mime-version:content-type:
	content-transfer-encoding;
	bh=WYdNbEz5Cfow2rp8EHfl946vwbfSyOStfikf8QA1TpQ=;
	b=hvSEkUJfnUCyqeA4pbVfBtX7IuuF5SYA/2YYcSAqi+QaDm4OCL3qb83EJzk/qdwB79dq/Ol6vB6
	GxPcJSKaosfMqGJoxDOgU4lwBn5z1LQ+AVj8iL0Q3qTj+BMUp2E/WQxpiFE3thWklXRwbRmXfqTUI
	amBTXbEcGxHYZqBCz60=
From: Martin Brampton <martin@black-sheep-research.com>
Date: Fri, 11 Oct 2024 07:47:14 +0000
Subject: Re: VPN nftables
Message-Id: <b3ac9a59-c0a8-42c6-838c-26db3712291e@mtasv.net>
Reply-To: martin@black-sheep-research.com
To: netfilter@vger.kernel.org
User-Agent: Mozilla Thunderbird
References: <b80835b3-5e07-4631-92b3-3c04b58a43d0@mtasv.net> <59586f06-cb9e-4810-b7ad-e397ea111485@tootai.net> <f1f09316-a0f3-43e8-854a-a7d6a7138aaa@mtasv.net> <798fe091-1614-4db7-8692-66c2d03a9f54@app.fastmail.com> <a6bd13dd-5536-4aed-93e3-51b14012bb57@mtasv.net> <4e1c3168-51f0-4e9b-b72e-c21ebfac9eec@thelounge.net>
In-Reply-To: <4e1c3168-51f0-4e9b-b72e-c21ebfac9eec@thelounge.net>
Feedback-ID: s8569101-_:s8569101:a226829:postmark
X-Complaints-To: abuse@postmarkapp.com
X-PM-Message-Id: b3ac9a59-c0a8-42c6-838c-26db3712291e
X-PM-RCPT: |bTB8MjI2ODI5fDg1NjkxMDF8bmV0ZmlsdGVyQHZnZXIua2VybmVsLm9yZw==|
X-PM-Message-Options: v1;1.lryiv_Zh7OukOQnuyUXMCg.AA42yc8Nh-BPa0XAH2wmMFg_iYJniCkXiytHn3PUiixepj5zMb-L4wJMG9vqKdbQG2sKjhInHTggQ_1aailUUfch275JXEQRXgLXK3Jf9B6pOYBCAco48G6hZxNkVSmo1uhB_UXO8qijaxDiSL-oSM5NNI5WBd1gUAscIjR-OtR7BHqTlI0VyeEhPk92FjCS
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-PM-MTA-Pool: transactional-3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Yes, I actually uninstalled iptables.


On 11/10/2024 08:34, Reindl Harald wrote:
>=20
> did you also remove all iptables rules?
>=20
> sadly you can have both at the same time in kernel with all sort of=20
> funny results
>=20
>=20
>=20


