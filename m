Received: from primex.slavino.sk (primex.slavino.sk [185.25.250.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBF8D7DA93
	for <netfilter@vger.kernel.org>; Tue, 13 May 2025 05:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.25.250.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747113067; cv=none; b=IdbjXrmG6W2bxvC06RccSyo4B5IwVAJMSc9s5wEaSTcC8wzocFc6JisDvaha10bQwWUfHbmeCAyp/WDrSFQppL5z/E0P8dR/85diaYE2FmeLyOF/W4Pk2nhCRCyHZYZk1HPXn6e+iG1o9SV65T9Wx0j2cw/6+A3GuUttag7XGAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747113067; c=relaxed/simple;
	bh=8nlUq+nH1aF/pPt88AuvksA4UL7eY2gFHc0+j+5IJBw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=GnuKsY/YqlDUDsG0dL/dJz7teXxgQAV2sTDLjExNBrtpp4hUNTWWb5KQPZawuUjmKF0OHZVINg96+kD7k5BwK7rl++ssi5q3lI9wKCT4uEf34E7Lej2qfARlgTFOF+Ab3jBjrPj9D8AxLf1MI6ctXEmqwj8LE/EwsgaUmKxOsZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk; spf=pass smtp.mailfrom=slavino.sk; dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=IDAkKe+Z; dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=ybXGyYDl; arc=none smtp.client-ip=185.25.250.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=slavino.sk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="IDAkKe+Z";
	dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="ybXGyYDl"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=slavino.sk;
	s=r2025; h=Content-Type:In-Reply-To:Autocrypt:From:References:To:Subject:
	MIME-Version:Date:Message-ID:From:Reply-To:Sender:Subject:To:Cc:Date:
	MIME-Version:Content-Type:Message-Id:In-Reply-To:References:Autocrypt;
	bh=l/HWyhSCR6f6KSFiHgIG6JXlm2YvEwOjvD/uMm5jma8=; t=1747113063; x=1748322663; 
	b=IDAkKe+ZXXt0olZubtqUkyl5ezn68tuJkptdKlEXlm0XMSuVFK6QSoKoyn/WECIsH3NiVQFvp4a
	Ht+Q/WcRMNuEa4kdzXa052lWLHYpratEVkW4mRhzRR5eKLKavs+4tNipxtsigSWAgOJDAU7bXEw2U
	ZagzxicGsy54oUib+tw=;
DKIM-Signature: v=1; a=ed25519-sha256; q=dns/txt; c=relaxed/relaxed;
	d=slavino.sk; s=e2025; h=Content-Type:In-Reply-To:Autocrypt:From:References:
	To:Subject:MIME-Version:Date:Message-ID:From:Reply-To:Sender:Subject:To:Cc:
	Date:MIME-Version:Content-Type:Message-Id:In-Reply-To:References:Autocrypt;
	bh=l/HWyhSCR6f6KSFiHgIG6JXlm2YvEwOjvD/uMm5jma8=; t=1747113063; x=1748322663; 
	b=ybXGyYDldVx9fBKAV4wyCS8r9Sz7b4Af2toKyZqafSMiNFOefkfSu43FU2B+D3AYD4JTOtEgfJQ
	P3zhpo/vrCQ==;
Received: from dovex.skk ([192.168.10.12])
	by primex.slavino.sk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <linux@slavino.sk>)
	id 1uEhut-001Nwe-2z
	for netfilter@vger.kernel.org;
	Tue, 13 May 2025 07:11:00 +0200
Message-ID: <d3359027-b77e-4a82-8e63-acdbf1acba17@slavino.sk>
Date: Tue, 13 May 2025 07:10:57 +0200
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: Repeated SYN+ACK count
To: netfilter ML <netfilter@vger.kernel.org>
References: <6ABC13EB-FB13-4FBD-9FB8-57D16CCD109C@slavino.sk>
 <ryChuZBO4efft-2Z56m-00YfdyrIQvVzNX2tKtkdMku92epV_dOhk6wzT_UAr6JTM19JWayFCkCj6UBAtf6NSnnhHAPatzQjJyKyNZJ26K0=@protonmail.com>
From: Slavko <linux@slavino.sk>
Content-Language: sk
Autocrypt: addr=linux@slavino.sk; keydata=
 xsBNBE2fIMwBCADjOr4MY1rKxZnb4hsEdYBDFIHhZO9U3iLN/rNWSFKh3LeERd3Bu5gMz7Hk
 kn0nsoV2ijRKTLlXE0yzUtoJL+8WdNdWONt//cYcl8Z9V80uGFWfL6h0XWlqlup4XLTPZYz9
 7f/k1UsTltiIWd5hK6JU+PA6bFVO3ogq9Nx6ru6pNzQtx6D7D5ND9/4rN45MIYolEMMC2/1J
 bvM8PFdwB+QmJbj2fKb7jboKFS34VrUQ9xsVJske9/lC0MTWN1HT+dFiXvvue7TmwOgBAd/B
 24eGPVtcA2D13IRqhItDTS1DtacnzY3Okx/OEMdUIhjqKCBUGHeP22SagvAaKi8UYBBrABEB
 AAHNIVNsYXZrbyAoTGludXgpIDxsaW51eEBzbGF2aW5vLnNrPsLAkgQTAQgAPAIbAwYLCQgH
 AwIGFQgCCQoLBBYCAwECHgECF4AWIQTPRq7fQ85fw47NoTmD+aq4ORiNtgUCY9TvHgIZAQAK
 CRCD+aq4ORiNtoEBB/0d9egzccsfZh7gzMnee8TYgTOMB5rMLB1I+ZUgRwCkjBrOybV4L3sy
 fxp6OC645HYNYzpxIuQXlPVnHNFHuRaIDb1+2jt6HE3tKOkQEBSUnyQBEWrZM4nc9yA/7//O
 DleDDMAmMKV4VYprcBTt0aBVEnf+5wP5ykLoqKT6YN/EPNMtmujXtC9lQJgDENx/UAWdFsMZ
 5EW89UP3D+Vkd1z4YPSimHAmyXtzrh0zgOyO1NI6WZVoe+ik8leKKH60jBWQT+tFnvAnJyGT
 w42JNotsVBSLhR2Ra7sdBVTmIV99zBjEqHqcQTWXXN6/6eDy0VrUu1tRWusMS/eWju9gxxDT
 zsBNBE2fIkoBCACnyY/07Z8fQqdLXInMDP7t8Azx3EUltqAWS/mWO9D+qQRiHi4j6FaOBXui
 T372S7MWIdu/ydzOFwyv8nQlfiSiT/kHkHhC4F0JcCh4CJZo8HhXql4teF4kqwFsE//A0AW2
 EmK23g/ldetlsviG/j7lWb+5hddh1BzMZhrZQYxVnFjIfXCHdjB+TZzhG89/F97tDyl2+krx
 T6YopUNDqRpMQlcHgQaSnzSdykQOYkTOq+Oy8qgceu4xSe4l02S4q8T+SemI7D2NuJ8iRNB8
 sQkqCYkTo6mBDlIQmkYG0JMQmv1ajWXfyOLq6OtRnKMF6t1y5yxc4peTefyYmHLimyF9ABEB
 AAHCwHwEGAEIACYCGwwWIQTPRq7fQ85fw47NoTmD+aq4ORiNtgUCZ4tgQgUJHb/IeAAKCRCD
 +aq4ORiNtj3ZB/4oNyVEtcIa7kRbhUq0pwHwR8Rz15STenOUOr7+Sw4eJX2TO2PWs0CwP1Sq
 agt1BuiydjVUnk7Exqdx0GSVwsXI20BcC46UQkgutoiBuSynkqh2N2J+exrWdfFHOm5TwWTO
 oSEO4z8J460jeGs8DyTi+IqMatMQ6FanW7U6kEZupMMz0tqsa5b4o9E4bHS8oxPnKI/Cvufu
 3HGg7zW9GcFLjoeuNSXlbuqW9B+P7vTiTjRh5s3x8mlNUr6fjFtIUvJ/FkX/J5IRk5ylADox
 vURsV90WraN8tJM64uHvOdanFlEC9gD7kVj6ZL+FZ3638pbpDfcNEZkRlffniRzL3lc/
In-Reply-To: <ryChuZBO4efft-2Z56m-00YfdyrIQvVzNX2tKtkdMku92epV_dOhk6wzT_UAr6JTM19JWayFCkCj6UBAtf6NSnnhHAPatzQjJyKyNZJ26K0=@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dňa 13. 5. o 2:09 Sunny73Cr napísal(a):
>> tcp flags syn,ack / syn,ack ct reply packets gt 1 counter
> 
> It appears that you do not wish to act on these counted packets;
> so, I suggest parsing and analysing the packets with a script.

In really i (want to) act on it, but action is not related to problem, 
as the rule doesn't match anything.

regards

-- 
Slavko
https://www.slavino.sk/

