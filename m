Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E4EE433A8
	for <netfilter@vger.kernel.org>; Tue, 15 Apr 2025 06:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.243.244.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744699955; cv=none; b=I3jEE8bctgAZHNmn/nzkWFNEOGSBUlbOhXxBcmdal+Iv1nZvO4RvBq0IvXImyCtTLeT7TdocVk2ybH+TknXmtFNZZ6oNyuyOW3dQED3GhERNXQrGFu19jFw6IqrAxIgC+IchcdF18AorCd4FfjzUdQE1LtMsK6GNYOEajSgqm2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744699955; c=relaxed/simple;
	bh=i/Tb5CmiUeYXtcjYKDtctSy5dtRoCNFC8BjrOFIMmVo=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=UZ7apu+6nb2xAeDgK2koO3jXqUHflJbHvaMlWLrM1troqy3qsiCKrSV05n1TYhSUrc8i11o8oUUrizTHMWVKEr4WmiS+SrzJePqwTh0cWsled1nsRLmrlYJVxVBRgbuAE//u1zEoPeg67S2H7/Mxw2Di9Nk+MlnI6MH37X57//w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=X+aGfBHf; arc=none smtp.client-ip=54.243.244.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="X+aGfBHf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1744699942;
	bh=i/Tb5CmiUeYXtcjYKDtctSy5dtRoCNFC8BjrOFIMmVo=;
	h=MIME-Version:From:Date:Message-ID:Subject:To;
	b=X+aGfBHf7yd8DEWUgYHRvOPVFVMORDwFuAsRtYbiIW6XpBlMNPMYyvVu3F6/3Thk3
	 DZ3uQtMxNxXZ+btCkOcaF/QD269hX50BPm1fnh2Qv41w4G+LHIR//X7k8rUu+wFwQU
	 HwhW9o9YepPlvF9n3MyN/q9BppvGl/dNbx4/xG2I=
X-QQ-mid: esmtpsz19t1744699935tc8d6ee90
X-QQ-Originating-IP: 6AOwXjkbUudHrQj5v6K43NHYjxp1Q73L8ZoN1IuwWSo=
Received: from mail-yb1-f172.google.com ( [209.85.219.172])
	by bizesmtp.qq.com (ESMTP) with SMTP id 0
	for <netfilter@vger.kernel.org>; Tue, 15 Apr 2025 14:52:13 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 6648475814480811049
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e6e2971f79fso4083679276.0
        for <netfilter@vger.kernel.org>; Mon, 14 Apr 2025 23:52:15 -0700 (PDT)
X-Gm-Message-State: AOJu0YyfA7+lidr9Cc0eS/MPyMSoTLejNIZh4Y6xlXzc483j5lLPa4ry
	tpcqrc0gqdwGyS9YNiKsIi+Q64pOfA5f3kuIGDb8p1cT5JKq+1swq+oyIEhTNDbhlkLTZdVJv2r
	X2VED4mTzT5Gao+zFzHPymdFMVto=
X-Google-Smtp-Source: AGHT+IG/ihDR5Ejab1t2BH+Mb3swetPRet/8e7PGXlGyoLsVoI5HVzjaM4fR9Rr5kBUNsrBximFDoBywDHpHQBVQn9c=
X-Received: by 2002:a05:6902:992:b0:e63:ecdf:4d6b with SMTP id
 3f1490d57ef6-e704df20963mr25700553276.13.1744699933058; Mon, 14 Apr 2025
 23:52:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Chen Linxuan <chenlinxuan@uniontech.com>
Date: Tue, 15 Apr 2025 14:52:02 +0800
X-Gmail-Original-Message-ID: <C3B20F8AE00851E1+CAC1kPDOzuhA9T2PDrYX8c9833B3QY7ECYDaXKE4zbkyc1FfX1w@mail.gmail.com>
X-Gm-Features: ATxdqUG3BKsUqPv2l8jHvpqJ0QnIjFTqX6OYGI59I7CY9tfD687Xs9H-pt8HHC8
Message-ID: <CAC1kPDOzuhA9T2PDrYX8c9833B3QY7ECYDaXKE4zbkyc1FfX1w@mail.gmail.com>
Subject: How to Achieve Functionality Equivalent to iptables -m owner
 --socket-exist in nft?
To: netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz5a-1
X-QQ-XMAILINFO: McJfg7Aee/FZ70cjCalgIM13KQmf3UNB8vTr+EB/5ZP30Dr7OxOAJ3Ko
	WT/yho9/7XwN2Pjr3vaXHoV/6CrPzdN4iJB1SpJBG9fm/H8YBs7JXUsy+t/OiHKjGn+8wZv
	d+fdawekMfzXCrEB5mvhledo1iTOVnb14rcqWMOt23bX3cPPtdZarQOauKVVjVoxIYhyGkq
	yE22HRKIHUiaRjWziXIWzJgLhx1k/jLNm//jZq919RDx1sajoZg7lFCvbMyRqslKL/9vGGa
	Oi74k3KmlcT0jQsG04sZvagDviCjsqk3TCO5gFajOSn7yVN51G7h/Tp/CY/9b/okZctr5oq
	NHnhmkHeyXk5tEoxumz4w0Z7OxGGHnCsJ4HC6RVteUtPVnhWQGXomgWDeAEbHOfyD+sN4YT
	fhXXtKXmYP8DlB3BrxtiM7l4LPDJvaVdE/Bo4qaRexcIWLX+QPy/kZ8gn+IYk+f4x1aetVt
	tgGYFdk+bDeeZgYxygOSzgqHlS5Omwl2nXcTjCwYU3L+Gh9jblg2Uk2Eu0sJN+TVvmAVHNS
	TKaKUNrcIhpWV6Ch9oWzc8/eY3Ls0uIKEWLN7x8nmci10dPy+s+aeyPuG3lVoTzHxacvLrn
	9OtxeFWWVvw8ql+sbu3C/GfAXLue2bYkGUwzzShxKU3aXmqBYWGQEC8mI+BmOwpg0fW1Fmf
	zQSXFeK1L9rRCP3oaDvEl8O0d0SGlyh6Cv1elTHyyE98lpL3ui+CbsfWAzsMRD1dH2Y/4ex
	SWBqzPvnB+RfK8m1RJwatFNUanDl2181ntPSeEhg05Agf41Z5eLOmTPLcBjBtTOQtyOz0eW
	GJbuCRjt75X4ty5x6HsF9XQSybdvy1qFBVEfyytYXivSsVTf/j1u2X9PNa6ndnnRWViZcTK
	ipK802bNKbDm361K2irjBeXl1CvllAkFKaABfavcG9+uWnzvRngkwIq0UFxUBpSasbm4Bt1
	xCMBuIcBHREU0NA==
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
X-QQ-RECHKSPAM: 0

I am trying to determine whether it is possible to achieve
functionality equivalent to iptables -m owner --socket-exist using
nft. From my understanding, the socket expression in nft does not seem
to directly allow for a simple check of whether a socket exists.

Could you please provide guidance or suggestions on how to achieve this in nft?

Best regards,
Chen Linxuan
