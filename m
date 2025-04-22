Received: from smtpbg154.qq.com (smtpbg154.qq.com [15.184.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2067B31A89
	for <netfilter@vger.kernel.org>; Tue, 22 Apr 2025 02:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=15.184.224.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745287210; cv=none; b=giavEAbupof8sdvOJ4w3TNphFkqqQAQj+UxhwNURMFjCCxGN4CJFrdVhGUFsIDYMNZjbGw1jBHl+UIvkjl1d9knm8QUmr9/gyQVXhRbGZLvkWl+jAL/4o3qCD3dqhVoGgAAPTH1UcYVzdaVWMVbkG31OrG16JmCItAZtllm8Qs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745287210; c=relaxed/simple;
	bh=OTCO/tvUzjyxlfqNdh/goGpljD2JtukQstoL8hAHZVQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dcqBYx5POPxheCtL7KCZ+sShvggo6ANyNkIInpHQLmcB2SKYF6FoZUAQ/se6QqfdavH7PahzuIGNzBGDW1pWA7jK5u9Ltb8EWi6x7d0Kabj8I+k62awf+4BQBsmftv94Z35T42qqbdw2X0OK3wgp3gZavz20/3pFqH+F8PD0U+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=Mex1AiVl; arc=none smtp.client-ip=15.184.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="Mex1AiVl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1745287190;
	bh=OTCO/tvUzjyxlfqNdh/goGpljD2JtukQstoL8hAHZVQ=;
	h=MIME-Version:From:Date:Message-ID:Subject:To;
	b=Mex1AiVlTY+WFF2LWOwhW4me4TnM1RTwmStIb/GMpl5GREqdL1GDYyxhdW0UhXHSA
	 bwDQ89uUNXhRg1Vd4/tspS6oaSs9FjVD+yxm4fxlch5FWGF4RtwQaJMtt1UGZKsx7A
	 4OCmn4vXInYHAqZWJE1DiCULg9eKOyO136SI1UIg=
X-QQ-mid: zesmtpsz2t1745287186t33e81109
X-QQ-Originating-IP: U0GujigSIK58sZd9UE/inT1m5pMtLu4SebU9gn8RuxE=
Received: from mail-yb1-f170.google.com ( [209.85.219.170])
	by bizesmtp.qq.com (ESMTP) with SMTP id 0
	for <netfilter@vger.kernel.org>; Tue, 22 Apr 2025 09:59:44 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 13076544709390754737
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e455bf1f4d3so3390257276.2
        for <netfilter@vger.kernel.org>; Mon, 21 Apr 2025 18:59:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWOeBego2oDlriVq0v5PJwtL+RNd1KTtEE6GQ7hLAMNC+/+qYvKq/2DCXD2hihKNtclfjZssIuH1H8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1K1ev1faSqZIe9oiaLWJpFrGHpp0xnMS497zPDl+y1dVfLKyA
	8ygjYnofXi+4wdglmPRAX7HDGYyEnEXF/gEyangWxeT+yRO7UhaPL2nQTMtD7AUhwAxiBo3HBJ0
	xZlAZFMSfUtwJuYa7k+nIYBQwRkQ=
X-Google-Smtp-Source: AGHT+IETYXHgW+HGFHyjdb8hZYPEmiGvWjGixchFADNpxDjDR9c+9ueD9cRYiAxclF5Wwl/8B4BS16ve7ne6Wt+QjIM=
X-Received: by 2002:a05:6902:2304:b0:e72:85a8:cd15 with SMTP id
 3f1490d57ef6-e7297dca6b6mr19290815276.12.1745287183548; Mon, 21 Apr 2025
 18:59:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAC1kPDOzuhA9T2PDrYX8c9833B3QY7ECYDaXKE4zbkyc1FfX1w@mail.gmail.com>
 <9bsxFpl1jZK-Q-1fvltsQ9TIJQbKJLLZ2BOKaF1HF8AAaaczi4Nazmyc_joMqUNu_Gbnii28h2OAIrFKNJyfOXU-C6si-ocGfhl9nabaQrM=@protonmail.com>
 <CAC1kPDPkQXWENzPeCRjmNO1cOFOD90RzPSCEPq-0cNQnfrPx+g@mail.gmail.com>
 <weuaFW4cJd3LV86Dm_XEPqzgsdQlndvgmC3sLnNg4KEH6kM_9IuaVzS3EItenqX_y5N0Ke8Q-eVuv8_oQUYikrH1u9XUyF3ZUploTxzY7OI=@protonmail.com>
 <CAC1kPDNdUO-v5UEJYZgtOL1iZTBBxteUdfaGDAAgVQNEzcoWYQ@mail.gmail.com> <20250421132718.GA6623@breakpoint.cc>
In-Reply-To: <20250421132718.GA6623@breakpoint.cc>
From: Chen Linxuan <chenlinxuan@uniontech.com>
Date: Tue, 22 Apr 2025 09:59:32 +0800
X-Gmail-Original-Message-ID: <0F2D818DBB4D1411+CAC1kPDO0_1AY+zPkaPFj=JvV-duuaPeWjGh99gFidFsropixYA@mail.gmail.com>
X-Gm-Features: ATxdqUHGG2MC_ImxhRaPs45GjlYAfU9lrtSEGZpPa_wGiPKwUy6wZ_Qwx38m-xg
Message-ID: <CAC1kPDO0_1AY+zPkaPFj=JvV-duuaPeWjGh99gFidFsropixYA@mail.gmail.com>
Subject: Re: How to Achieve Functionality Equivalent to iptables -m owner
 --socket-exist in nft?
To: Florian Westphal <fw@strlen.de>
Cc: Chen Linxuan <chenlinxuan@uniontech.com>, Sunny73Cr <Sunny73Cr@protonmail.com>, 
	netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz5a-1
X-QQ-XMAILINFO: MMkVjSP788Vvt1NqrcSY1NQcsGK2j+2DEloynW6fMKMzVJRVGyKmyB4m
	2p2zrSdxfsZ7SINxOUgVe7YkUSBftDDbcHmDfheQyZ2tSHO3wS/Jjym0Pfe61PfE0xoNa/j
	pkTYUfXKX8smtAiXU85hWLWl/tBWeGAvkA+PQV8LzQKREExtFQzB2RfYi2euESNcIk7du2U
	rKsgDo40i17msnE41qISTXQivNuvGJIzZlvJXIrasdKpttaJfpQw7Hh/IVnVLHnsLTudGAL
	1UpcmjgWKTk482reK2j1AeVEyamg9srhEhTqkQ8ol9DW0aMH2vQOA76b2P5ER/H/QGHcRW0
	IrlMCn66g717bYZM9sNPIQdJu29cboVQZ+kv2Ij8GTTGKlaKbSyBd6Cfn2zJ1JLAWtBpSDI
	88Kjg03un0HcyirJ+Og6YWNOAOqTdWnkwoVEpZQYOUlUax/97r2nUiL62K1p7IEt/GOHVHA
	ari5ppps+5wKgZBQONA6//HFPvSN8utFrOu9llojRQRcyKPad6TTA6pn5SN6bQhS3mERHJU
	KNyK9qD6/s27/D9cOLm8zLjhy0o0uhitQzbcOh1jXxD7S51BPAx9RA+It9FMpyUv2j5uuOs
	uUCjex4P9tDh91sYKYVQOLCkUrvw346k/Y8iZm8u3k1JyOyKfjv+4JVOAGUvK5K5W6CU3X2
	u/Y8XgsI5MOS+qJB9WTrBX+arvEo0yzoS54Hzst+C72nNqxxxNajeJeLtpXP1nBPthEiU5X
	MDCNywxtiHuWqfh/WXaZJ05vbFZ9NM8llVMG/YboWUXcBYKS087GzwLtS/im6bUVuKKPtAJ
	acTa9YzGU1Ew5yWcW+bi7jV495qaCzKlUcdV9mNCyNFig+SezZd23vdA2Qzvuau3otwYFSy
	pmKlyBtujjtiz0qGJrdx93qyT14DLsHefAm2sIl3560GBcjiorJFiCyagHOpnjGiP2CKDKL
	UgzbUIeW4QC9lv/b7YhFM+4XbumyrGOh5YZEanED4F3OXlTwoOrhNKuc7/WFWyH8OcCAgWP
	3FeBbeMg==
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
X-QQ-RECHKSPAM: 0

RmxvcmlhbiBXZXN0cGhhbCA8ZndAc3RybGVuLmRlPiDkuo4yMDI15bm0NOaciDIx5pel5ZGo5LiA
IDIxOjI45YaZ6YGT77yaDQo+IG1ldGEgc2t1aWQgPj0gMA0KDQpBaGEsIHRoYW5rIHlvdSENCg==
