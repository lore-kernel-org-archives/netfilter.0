Received: from outbound5i.eu.mailhop.org (outbound5i.eu.mailhop.org [35.156.234.212])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 418A61CCB4A
	for <netfilter@vger.kernel.org>; Fri, 15 Nov 2024 13:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.156.234.212
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731678077; cv=none; b=O/PtlWsKTjCwqJSoJN5aRI/JFxEgFBPhaNEvn/DveVcs9Tti5Fbr2/2Q35quufLnRoua6c3QDyB3Cby7vGTAKxGg7NF8ljUa+tEB2b14OR+gHkR5UnGiN/2UAVsXSytsYLarBSfjfsQ3zhAsN0T8tcdDBcYUnoXI7jAyA03fTvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731678077; c=relaxed/simple;
	bh=pTwHFKbi1Ca6XwJ02kylJ9Q56QkyhUfN05ufGgpNdZE=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=usUZjP9ZmAQlAgoisqHdG7SvdNJ88HarEWwo59qx2ECx4GRefxaExXJ3F5TiCGktqAPT5+8gPOT+rCZykLBWN02IRN8E5bcNsOgSVhxjK9rz3R2GW7VgcqLTOb9FIBL5Ix6v6Pyfv4qtB1DckiLj2B2lRDUETjnFmpPzPkujX7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=koeller.dyndns.org; spf=none smtp.mailfrom=koeller.dyndns.org; dkim=pass (2048-bit key) header.d=outbound.mailhop.org header.i=@outbound.mailhop.org header.b=G1BqyNuF; arc=none smtp.client-ip=35.156.234.212
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=koeller.dyndns.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=koeller.dyndns.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outbound.mailhop.org header.i=@outbound.mailhop.org header.b="G1BqyNuF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=outbound.mailhop.org; s=dkim-high;
	h=content-transfer-encoding:content-type:subject:from:to:mime-version:date:
	 message-id:from;
	bh=5BEEwK5O16x/5fdXZfCGlccpUyrZEDl+dSPQsELQ9rM=;
	b=G1BqyNuFImy2DQkw1r1I+zSI5sEtp08JXv7JV3Viqo1Bj1ETXFqeLbj77h1BAug4n8ZUMHPsBfMrx
	 eKm2/ddEpJHeT82lGPocf+FHkfNPPiruTTk4hUbmzc+qadJf+jBl0JHiXqtBDheKrU9eWeXWzUHTPL
	 sJmoDSr16nERWHhQc5LFFX9N260eWvUbLY4wcUyk39iADY/opdLLYcKSUfjgM4fymmx6CVL8gM0oF3
	 o0M/ip7XPJhWQJIENJP55Luojz0Om9tQFy8700YXaAVRQV+G7BUMT11LhfuLI5E21l6IHp4o7wx4zE
	 nIdrVMXnOB66TfGBUNKcuZm2YYa8g9g==
X-MHO-RoutePath: dGtvZWxsZXI=
X-MHO-User: 39e7c822-a357-11ef-a067-7b4c7e2b9385
X-Report-Abuse-To: https://support.duocircle.com/support/solutions/articles/5000540958-duocircle-standard-smtp-abuse-information
X-Mail-Handler: DuoCircle Outbound SMTP
Received: from mail.koeller.dyndns.org (unknown [31.18.63.92])
	by outbound2.eu.mailhop.org (Halon) with ESMTPSA
	id 39e7c822-a357-11ef-a067-7b4c7e2b9385;
	Fri, 15 Nov 2024 13:41:12 +0000 (UTC)
Received: from [IPV6:fd46:1ffa:d8e0::1] (sarkovy.koeller.dyndns.org [IPv6:fd46:1ffa:d8e0::1])
	by mail.koeller.dyndns.org (Postfix) with ESMTPSA id 77C2B96A1EA
	for <netfilter@vger.kernel.org>; Fri, 15 Nov 2024 14:30:52 +0100 (CET)
Message-ID: <74938b68-c482-4e54-a158-e3f379ba20c6@koeller.dyndns.org>
Date: Fri, 15 Nov 2024 14:30:52 +0100
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: netfilter@vger.kernel.org
Content-Language: en-US, de-DE
From: =?UTF-8?Q?Thomas_K=C3=B6ller?= <thomas@koeller.dyndns.org>
Subject: rule insertion
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

When adding a rule to a chain, I can specify the handle of an existing 
rule. The new rule is then inserted after that one. So how do I insert a 
new rule at the very top of a chain, right before the first rule? I 
tried using the handle of the chain itself, but that didn't work.

