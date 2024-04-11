Received: from mx.tnonline.net (mx.tnonline.net [65.109.230.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74B1C14003
	for <netfilter@vger.kernel.org>; Thu, 11 Apr 2024 15:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.230.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712849087; cv=none; b=Tiv9dMHTKyrcLA7q4uWSJqdhHt++qgiScP7YOECp0skGXIhfAfaiZ2wbMBdn56p7f4nYdfamuVISs4uatwip3vjpWKzjJMzubHnM/xnGCsVkAhrktM+bZomQPGUnseF/1/vko65pwLNoeyIro6LwPrrJrrEANCZaJ1HxTfuzQ58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712849087; c=relaxed/simple;
	bh=pEDMzjQR1cfFmNYIxlff+6Kkg/+YxdOi3bP7CgOnf9Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=KBt4E34RG7u9gmY/dYiBfU3Hx3OHoCeXOPURCz39WjYn9Q9x7HcgNea3/BenB2gTKCVCh550YX+E1qS4+GK8j+wf4q0+hFnnh5h6vbzsOHCaDIOPGP3IldQDytKzKIL57xFBhz+hp5Kv25vDz7BzKuvd8z2+Rli9XtNuOgLke80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=lechevalier.se; spf=pass smtp.mailfrom=tnonline.net; dkim=pass (2048-bit key) header.d=lechevalier.se header.i=@lechevalier.se header.b=QzFLb5De; arc=none smtp.client-ip=65.109.230.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=lechevalier.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tnonline.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lechevalier.se header.i=@lechevalier.se header.b="QzFLb5De"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lechevalier.se; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ApH5qF3rE2l8W6NYT/fnUcxFuIEHsgAsfP8HtXUWeYA=; t=1712849085; x=1714058685; 
	b=QzFLb5DetPhf/NAHZr6kbHAJaW0sAN9oBtkkKbDThKexR63yLP/beSdYqiVPSg3WL6sl2MFRqn2
	LiL3mnIWeYmyZyXYBDfjnXdwZGJl5GAtDV+1ooVoqPsr1MdNUFgbQ4lE63B+70Tuy/ZlkZWd4tnn8
	6+SFxMWZfvxoTrV8KjkBL3LtTsaczXs9BCTpCTmNzmL9aShZhHmgXzmYnhYcBonLHMxcuMXpQ2vgK
	ESYETJfytGvIfCth//VAyFJfFVmEh8Sy5c0wwEnANsGHw1BBLjzXWxw44wI1MUOMnZsplRfDQ2+lG
	XaapAg/XvXpcuBk99pFR4Wz/BPc8vcAEFNiw==;
Received: from tnonline.net ([2001:470:28:704::1]:39382)
	by mx.tnonline.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <postmaster@tnonline.net>)
	id 1ruw1y-000000000uh-3Xkh;
	Thu, 11 Apr 2024 15:08:03 +0000
Received: from [192.168.0.122] (port=39838)
	by tnonline.net with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(Exim 4.97.1)
	(envelope-from <mail@lechevalier.se>)
	id 1ruw1y-00000000Dq0-3CEZ;
	Thu, 11 Apr 2024 17:08:02 +0200
Message-ID: <08c870f4-eab8-46a2-bb09-afe8e49435fe@lechevalier.se>
Date: Thu, 11 Apr 2024 17:08:02 +0200
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Using iptables and ipset to DROP a list of 2 million addresses
To: Mason Kaufer <mason.kaufer@layeredsolutionsinc.com>,
 netfilter@vger.kernel.org
References: <CAEphJuhKcfOoMvATjubj7T31g32tMqpEKi=yE2OAnNf9768XyA@mail.gmail.com>
Content-Language: sv-SE
From: Le Chevalier <mail@lechevalier.se>
In-Reply-To: <CAEphJuhKcfOoMvATjubj7T31g32tMqpEKi=yE2OAnNf9768XyA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Score: -3.1 (---)

On 2024-04-11 14:39, Mason Kaufer wrote:
> Hi,
> I am currently trying to set up a firewall on an Ubuntu 22.04 machine
> that will block a list of 2 million plus ip addresses without slowing
> the network speed down tremendously. I have tried using ipset but I
> get an error that the hash size isn't large enough. I have tried
> manually setting the hash size but it only allows that option to be so
> large. Is there something I am doing wrong or is there a better way to
> achieve this? Any help with this would be much appreciated.
> --
> Mason Kaufer
>
Look at the 'list:set' feature. I have not tested this myself, but from 
the description it may act as a compound list.

https://ipset.netfilter.org/features.html


~Forza

