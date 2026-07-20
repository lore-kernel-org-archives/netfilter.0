Received: from mail-107171.simplelogin.co (mail-107171.simplelogin.co [79.135.107.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 788BE44E052
	for <netfilter@vger.kernel.org>; Mon, 20 Jul 2026 17:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=79.135.107.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784569885; cv=pass; b=GYV6LCmuaqtvcN+BXLt1xZJD+iQDioZd6sJDKSfgVl/2MreUUw9vMqxeJGz+kehekQEjBkgzX/FLMsprDTF7Htt/UQaRCR6fY/uRMOGApk95beUGzhJnZj36D0MNJcbreUoKQhx0+g03FSnBxfSMHC9AO4UWM1/0GJTaBlBGVfM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784569885; c=relaxed/simple;
	bh=DkF45CMp51wyvNCWroHpBpDWuhaFXn+/OamnwJZbVz4=;
	h=Date:Subject:MIME-Version:Content-Type:From:To:Message-ID; b=CDiWfhwDreug5vhXUj/lxHlmjn2OSa2MWZ0MqSOC2ZUsVQt2JaaqNH+e/sK7icZUnWaRrPFRP/05w2r5jug4+g7Gk/9dCFzaFLLOsrNuSb26/SGxBX1SCyHmgSKZCZChrqJBssOGTo/yF0lVFt/+/BgVrHF+cICBaDmuNIsGC1k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=simplelogin.com; spf=pass smtp.mailfrom=simplelogin.com; dkim=pass (1024-bit key) header.d=simplelogin.com header.i=@simplelogin.com header.b=RRtBKGgA; arc=pass smtp.client-ip=79.135.107.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=simplelogin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=simplelogin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=simplelogin.com header.i=@simplelogin.com header.b="RRtBKGgA"
ARC-Seal: i=1; a=rsa-sha256; d=simplelogin.co; s=arc-20230626; t=1784569874;
	cv=none; b=idwPoKfphTHp0TAkeX4hZEYvkJpdshN9UBRwqA2mpculso0Kc/7zixVGgVUIleLbUBwfxohtGL9p36LuFNu4EGugwYURE3HmxpmpJk9Bn1oIAP6RZhUCHav+PXPIdNyGj87zrg2oLT0lbiBnhemvgE7+gVX9GpJmJmI4uOfEPhrft5mv6YpwbjeABq+53072IEThW+KVh/o0ZDZxS0D9XdnGKisoEMDBjxR/tGm9cAskQVs3SAFj2zjOXtqKa0tEj5QH50uGQeyAua+byCko/UPqDGdMGU/zv8KjI/XtYuHfGOd1DlY/ylTXuevH6XNe4+cthnlRIcqciHoW710D7w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=simplelogin.co; s=arc-20230626;
	t=1784569874; c=relaxed/simple;
	bh=DkF45CMp51wyvNCWroHpBpDWuhaFXn+/OamnwJZbVz4=;
	h=Date:Subject:From:To; b=T2dDqygdceGPdRAYMer5qpj3izH1MWfPNkenkZ4CvAxcuqc/NeFDzzPjfQMdAcN+sVt2yXozuCpK/juGYrOQmT2etEsTJCMDEwZUqKM5cxzaGLiKQULpD+cLl6J9+ZYyXIZr6kRmdmIRKd1lKe1Y1lI8xS3weJ7b9vxhd+pcIPKacsEKsk1EClN5f8zOgI7H8DpWxn3pQKz32W5UZlCDt36Y/uam5YSJS28byzlAf9FnsUKXr6vBP9zj6B/vvdB89QTTyvEXsoKdG5OGMU0Z+0DUREFGlNDUU+PBu4dCGQdh4zJJ2wgtBieXUs/EVWixbv7Am+RAy3154fTc9SyGWg==
ARC-Authentication-Results: i=1; mail.protonmail.ch
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=simplelogin.com;
	s=dkim; t=1784569874;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=DkF45CMp51wyvNCWroHpBpDWuhaFXn+/OamnwJZbVz4=;
	b=RRtBKGgAKwuzW5JXaHby29JvOjsFS4xJ/c8P17S1kzCxNLX35PVLJnpe4Z18lIw0Bmpz3p
	ErYtzkzcjj4zWrFEbuaoXVxS5Dogu0SRSO4qfE5X7SnFaeGwFL3MTZbhD+GMKX9a+IVcZx
	NdigXsV2yRig8jU++PMLTbMhdsDfLsI=
Date: Mon, 20 Jul 2026 17:51:05 +0000
Subject: Bot protection on RSS feed for git.netfilter.org
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: netfilter.btvdk@simplelogin.com
To: netfilter@vger.kernel.org
Message-ID: <178456987406.6.15350942097428291948.1495131021@simplelogin.com>
X-SimpleLogin-Type: Reply
X-SimpleLogin-EmailLog-ID: 1495131021
X-SimpleLogin-Want-Signing: yes


Hi,

I have an RSS reader subscribed to https://git.netfilter.org/iptables/atom/=
?h=3Dmaster

It does one call per week. It used to work, but now times out.

If I open that address on my browser, I am hit by "Protected by Anubis" pag=
e saying "Making sure you're not a bot!"

I'm no RSS expert, but aren't feeds meant to be read by feed readers (bots)=
? How could the feed work if it's behind bot protection? Is my client expec=
ted to solve whatever challenge Anubis is posing? Does that not defeat the =
purpose of the bot protection?

Thanks for your attention.

