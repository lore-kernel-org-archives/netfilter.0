Received: from primex.slavino.sk (primex.slavino.sk [185.25.250.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E997122258F
	for <netfilter@vger.kernel.org>; Tue, 11 Mar 2025 07:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.25.250.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741679602; cv=none; b=FsgzhfaFm1l4F1BDd6z/RAbzoy6WW2lJv1Mcy2XBpz+ePlMDg77jEAnTXASoMm43QXEh/OT85Wp4bDFD6GaPTqLEayTXOo1NfuP0OGYxLtIVN2T6BFE87eO4mGfFxWsGShIsS+4AYx9jTqCzeWx0675vMkiHyQp8Xcy7ui3iIeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741679602; c=relaxed/simple;
	bh=UbRdiN+Dg7KsElgP+jRghMRKmIg08NP8Z5WuNSFpv/8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=idF5drCPPkzmYsjjqfz8v2iVOLIVcDSOVSsCtTt3g/KAQUHHIOHmpeAAXbitD/uHodyca4VlI2S+M39rKir8XXnV0H6nDHocdkCECruMqsapN/8YGuxTU178qjIWzZsunnIe6jluwacDXIFoFFPEIjOx5CYhnIDKI5R9Up/BVs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk; spf=pass smtp.mailfrom=slavino.sk; dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=cstSp8WK; dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=ePSe0j/U; arc=none smtp.client-ip=185.25.250.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=slavino.sk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="cstSp8WK";
	dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="ePSe0j/U"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=slavino.sk;
	s=r2025; h=Content-Type:In-Reply-To:Autocrypt:From:References:To:Subject:
	MIME-Version:Date:Message-ID:From:Reply-To:Sender:Subject:To:Cc:Date:
	MIME-Version:Content-Type:Message-Id:In-Reply-To:References:Autocrypt;
	bh=jM+a82EYSd/nLBGIIiWVF0WOv5jhDkN+D1qaN+T7/ak=; t=1741679599; x=1742889199; 
	b=cstSp8WKtHX94TB8RgUTv1Ju13QmCupXNe16LdbPE5v4iXg/jaQ843NmfvX+ONAfNvYlvlKfs5C
	hgwO71SNjJfapaZt0S502Yu2EkPzHT4HOQ1GhswXEXCgzJ8E98/VESsnREASMUjg3cIYouHMV3DHi
	AUcq0NhbIjC9B/QKW/c=;
DKIM-Signature: v=1; a=ed25519-sha256; q=dns/txt; c=relaxed/relaxed;
	d=slavino.sk; s=e2025; h=Content-Type:In-Reply-To:Autocrypt:From:References:
	To:Subject:MIME-Version:Date:Message-ID:From:Reply-To:Sender:Subject:To:Cc:
	Date:MIME-Version:Content-Type:Message-Id:In-Reply-To:References:Autocrypt;
	bh=jM+a82EYSd/nLBGIIiWVF0WOv5jhDkN+D1qaN+T7/ak=; t=1741679599; x=1742889199; 
	b=ePSe0j/Us+gZsWMGGOFzEOgZneczrh4LtuQHZEE6ng45zapQ+J7htP2ZFNSkgqghM3TyKPGvvzj
	88EhZFBc3DA==;
Received: from dovex.skk ([192.168.10.12])
	by primex.slavino.sk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <linux@slavino.sk>)
	id 1truQG-002Yi8-2f
	for netfilter@vger.kernel.org;
	Tue, 11 Mar 2025 08:53:08 +0100
Message-ID: <bf1fc6b8-1cbd-43a5-945c-a34f9fe3418f@slavino.sk>
Date: Tue, 11 Mar 2025 08:53:07 +0100
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: ulogd2, sqlite3 and negative TCP Seq numbers
To: netfilter ML <netfilter@vger.kernel.org>
References: <20250308111405.441477a1@bonifac.skk>
 <20250308204559.178294db@gnosticus>
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
In-Reply-To: <20250308204559.178294db@gnosticus>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dňa 8. 3. o 11:45 Adam Nielsen napísal(a):
>> Not all are logged as negative, i collet (and pair) all yet logged:
>> 
>>     LOGEMU         SQLITE3
>>     3489577139 -> -805390157
> 
> If I run this in bash:
> 
>    $ echo $[0x100000000 - 3489577139]
>    805390157

For now i add trigger into SQLite DB, to correct value if it is less 
than zero, seems to work::

     CREATE TRIGGER ulogd_fixsig1
     AFTER INSERT ON ulog_pkt WHEN NEW.tcp_seq < 0 BEGIN
     UPDATE ulog_pkt SET tcp_seq = NEW.tcp_seq + (1<<32)
         WHERE rowid = NEW.rowid;
     END;

Please, can someone take look on it in ulogd2 code?

-- 
Slavko
https://www.slavino.sk/

