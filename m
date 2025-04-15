Received: from primex.slavino.sk (primex.slavino.sk [185.25.250.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3AB823F410
	for <netfilter@vger.kernel.org>; Tue, 15 Apr 2025 08:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.25.250.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744704404; cv=none; b=VmKqy0Nhkw6jkThGVbH7B5AExU37BSPKsAUF+DvF4cbmDWbrT+WVi23Oqc5BlCB1UszYeUGWWTxXKpPsdpvd3rpimx/UPmyF17WG2y6Sjk1pTT7Y9snrBb8WOVp9UKJPB0OANrduPsWqQN9Wg7kdgZ4M674jAHfh01UmryfKWos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744704404; c=relaxed/simple;
	bh=hNvULS74VySiChvgrhHwEdUT5afoXay7CAZ8ehFi2HM=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=JJXFzqRdl/02RtFWswAirY2HQ9/rr5ag9aQHiYEMXgACUf5+o1Q6b60U/eWCiRFQgKYkY8Oqan6gktLcfVmlfKO3UIT5yuOlTmJ2ZLjrBqi0rUku+xBPEOzwq5FTB2FdMPud8QaMZCXBxmefcHXPwVV289xtKjZNLN0kXqhlsr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk; spf=pass smtp.mailfrom=slavino.sk; dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=lkABXlJi; dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=wxGrJK1E; arc=none smtp.client-ip=185.25.250.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=slavino.sk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="lkABXlJi";
	dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="wxGrJK1E"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=slavino.sk;
	s=r2025; h=Content-Type:In-Reply-To:Autocrypt:From:References:To:Subject:
	MIME-Version:Date:Message-ID:From:Reply-To:Sender:Subject:To:Cc:Date:
	MIME-Version:Content-Type:Message-Id:In-Reply-To:References:Autocrypt;
	bh=VUDp3zgtuHzHbAcCryyUg+wqbKVVkbLs/6hcISZUiFE=; t=1744704398; x=1745913998; 
	b=lkABXlJizpIoCYe7n3Jdf3p7U2Tcg0h63XK9JNMZLDhGEisTLNy3/fdkXjKrIiJqStZgk6v0JpU
	DrxNUkmvmAsa3nh6qfb6R6p3MG4u6TjgvU0WjsY74blX+UkyMAhgbIAFRfzsp0zh+MVKica6JtsUT
	ht7BORGoEEDbiQ2f5P4=;
DKIM-Signature: v=1; a=ed25519-sha256; q=dns/txt; c=relaxed/relaxed;
	d=slavino.sk; s=e2025; h=Content-Type:In-Reply-To:Autocrypt:From:References:
	To:Subject:MIME-Version:Date:Message-ID:From:Reply-To:Sender:Subject:To:Cc:
	Date:MIME-Version:Content-Type:Message-Id:In-Reply-To:References:Autocrypt;
	bh=VUDp3zgtuHzHbAcCryyUg+wqbKVVkbLs/6hcISZUiFE=; t=1744704398; x=1745913998; 
	b=wxGrJK1EgTRtTT8gEiKJDU2R33xOixha6I2R/7Gld4OPxTLMnjtn1AijjcqNcIgOz+TKsHSxg58
	aIW+3eIOyCw==;
Received: from dovex.skk ([192.168.10.12])
	by primex.slavino.sk with esmtpsa  (TLS1.3)(Exim 4.96)
	(envelope-from <linux@slavino.sk>)
	id 1u4bC1-000DXJ-1N
	for netfilter@vger.kernel.org;
	Tue, 15 Apr 2025 09:58:53 +0200
Message-ID: <d110693b-efa3-4742-8d6e-f56c83ef66ff@slavino.sk>
Date: Tue, 15 Apr 2025 09:58:52 +0200
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [ANNOUNCE] nftables 1.1.2 release
To: netfilter@vger.kernel.org
References: <Z_1KxMUDT0D8e6wH@calendula>
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
In-Reply-To: <Z_1KxMUDT0D8e6wH@calendula>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dňa 14. 4. o 19:49 Pablo Neira Ayuso napísal(a):

> - Set element auto-merge now skips elements with timeout/expiration.

please, can you write more about this?

regards
-- 
Slavko
https://www.slavino.sk/

