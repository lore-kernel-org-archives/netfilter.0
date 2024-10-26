Received: from mail.thelounge.net (mail.thelounge.net [91.118.73.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1AB6217F3F
	for <netfilter@vger.kernel.org>; Sat, 26 Oct 2024 11:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.118.73.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729941356; cv=none; b=SQgbDuwug+LmJyLMmpG2PdarhmwZ6AKgn+rPvXmollPAdWWwNQ6JHvMzWva9Ti57xD4R3mYaQg9Y7tYa4D8Ehnl56jJ8OwFxeETYynjw+Fh5o9sUImGkOPhK3z2ZZ1agLZUnQosJBFaS3ZRjmCNsOJWOJ7Oi1rs/0ws517yeoI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729941356; c=relaxed/simple;
	bh=aXHWZ/H528gA/p97ldtc6L3WWvkPI/8xA8WnsS0l7U8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Wuap5uuR5v16BBMnU5mD9piE+gmPENJ6qmntzaHPQfvrd1NWB4m9IVFDkoJglDdN0J/KNJFjuBTlDynSLT8XcdtunZoz4OMcAIs1zXYGxFNipZvEZ0W2CFXz5n4p8sHjPCfTF1vcWztygahRZfmELflyc4kH/eKxoiNHW4jisYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thelounge.net; spf=pass smtp.mailfrom=thelounge.net; arc=none smtp.client-ip=91.118.73.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thelounge.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thelounge.net
Received: from [10.10.10.2] (rh.vpn.thelounge.net [10.10.10.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: h.reindl@thelounge.net)
	by mail.thelounge.net (THELOUNGE MTA) with ESMTPSA id 4XbHBr4wxDzXLL;
	Sat, 26 Oct 2024 13:15:43 +0200 (CEST)
Message-ID: <05641870-3448-4c7d-8e37-ab5956a5aa89@thelounge.net>
Date: Sat, 26 Oct 2024 13:15:43 +0200
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: IPtables rate limiting question
Content-Language: en-US
To: Kerin Millar <kfm@plushkava.net>, Slavko <linux@slavino.sk>,
 netfilter@vger.kernel.org
References: <CAMa3rT49eeJT-rKdrVRXyfQd91cvQy=Cid55X2RFEpP4P5hFJg@mail.gmail.com>
 <85253915-6d36-483f-a84b-69de4a1ba161@app.fastmail.com>
 <B840B6F3-FBF2-449E-9AE6-F713CE6BE111@slavino.sk>
 <a166ff38-c2d8-4528-b0f7-8b72d50159ec@app.fastmail.com>
 <07588221-314c-4ccd-9344-3696d267a870@thelounge.net>
 <58bbba7a-958b-4153-92dc-2090f464fb06@app.fastmail.com>
From: Reindl Harald <h.reindl@thelounge.net>
Autocrypt: addr=h.reindl@thelounge.net; keydata=
 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
 K4rYsjPimkSIVdrNM//wVKdCTbO+
Organization: the lounge interactive design
In-Reply-To: <58bbba7a-958b-4153-92dc-2090f464fb06@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Am 26.10.24 um 13:05 schrieb Kerin Millar:
> On Sat, 26 Oct 2024, at 11:23 AM, Reindl Harald wrote:
>> Am 25.10.24 um 23:37 schrieb Kerin Millar:
>>> On Fri, 25 Oct 2024, at 9:13 PM, Slavko wrote:
>>>> Dňa 25. októbra 2024 18:12:56 UTC používateľ Kerin Millar
>>>> <kfm@plushkava.net> napísal:
>>>>
>>>>> To that end, consider taking advantage of ipsets. Below is a sample ruleset in iptables-save format.
>>>>>
>>>>> *raw
>>>>> :PREROUTING ACCEPT [0:0]
>>>>> :OUTPUT ACCEPT [0:0]
>>>>> :limitban - [0:0]
>>>>> -A PREROUTING ! -i lo -p tcp -m conntrack --ctstate NEW -j limitban
>>>>
>>>> Please will conntrack really works in raw table? I live in that raw table
>>>> happens before conntrack...
>>>
>>> Probably not
>>
>> for sure not
>>
>> The poster did not say which table they are using
>>
>> he did! >>> *raw
> 
> He (Francisco) certainly did not. It was I that wrote "*raw" and to whom Slavko was replying
anyways - "--ctstate" is nonsense in RAW and everybody should know that
the whole point of RAW ist to bypass conntrack

the whole conntrack stuff is misplaced in case of rate limiting - at 
that point all packets which belog to existing connections are already 
accepted by a conntrack rule at the begin

you fill your ipsets after conntrack did it's job and the DROP rule 
don't need any ctstate - after the decision this IP has to be banned was 
made it don't matter which state a packet has

hence THIS rule belongs to RAW to bypass conntrack


