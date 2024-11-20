Received: from primex.slavino.sk (primex.slavino.sk [185.25.250.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F784156F39
	for <netfilter@vger.kernel.org>; Wed, 20 Nov 2024 08:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.25.250.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732090643; cv=none; b=i1BP9zOXj3J7J8TES/hmNNzESPaKnpbh86o/wfbYHhYXIDE1zle1+oxa/udbnOipMIw3hB9awsx9u+rsEJos8QNTP6aOCWMp0bP1XgJhT/2n4igUBIlIHZY9aGWgAtjpubU2WvK+f/nW7vxm5uyaRDas2D6pUE559DQdj+Bl0P4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732090643; c=relaxed/simple;
	bh=6um0mFgI/BVXsrFSTT/Nr+ACRjm0pfcwlsBvPAX720A=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=UOC3rJ7P6aCcf51hr81uc81hLidt+PwpWO9/rAXAfTX+KuQBwI6K7cC2i8Pm9ngZLKiNBCPcMb0/lOkq7Ds8K5UFlUDVmu0kW87UeP1Bi82YI1z5ROeJWjCE4GmMwBlSuPd3oU7Uy/M3eEv1dzazKt2/jW9nASgw1e/zqtW9G4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk; spf=pass smtp.mailfrom=slavino.sk; dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=lWOPDNkN; dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=hxJaq7Cs; arc=none smtp.client-ip=185.25.250.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=slavino.sk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="lWOPDNkN";
	dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="hxJaq7Cs"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=slavino.sk;
	s=r2023; h=Content-Type:In-Reply-To:Autocrypt:References:To:From:Subject:
	MIME-Version:Date:Message-ID:From:Reply-To:Sender:Subject:To:Cc:Date:
	MIME-Version:Content-Type:Message-Id:In-Reply-To:References:Autocrypt;
	bh=R/GfVpLChKmHqSzvqLw5PXBdAxl1mlfd+CsJ3aztIP0=; t=1732090639; x=1733300239; 
	b=lWOPDNkNcmgi9kJh4K4h88OCo98LGd7jNyxS35GOQ+N7wvpxJF7c8E3xTYmTxG8+Nb+EnmMyY7Q
	EfqwiDl50/Tw2+fI9ZSQAJo+R2QxuywuGWGpA6qAq0Lc/ndkIoarMx5jII3KF7Adv6MXds1u6jWY4
	4R8wi0RkqHVto5z9CXQ=;
DKIM-Signature: v=1; a=ed25519-sha256; q=dns/txt; c=relaxed/relaxed;
	d=slavino.sk; s=e2023; h=Content-Type:In-Reply-To:Autocrypt:References:To:
	From:Subject:MIME-Version:Date:Message-ID:From:Reply-To:Sender:Subject:To:Cc:
	Date:MIME-Version:Content-Type:Message-Id:In-Reply-To:References:Autocrypt;
	bh=R/GfVpLChKmHqSzvqLw5PXBdAxl1mlfd+CsJ3aztIP0=; t=1732090639; x=1733300239; 
	b=hxJaq7CsXbBY4+RKN347yfhpDEnOJTU+vKxSxzMzO/xw2EcbcJ/VgeYwrlgy5juxeu//1f3TwxM
	AqqXg2UBiBQ==;
Received: from dovex.skk ([192.168.10.12])
	by primex.slavino.sk with esmtpsa  (TLS1.3)(Exim 4.96)
	(envelope-from <linux@slavino.sk>)
	id 1tDftj-000q7c-0N
	for netfilter@vger.kernel.org;
	Wed, 20 Nov 2024 09:17:15 +0100
Message-ID: <fd59a4c5-0063-4b32-93e5-e078a44270e8@slavino.sk>
Date: Wed, 20 Nov 2024 09:17:13 +0100
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: set with limit
From: Slavko <linux@slavino.sk>
To: netfilter ML <netfilter@vger.kernel.org>
References: <756a9507-5ecf-4ba4-a8d3-d364f13dbfd5@slavino.sk>
 <20241119160617.GA21970@breakpoint.cc>
 <A49323C1-3811-4863-B527-57738F247231@slavino.sk>
Content-Language: sk
Autocrypt: addr=linux@slavino.sk; keydata=
 xsBNBE2fIMwBCADjOr4MY1rKxZnb4hsEdYBDFIHhZO9U3iLN/rNWSFKh3LeERd3Bu5gMz7Hk
 kn0nsoV2ijRKTLlXE0yzUtoJL+8WdNdWONt//cYcl8Z9V80uGFWfL6h0XWlqlup4XLTPZYz9
 7f/k1UsTltiIWd5hK6JU+PA6bFVO3ogq9Nx6ru6pNzQtx6D7D5ND9/4rN45MIYolEMMC2/1J
 bvM8PFdwB+QmJbj2fKb7jboKFS34VrUQ9xsVJske9/lC0MTWN1HT+dFiXvvue7TmwOgBAd/B
 24eGPVtcA2D13IRqhItDTS1DtacnzY3Okx/OEMdUIhjqKCBUGHeP22SagvAaKi8UYBBrABEB
 AAHNIVNsYXZrbyAoTGludXgpIDxsaW51eEBzbGF2aW5vLnNrPsLAeAQTAQIAIgUCTZ8gzAIb
 AwYLCQgHAwIGFQgCCQoLBBYCAwECHgECF4AACgkQg/mquDkYjbYGXAf9FbEfo0wF7hfYgqll
 CfNSoCcGcj1WkqqXD0kkAY/5wIFTbOOtrGn7TijhuFu9aIzjd+K+3Q9tk4Tt6MSg9ibp25b2
 HLZPp8UiyPLeE0BAWFgAgtOrrIDg8VkvjfO2jSJjkHhHOWVP1xZYSlApNNhU1KUit7RE0ueV
 bWG45a8ONSp+eNCSHkgMC8VtoF3oMegi0rgFUXSdiEsZlrpXo0Q7HPFObg2ElTC9QgFr6Lmh
 uw6I+BvXE0arwa+4ndcesb5pV6TDONOrihgYvZIyZ6V4Bgnt9C6lvK1Y/e62W73YBAEIvQo7
 j90m0lrBEAMhUhj4aGooeJQ2b/aXkrBwc+9vos7ATQRNnyJKAQgAp8mP9O2fH0KnS1yJzAz+
 7fAM8dxFJbagFkv5ljvQ/qkEYh4uI+hWjgV7ok9+9kuzFiHbv8nczhcMr/J0JX4kok/5B5B4
 QuBdCXAoeAiWaPB4V6peLXheJKsBbBP/wNAFthJitt4P5XXrZbL4hv4+5Vm/uYXXYdQczGYa
 2UGMVZxYyH1wh3Ywfk2c4RvPfxfe7Q8pdvpK8U+mKKVDQ6kaTEJXB4EGkp80ncpEDmJEzqvj
 svKoHHruMUnuJdNkuKvE/knpiOw9jbifIkTQfLEJKgmJE6OpgQ5SEJpGBtCTEJr9Wo1l38ji
 6ujrUZyjBerdcucsXOKXk3n8mJhy4pshfQARAQABwsB8BBgBCAAmAhsMFiEEz0au30POX8OO
 zaE5g/mquDkYjbYFAmACuOoFCRY5xCAACgkQg/mquDkYjbYddAf/SWvH2Z5J23ZNqxpdORYU
 jUyHISTo3WaO0k72VdIHJqCHR+XSerysTyuBO4mf8SYQ2VpkIVLbOfxLKoHNt7jeVa+bjVki
 OFCjRPFhn3K+CVPwK45gvDqaAzQI4FAf2zCtdD0Zt44rwkb2e7RP7kGcI5EirVpU14bDk71g
 lE2JSezwkRYU+4ZUrDo9tGcUzJYjwHMvLXR5+yRIV+gqea1nb6871CtKh1w00X2VUXjDBtXo
 xSAd+NoTI57gwlnQOavvaITo8eGAnpSx9qA2k25uSVH76dn8KpL6O3b9MWfGn4o2KbA+3Cpg
 taCpoGgpKB7I+cQ4VywRYFH9rEMRgmr9Kw==
In-Reply-To: <A49323C1-3811-4863-B527-57738F247231@slavino.sk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dňa 19. 11. o 19:00 Slavko napísal(a):
> On 19. novembra 2024 16:06:17 UTC, Florian Westphal <fw@strlen.de> wrote:
> 
>>Looks like 5.10 is too old, listing should show limit expression was
>>attached, i.e.:
> 
> Thanks, i will try with meter tomorrow...

Yes, with meter it works:

     nft list meter inet filter base_log4
     table inet filter {
         meter base_log4 {
                 type ipv4_addr
                 size 65535
                 flags dynamic,timeout
                 elements = { 10.60.65.78 limit rate 1/minute burst 2
                              packets timeout 1h expires 59m58s208ms }
         }
     }

thanks again.

-- 
Slavko
https://www.slavino.sk/

