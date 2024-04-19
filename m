Received: from flopster.at.encryp.ch (flopster.at.encryp.ch [65.21.140.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F4319F
	for <netfilter@vger.kernel.org>; Fri, 19 Apr 2024 16:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.21.140.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713544253; cv=none; b=lfPVqLDwOXgu5zcvdV+jcDE96Db4MxKvywAeKyWU3hIpkBzpXvJCQtQmvg5pQ3vpv4jbt6V2X85BRtmsvbUvuNC1uWDz06flZZCqvEvYCoGjZr39UhukgTabTq9JAWvMZa4Sld73EYL7n66LjMKT1Vw0eKJrTqv4HL1H9JZLPcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713544253; c=relaxed/simple;
	bh=/4jW5wTW+GoXY6gq/w7kZ/2YKR1VB3lzhj6N+DVfdB0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=KK7RJbJ8x50ObQtYGiQO1H2YosD5MqPooNRCZIihlrssUsaxCM1GOtS+T4taJ1wPAqyqyi1ODCub4ZfHaf0U4QxtxOTkZngW6wU6nz+o6SlNfxjAqJ+w55gPH5eIRXypioDxY3KuD0LfgQv60GuxgWTBvXuxeO00BLIqYiHVoAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=at.encryp.ch; spf=pass smtp.mailfrom=at.encryp.ch; dkim=pass (1024-bit key) header.d=at.encryp.ch header.i=@at.encryp.ch header.b=Qxrq+cLs; arc=none smtp.client-ip=65.21.140.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=at.encryp.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=at.encryp.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=at.encryp.ch header.i=@at.encryp.ch header.b="Qxrq+cLs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=at.encryp.ch;
	s=flopster; t=1713544249; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YX8if9tka5CNOkAHVrKuxR/jsqvuQckKj15PInJVzzs=;
	b=Qxrq+cLs3KNaij635BFBWn3WLtwbhTM9I3iuvts/c7UU5/zzEzVZ5WgTWcvsKNNMiSHWzQ
	7LFLIRvpWhBvRN0DAUzh2dTaH6USFDsCoG8TD4MyFgHwdNwLlIhCASk9vJTBAjugTNdsPe
	/y/rXmf1+3OE6XF+PlrSh1LfG4CDWoo=
Message-ID: <7370616d-a6cbfe24-6b0a-4c74-8621-7fdc357facb2-at.encryp.ch-74726170@at.encryp.ch>
Date: Fri, 19 Apr 2024 16:30:45 +0000
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: How to measure/profile ruleset performance?
To: netfilter@vger.kernel.org
References: <20240419160232.4caca594@localhost>
 <7370616d-997afb3d-332c-4a26-afe9-e2a7c4e80c19-at.encryp.ch-74726170@at.encryp.ch>
 <20240419162811.43288975@localhost>
From: Serhii <lists@at.encryp.ch>
In-Reply-To: <20240419162811.43288975@localhost>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

I am not aware of any software-appliances or solutions to perform per-rule firewall performance evaluation, however there are a few hardware traffic generators that are able to squeze packets on a line rate speed. As for software frameworks, you might be interested in DPDK.

On 4/19/24 16:28, William N. wrote:
> On Fri, 19 Apr 2024 16:06:14 +0000 Serhii wrote:
> 
>> To evaluate firewall performance you would need to generate high
>> packet rate.
> 
> How to do that?
> And how will I know how individual rules perform?
> 

-- 
Send unsolicited bulk mail to carle34@at.encryp.ch
