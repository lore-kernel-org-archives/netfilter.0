Received: from mx04.uni-tuebingen.de (mx04.uni-tuebingen.de [134.2.5.214])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E38A213E67
	for <netfilter@vger.kernel.org>; Mon,  3 Mar 2025 15:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.2.5.214
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741017035; cv=none; b=hixJEYRWVxMevelBUJMe9rspEQJlka7J6LXGaF4iqMVP+troZxo5u9SRNQs0AQV+Cnd/rdblH8oLubQnudYn3hTLwi8pehuhpaU35zRszVml39h7yVLuRDlJ+qzCPHvDL+0RziSFt0ktrqeUlrjHaFXa6XzbS9wy5X+053slovE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741017035; c=relaxed/simple;
	bh=mp0KjDjybimI0joV2pAXruab5CrZA6TZZC2E3/jSl3Y=;
	h=Date:Message-ID:From:To:Cc:Subject:References:In-Reply-To:
	 Content-Type:MIME-Version:Content-Disposition; b=E19uaL2LnxXlKSf8AnjyDXFEkOzz6hDAQ0JFbsc4vWbH/0ZCeiarfTw7ngJSzoTAQivL743EmA8IKLZEFrUOaLluAvKpgdw2W6lheilJpvRR5J0jrkeYhU4QC258KoIPB4ng2HBgf79s7xNMxPwxxhIloItwrAfNLYh1lVF66EI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zdv.uni-tuebingen.de; spf=pass smtp.mailfrom=zdv.uni-tuebingen.de; dkim=pass (2048-bit key) header.d=uni-tuebingen.de header.i=@uni-tuebingen.de header.b=ieQYcjAG; arc=none smtp.client-ip=134.2.5.214
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zdv.uni-tuebingen.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zdv.uni-tuebingen.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=uni-tuebingen.de header.i=@uni-tuebingen.de header.b="ieQYcjAG"
Received: from webmail1.uni-tuebingen.de (webmail1.uni-tuebingen.de [134.2.5.194])
	by mx04.uni-tuebingen.de (Postfix) with ESMTPS id E91DC20AAB84;
	Mon,  3 Mar 2025 16:50:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx04.uni-tuebingen.de E91DC20AAB84
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uni-tuebingen.de;
	s=20211202prod; t=1741017022;
	bh=eMmTMIK+dpSl0LLzgCaQl3kbbDWCrGsU6mP32y3Xarc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ieQYcjAGtf5vt2SJkqa9p3MGc0MvjWzzjXugga0r+6AHITBBHj4qyEr9sudA78Yr0
	 8J+VP73+hh9xx3GrGQoM3ErxOuqvIVDaP1fBcuTCvrwHcecFjfc7TM6Y8tUyWPSt5r
	 JZ6q+DpnuMo9dubWJX3teHWtuf5bXzGQ79tn0bpUxFRQWO2TGYcWU9XJpYTQ1fyDf0
	 P7Za18OW9Qsm8/4r9ERtM9gzxNc5ZkH0Awenq9hlyvaM1+ze6o36FcoTX8q1g2L8oX
	 6Lr3LYkwmQScy1wXdN64bxsmxuFJZx8o0XIyM+fe17wAl9TCeZGehDP/oZqV8JhYCx
	 k5fSQQfTtVQzA==
Received: from webmail1.uni-tuebingen.de (localhost [127.0.0.1])
	by webmail1.uni-tuebingen.de (Postfix) with ESMTPSA id DD69C60D1DC2;
	Mon,  3 Mar 2025 16:50:22 +0100 (CET)
Received: from [2a02:8070:8984:8400::966c] ([2a02:8070:8984:8400::966c]) by
 webmail.uni-tuebingen.de (Horde Framework) with HTTPS; Mon, 03 Mar 2025
 16:50:22 +0100
Date: Mon, 03 Mar 2025 16:50:22 +0100
Message-ID: <20250303165022.Horde.zz0jv6tjsYLYlAYzTWTTTN8@webmail.uni-tuebingen.de>
From: Michael Menge <michael.menge@zdv.uni-tuebingen.de>
To: Florian Westphal <fw@strlen.de>
Cc: netfilter@vger.kernel.org
Subject: Re: nft reset element crashes with error BUG: unhandled op 8
References: <20250228151158.Horde.S7bxprjzrKb3P7rZjqTDZz_@webmail.uni-tuebingen.de>
 <20250228142507.GA24116@breakpoint.cc>
In-Reply-To: <20250228142507.GA24116@breakpoint.cc>
User-Agent: Horde Application Framework 5
Content-Type: text/plain; charset=utf-8; format=flowed; DelSp=Yes
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit


Quoting Florian Westphal <fw@strlen.de>:


> No, you can update existing element timeouts:
> nft add element inet filter updatesv4 {1.2.3.4 timeout 1h expires 1h}

I did test this, but it does nor reset the "expires" counter",
in which kernel/netfilter version was this implemented?

Kind Regards

    Michael


--
--------------------------------------------------------------------------------
Michael Menge                          Tel.: (49) 7071 / 29-70316
Universität Tübingen                   Fax.: (49) 7071 / 29-5912
Zentrum für Datenverarbeitung          mail:  
michael.menge@zdv.uni-tuebingen.de
Wächterstraße 76
72074 Tübingen

