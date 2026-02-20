Received: from mail.localities.work (unknown [89.231.102.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA8B33FE07
	for <netfilter@vger.kernel.org>; Fri, 20 Feb 2026 11:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.231.102.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771585743; cv=none; b=HaWU5z7jsjsBMQIcxdKALjVdIsUr8x0qj8xud/u4s9jzk01YIuwd9Lm0gD9+9WXy06Fir1Zv27FRLenF6U3V0OPape9pdlvD9nz/wzs7Syt+rn6x9NL+UjozO8RTk4tGVUZSWVVtjkFbEFVjOUIbd+YGoBZuuiTOrcZ8nlYxoXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771585743; c=relaxed/simple;
	bh=WwE0b8SPXLUNkP0hAgSo68KBBsUSYAxckk7dnEOZlZ0=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=Qdl6aIEpcrjCLwanyCFFN+9y/aSatMd+JwFdTWGE/hZQcz5sm8dx4Nz4ScMurOqUN/SQq8qq/9UOSkde2km7rY8Zv9XEKNhpb8u+IS4N5D1eki184hhZKFtkdtORo37cO6ubK2XvaBgB1SwZzh78j9t5qPMxnWNcf7Ej2jEY2Ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=localities.work; spf=pass smtp.mailfrom=localities.work; dkim=pass (1024-bit key) header.d=localities.work header.i=@localities.work header.b=JIDdpaaV; arc=none smtp.client-ip=89.231.102.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=localities.work
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=localities.work
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=localities.work header.i=@localities.work header.b="JIDdpaaV"
Received: from localhost (localhost [127.0.0.1])
	by dzien.mine.priv (Postfix) with ESMTP id A9ECD8093703
	for <netfilter@vger.kernel.org>; Fri, 20 Feb 2026 12:09:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=localities.work;
	 h=content-transfer-encoding:content-type:content-type:subject
	:subject:from:from:content-language:user-agent:mime-version:date
	:date:message-id:received:received; s=dkim20251117; t=
	1771585741; x=1772449742; bh=WwE0b8SPXLUNkP0hAgSo68KBBsUSYAxckk7
	dnEOZlZ0=; b=JIDdpaaVent/ain4f/ZKEzKnEWfGo85qWSsOSrSOjYbbJufisrM
	ae8cHQy3+V38ALchvE8yLgpVIvntlEVO2UdNrOjHH4iQZmTggAAQRcpk73XItEj/
	9XTzKqYYuH2lIuP9PIMk94wusrqRlNwjXtp7gJvfAS0Ka2+JIatJ9tAY=
X-Virus-Scanned: amavis at mine.priv
Received: from dzien.mine.priv ([127.0.0.1])
 by localhost (dzien.mine.priv [127.0.0.1]) (amavis, port 10022) with LMTP
 id 9XCUDUcwnXpJ for <netfilter@vger.kernel.org>;
 Fri, 20 Feb 2026 12:09:01 +0100 (CET)
Received: from [10.3.0.10] (unknown [10.3.0.10])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by dzien.mine.priv (Postfix) with ESMTPSA id 81A278093702
	for <netfilter@vger.kernel.org>; Fri, 20 Feb 2026 12:09:01 +0100 (CET)
Message-ID: <37d6e23b-a14f-470d-b97b-2466849fc4ce@localities.work>
Date: Fri, 20 Feb 2026 12:08:59 +0100
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: netfilter@vger.kernel.org
Content-Language: en-MW, pl, pl-PL
From: listy <listy@localities.work>
Subject: dummy net iface?
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi guys.

'dummy' network interface - I get that those are meant to be 
kind of a sing/black-hole but... should such iface not 
port-forward on itself? (as oppose to other ifaces, which it 
does not I think)
So, I cannot get "normal" port-forward - firewalld with 
nftables as per default in Fedora, which I try to do it with 
- because it needs more tweaking for "dummy" ifaces _do_ 
port-forwarding or.. they do _not_ - do you know?

many thanks, L.
