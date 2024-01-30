Received: from tootai.net (mail1.tootai.net [213.239.227.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E6574C66
	for <netfilter@vger.kernel.org>; Tue, 30 Jan 2024 13:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.239.227.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706619606; cv=none; b=XLR5vODSibDct7P+Wl2Tpb5mLFaXLnUnmWAq6wbvBBAi5ECnsjUzfBmtUv5l/FUXVl6c3wDQkGnTg8RapkdWI5cFTQpPMEmT9aS9GOza9AFgHL3sTEEFofrDekM22kbkrOALuHC4RfKC6goGGDonY5RV0dIdTrVcAD0f//pvcZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706619606; c=relaxed/simple;
	bh=Ec8qVaZBRdjoj7CGhLmfIxt2TDqlYoK//c3bui+E3XA=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=JuJSGNiRCfUkwkCIEUG6+wAZQOF+MY4tP2k1KAqW2eYtfSmvf62ns/J5dzl3Tz8bNA0/cb4v2bp1CnvOo52ePJV/8X08DCvMdZheeXO9Gr+8llRmHbXNNrk/h9wKXAi8amf08DCkN3XfBexsL1J9JkR3zEERfbqRoNjrgsPcBtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tootai.net; spf=pass smtp.mailfrom=tootai.net; dkim=pass (1024-bit key) header.d=tootai.net header.i=@tootai.net header.b=Utp65k1n; dkim=pass (1024-bit key) header.d=tootai.net header.i=@tootai.net header.b=HAjjkmv4; arc=none smtp.client-ip=213.239.227.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tootai.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tootai.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tootai.net header.i=@tootai.net header.b="Utp65k1n";
	dkim=pass (1024-bit key) header.d=tootai.net header.i=@tootai.net header.b="HAjjkmv4"
Received: from tootai.net (localhost [127.0.0.1])
	by mail1.tootai.net (Postfix) with ESMTP id 022266081733
	for <netfilter@vger.kernel.org>; Tue, 30 Jan 2024 14:00:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
	t=1706619600; bh=Ec8qVaZBRdjoj7CGhLmfIxt2TDqlYoK//c3bui+E3XA=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=Utp65k1nojp5XHe5AR4Cj9+8zCZUaypK363vYwEYxjPQWzxfH9LKYnuoSf0ff6BMd
	 dyznijFx83asVhwLnBr5BJK1nj5/jltsgp5VPbhy5XZ1kdtOBGjD4yQJxcwuRrXKRj
	 A61aWzqG+7mNZQy+5AGw/inK2y7Lzf4W0g4QfoQA=
X-Spam-Level: 
Received: from [IPV6:fd99:1234:beef:cafe::24] (unknown [IPv6:fd99:1234:beef:cafe::24])
	by mail1.tootai.net (Postfix) with ESMTPA id C117760817DB
	for <netfilter@vger.kernel.org>; Tue, 30 Jan 2024 13:59:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
	t=1706619599; bh=Ec8qVaZBRdjoj7CGhLmfIxt2TDqlYoK//c3bui+E3XA=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=HAjjkmv4ODu412FNUsuvUTYUNmCBNvUZs2wWg6mZtWY5u9UqAdpYksTQWVbzmu+qV
	 /DiqWPSR/wpszZPLkSIXpSklzmnwcegs40uPMhlwP0+ZvC8ZqTAK+cIC7Mwix7D11D
	 zQCPmjms8RvkgHp3uURyFbaKL6Pa0ddUDl7jLQTI=
Message-ID: <abd824ae-067a-47b0-be27-815b66956eeb@tootai.net>
Date: Tue, 30 Jan 2024 13:59:59 +0100
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Combine ipv4 and ipv6 in a set
Content-Language: fr-FR
From: Daniel <tech@tootai.net>
To: Netfilter list <netfilter@vger.kernel.org>
References: <be623941-d82e-4430-b6ea-5bdbc5b48da8@tootai.net>
 <e0e61628-b7b4-4df7-9665-0168fa741fe0@app.fastmail.com>
 <1824e291-7196-4d4c-a180-8a99a5b2dc98@tootai.net>
In-Reply-To: <1824e291-7196-4d4c-a180-8a99a5b2dc98@tootai.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP


Le 30/01/2024 à 13:13, Daniel a écrit :
> 
> Le 30/01/2024 à 11:39, Kerin Millar a écrit :
>> On Tue, 30 Jan 2024, at 10:17 AM, Daniel wrote:
>>> Hi,
>>>
>>> nft 1.06 Debian12. Is it possible in a set to combine ipv4 and ipv6 ? If
>>> not, does it exist another method to do this ?
>> Combining is impossible. However, the value of an ipv6_addr element is 
>> permitted to be an IPv4-mapped IPv6 address.
> 
> As simple it is, thanks.

I have a question: if I want to check a source ipv4 address against a 
mapped ipv4, how to configure the rule ? I get a datatype mismatch as 
the set is of type addr_ipv6

add rule inet filter input ip saddr @reaction-banned-ips drop is not 
accepted.
