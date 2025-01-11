Received: from primex.slavino.sk (primex.slavino.sk [185.25.250.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852B1156F54
	for <netfilter@vger.kernel.org>; Sat, 11 Jan 2025 10:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.25.250.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736590093; cv=none; b=PLdsFIqdMfIfrSb15ELFZSgiWzhFRa1qaKzeCm4zmLhnKKW9az/Rkd45xWWVAO278S/1FfWgw137iiGb9Lph5XO9KdbNX/wT1Ck+Z+MA78g67JpvTPP5TCKhvQhP4QKfVhcF4vOoQSUMQfWWlO+9qE4b+zlrw7/tbHUlFKoxLEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736590093; c=relaxed/simple;
	bh=ShbksblAE46cURyS3RVz408PcWu5bHF8gKMW5TFohr8=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=hIi74n4bTtVy9POOwOU1Y+Kase4TZmi0VL8gtlK1cO9Z/Cd0MI0V1bg/ycOEp0PeGAww27uZ0+WXF0wrK1CVBb/QKDO6LhYHDvJydf2jnayZKImAl63dpg/G0wn/BW6OzuKC5jz9tgctw9nNoGRubjyLhy5qle27yOdobaOiM88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk; spf=pass smtp.mailfrom=slavino.sk; dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=Ov8uV78z; dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=9JMX45iR; arc=none smtp.client-ip=185.25.250.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=slavino.sk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="Ov8uV78z";
	dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="9JMX45iR"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=slavino.sk;
	s=r2023; h=Content-Type:MIME-Version:Message-ID:Subject:To:From:Date:From:
	Reply-To:Sender:Subject:To:Cc:Date:MIME-Version:Content-Type:Message-Id;
	bh=eCVakIo3cKCvrkxyBo8/dmAkbQLPkbVc/K//QwakS0Y=; t=1736590089; x=1737799689; 
	b=Ov8uV78zFXuobroeg/JDAFQ5qKCslmRokCpPCNAlTmvboFHSeahyb4ibZzfg6ing/0cXmANEXLL
	MtWJyoFH+Kfg/b0VJc/qmfctyVrG5vyPPJ4WfG8cWhBUmz5EzfEpS8QDAHahMTkyxK/04FMlaWsmQ
	8FcrNIj31RXlVkwTBe4=;
DKIM-Signature: v=1; a=ed25519-sha256; q=dns/txt; c=relaxed/relaxed;
	d=slavino.sk; s=e2023; h=Content-Type:MIME-Version:Message-ID:Subject:To:From
	:Date:From:Reply-To:Sender:Subject:To:Cc:Date:MIME-Version:Content-Type:
	Message-Id; bh=eCVakIo3cKCvrkxyBo8/dmAkbQLPkbVc/K//QwakS0Y=; t=1736590089;
	x=1737799689; b=9JMX45iR26yRYSiUpND0/NTNMnoXXMPBrU+W/FIWx51fTNumS8UWHNNTiGDjw
	XEmo0CrmO52awLJRKjZhlQdAg==;
Received: from dovex.skk ([192.168.10.12])
	by primex.slavino.sk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <linux@slavino.sk>)
	id 1tWYPR-002AJA-0g
	for netfilter@vger.kernel.org;
	Sat, 11 Jan 2025 11:08:01 +0100
Date: Sat, 11 Jan 2025 11:07:59 +0100
From: Slavko <linux@slavino.sk>
To: netfilter@vger.kernel.org
Subject: list sets
Message-ID: <20250111110759.6bc33181@bonifac.skk>
Face: iVBORw0KGgoAAAANSUhEUgAAADAAAAAwBAMAAAClLOS0AAAAFVBMVEX7+/xrTUz4//3Ozc10AAH5/v3///8f7tJ8AAAB2UlEQVQ4jW2STY6EIBCFSwmumykPQDTtGqxO74kcgNiJa8dE7n+EAfzBtONCpD5eVfko8Pszeb+sflqOPVyA535abyB+9wnfwMgek/8XFEO33sE6lYWB/8HLqOUOFre87H+g9LK2P7y6p+o+1mJ1B75j1g7VeFeshTXifbfEza+goAqqLyAhAKsC+QahqVD9o74VYxGB6PUBJl+C5FwCUhEUSEpCM41PmGYJABK07oNk0EQQAw54K9KDGAQhl6C4ewDwJnZjjVZptQaD0PQSOqC4R2x0Btg76HwbI5oE1Rt4WUPhvG9cjAht+00SvlD5JThQQYiY2g6s3oBRzXMzgG1nKS2asDr+HPb0aSGmsiWwS9r4+rxP0M1tkgxQW/PzewF+pqPKgEV1cbdiCQxUB+AyaJzeq5AmfQG+IEwtDSTwIU8ArtBCtSKYpEg/lhNwFnwYGi2I3qRhPkGpYx5kmmBqtcrgg5hcUrxhqBicoNh6wnB11vaXP/8lkSYkeYaan4CJV7RQVtFm88jAxSlE8M85XonKgM91qBwtmnVt+1z86eI1+/3OMLc7tgbV5k1IhtndMnS/j6x3dAEciB/D7VuVwQI5Po9h1E7Au/kkq89gKt3ziMu1SuAPWe5Dq/EEywcAAAAASUVORK5CYII=
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi,

recently i start to use fail2ban with nftables and it works. It uses
separate (configurable) table for its rules, where it puts particular
sets.

But i noticed, that while i can list all sets in nftables, or limit
that list to particular family, i cannot list sets of only one table:

    nft -t list sets inet f2ban
    Error: syntax error, unexpected string, expecting end of file or \
        newline or semicolon
    list sets inet f2ban
                   ^^^^^

That result matches with the manpage, but it is surprising for me,
especially when the sets belongs to table by definition...

Please, is here some special reason for that limitation, or just nobody
coded it yet?

regards

-- 
Slavko
https://www.slavino.sk
