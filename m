Received: from primex.slavino.sk (primex.slavino.sk [185.25.250.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC5783D9027
	for <netfilter@vger.kernel.org>; Tue, 26 May 2026 10:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.25.250.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779791537; cv=none; b=hTqdOVePlgREgspy1QlFgYucppgc+0VAO4xiZPLYiF3pdwNyRXybOtauuwd5/g62pjeLvmYtxSf5KAs5p2SLm+5WwGhfqq8NFZJs33olcMYrOmqSumbbRkVhU8e1IWuzzg9mPOfdD4PFcYix4hoaNMRJbaNV6N8YIgepyZat2ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779791537; c=relaxed/simple;
	bh=QpRphMHTkPA6MNLjLk19cW1WKrefYQbnWOYA6RBBX1g=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=BdVjErGuViHTjERJFPuWlB5WohMPx/aSzYsOjo2ELfuF903VT/5m0vhqny+x90U1IVWfOIE/qyD7jAm/mxG0p35Jv33zWDJtjWSNP6O9RuQ9UkdT1kwszZkBqrh4GTMozyjxiznsN3GJNULaYX5yoZqzVTx5lFNNncL6cQBDX7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk; spf=pass smtp.mailfrom=slavino.sk; dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=lOMC/RsA; dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=t4tj6Sme; arc=none smtp.client-ip=185.25.250.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=slavino.sk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="lOMC/RsA";
	dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="t4tj6Sme"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=slavino.sk;
	s=r2025; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:From:
	References:To:Subject:MIME-Version:Date:Message-ID:From:To:Cc:Reply-To:
	Subject:Date:Sender:Content-ID;
	bh=hkjwFcDisrYcdOTp+UveNpm2lNQsq4byzuVPj84Pt1M=; t=1779791534; x=1781001134; 
	b=lOMC/RsA4e4a4h366U68+ZsaXjqLSDGG8WzzN50JSLwtqP7TgSIACQHLxufTLZnZjVZ93uWQlA2
	E6ddn4f6/265CdxnNRx78QEQJzUBzJ5rX1e103yfENPhp0m8uPaOIB0+b8f99REJkAhuLcKbDCu+l
	8vPnUugUeZptxobM85A=;
DKIM-Signature: v=1; a=ed25519-sha256; q=dns/txt; c=relaxed/relaxed;
	d=slavino.sk; s=e2025; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	Autocrypt:From:References:To:Subject:MIME-Version:Date:Message-ID:From:To:Cc:
	Reply-To:Subject:Date:Sender:Content-ID;
	bh=hkjwFcDisrYcdOTp+UveNpm2lNQsq4byzuVPj84Pt1M=; t=1779791534; x=1781001134; 
	b=t4tj6SmenUnLTxQFpd8+ZC7BsB//0PPMSl9yQWscH89BO1eUePuTYVrNCSgfUoa2be4agQJNL6N
	J/cIG9aU9Cg==;
Received: from dovex.skk ([192.168.10.12])
	by primex.slavino.sk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <linux@slavino.sk>)
	id 1wRoxo-0012bT-0T
	for netfilter@vger.kernel.org;
	Tue, 26 May 2026 12:24:44 +0200
Message-ID: <cf36c2f7-80f4-45b8-9091-2ce7f8007be6@slavino.sk>
Date: Tue, 26 May 2026 12:24:42 +0200
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: ipset not completely working in mangle:PREROUTING
To: netfilter ML <netfilter@vger.kernel.org>
References: <20260525205736.1c76666f@playground>
 <a276ecef-e609-4d55-bc71-ddb9c9ff2f3c@app.fastmail.com>
 <20260525235754.4943a2b6@playground>
 <1c466022-e165-fda9-f356-8fdd4d474e15@blackhole.kfki.hu>
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
In-Reply-To: <1c466022-e165-fda9-f356-8fdd4d474e15@blackhole.kfki.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dňa 26. 5. o 9:51 Jozsef Kadlecsik napísal(a):
>>> On Tue, 26 May 2026, at 1:57 AM, imnozi@gmail.com wrote:
>>>> iptables v1.8.7 (legacy)
>>>> ipset v6.34, protocol version: 6
> 
> That's pretty old. Still it has no effect on the subject.

I have even older ipset/iptables (v6.32/v1.4.21) on my router and it 
works as expected in manlge's PREROUTING chain:

   16M  975M drlst_drop  all  --  *      *       0.0.0.0/0  0.0.0.0/0 
match-set droplst src

That is only excerpt, it is after accept of ESTABLISHED,RELATED and in 
chain based on input interface...

regards

-- 
Slavko
https://www.slavino.sk/

