Received: from achilles.binarus.de (achilles.binarus.de [167.235.4.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA621420DD
	for <netfilter@vger.kernel.org>; Sun,  2 Feb 2025 16:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=167.235.4.162
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738513959; cv=none; b=LK0rHhjudhqTg1zX6nItSZT3NDit5QWlkzfr/67jpgYDDoZJ2KHmVJfSakWtU3vNwlxZfKB4LtA1Pxbw3qf9tKaX8Hp+SbRh8HeX7JtYQBfi0GqxTN2wPFny5R+NUXmZxOPiYv808LYKlv2hSkF24OKv/ZH/rp1vdD1aW6nAQv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738513959; c=relaxed/simple;
	bh=0mX/g3n/f/nMcxVilcjJQv4m8aJPVKs1mFwN8Coa2Nk=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=L/Qs77m6pQnWSuiw/5uJDsG5frPEQpqRymA0faHZxIqjwUhsXmBxlwNZG1oDC+METwcKxtmpzMXUntwSKUzcVeHlZhgzwceq/wvuwpIB2RvWCvCbxHdRdlFcn1CY2EAbpJHSZCbuGyt0lXi+/UxOr5yp5aqVrjDQR1aZi3arBb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=binarus.de; spf=pass smtp.mailfrom=binarus.de; dkim=pass (4096-bit key) header.d=binarus.de header.i=@binarus.de header.b=KSnRv14R; arc=none smtp.client-ip=167.235.4.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=binarus.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=binarus.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=binarus.de header.i=@binarus.de header.b="KSnRv14R"
X-Envelope-To: <netfilter@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=binarus.de;
	s=b201601; t=1738513945;
	bh=0mX/g3n/f/nMcxVilcjJQv4m8aJPVKs1mFwN8Coa2Nk=;
	h=Date:Subject:To:References:From:In-Reply-To:From:Reply-To:Subject:
	 Date:To:Cc:Resent-Date:Resent-From:Resent-To:Resent-Cc:In-Reply-To:
	 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	 List-Post:List-Owner:List-Archive;
	b=KSnRv14R4ByR6MMRUNvhLSAUFik9mkMnNw+0S0rROXtSEnwEBQ8Zw4aj2lnLor7dA
	 rYzchVoocOR07AjDMnPkiKQrHwXmwtAw0z75Y7U7MazJdtvCu5s9bSfjpteu3rTtjh
	 g9WwP17Aqz3Gev0y5WJB7WU5qBclQNkkyi8dOVshqTFxl8f4bDCXZ3VkO1m8sakmYe
	 ofg1KdVC/WtMOsQJ4DprOI6v68Zquyn0EkbA/iDXW56VHYXo5EGvw8zhJ+PWiKqXGJ
	 9lqWYU5nML5SA6JSIj/muOo36MTJD9Lk4rWjqipRuQeBOOc9WREmb+73tCiQN+2rrG
	 sUTYrXnfq+GK8qqSftwbk+WiLvtMbxOVkJnx1HVxpNYj+3bipNooqlFpqrAi/q+f9w
	 xNFS88Odq1Ls42gVs3sfAFFRtgIHUzMe4BRaaklDl+M7OAvxr38ew1yOXdwqgg7rg5
	 VIH1U1mSYhWQFZKxjcNVKpgxOCqqtpkoUftg+H+JQPNd6F57TdyYzvpBX6P12zn9lb
	 8JUsPXk9E2CcxcVQyp4x1PHLYt21ofHs0N5DX9WzCPuTTOAWYPMDluUd1AJrpjDx03
	 cFvBIjkhl0tDweaOOAyX5arnRlAj0Y9kuiyUVJKjzQ/RWbdZ/v2cyQ6314HD37zqdH
	 B3CVHEkwlcSlThh1vLaVypLQ=
Received: from [192.168.20.100] (p54969e67.dip0.t-ipconnect.de [84.150.158.103])
	(authenticated bits=0)
	by achilles.binarus.de (8.15.2/8.15.2/Debian-22+deb11u3) with ESMTPSA id 512GWOwx3381113
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netfilter@vger.kernel.org>; Sun, 2 Feb 2025 17:32:25 +0100
Message-ID: <3ba5aa4e-754f-41e3-8e3b-ce8269d509fd@binarus.de>
Date: Sun, 2 Feb 2025 17:32:23 +0100
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: Netfilter not dropping packets as it should
To: netfilter@vger.kernel.org
References: <ee288424-68d5-44e4-95e4-91cf43751e54@binarus.de>
 <A7C91E02-4420-41B8-806B-0A3C14922208@slavino.sk>
Content-Language: en-US, de-DE
From: Binarus <lists@binarus.de>
In-Reply-To: <A7C91E02-4420-41B8-806B-0A3C14922208@slavino.sk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Bin-MAIL-FROM: <lists@binarus.de>
X-Bin-RCPT-TO: <netfilter@vger.kernel.org>



On 30.01.2025 21:33, Slavko wrote:
> On 30. januára 2025 19:35:28 UTC, Binarus <lists@binarus.de> wrote:
> 
>> Please consider the ruleset that's at the end of this post. It doesn't make any sense, but it lets everybody reproduce the problem easily.
> 
> IMO, try to set in prerouting hook:
> 
>      nftrace set 1
> 
> And then try to connect to SSH and post output of:
> 
>      nft monitor trace
> 
> While i don't know how netdev table steps in play, we
> then will not need to guess...

Thank you very much.

I would like to apologize for the noise, because it seems that I cannot reproduce the problem any more. Therefore I can't provide the output of nft monitor trace. I have no clue what initially caused the problem, but obviously, it was my own fault. The ruleset actually is working as expected.

Best regards,

Binarus

> 
> 
> -- 
> Slavko
> https://www.slavino.sk/
> 
> 

