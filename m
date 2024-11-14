Received: from outbound2.eu.mailhop.org (outbound2.eu.mailhop.org [35.157.29.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B73171C32
	for <netfilter@vger.kernel.org>; Thu, 14 Nov 2024 14:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.157.29.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731592964; cv=none; b=ZlzoS4e9jH7ehFdTwO6V+nnyr+8SbRwRCl2h9PcJLiBYmMYHn7mDhwVuzjybrESJy7xEXDWRCgkLHqmm7/wDP5SRGJeVGwE8CAmnd1fq14PmSMdTXGLVef++t4xNMgqZ766lliw044FWGbYokpg4nI8VOw7Y7LR5iHeQpI3Zqig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731592964; c=relaxed/simple;
	bh=RG5yAeflv3tohgXXM8hh7cwC4adFTqFktVbgXWAdNPY=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=E0bPp34f/BKKu+GBkHGvJ+tqxT3NWL7hB/jNOaHtJY0Y1rLeZODSmwKDA6nTfGaE86A/3Cpjorm/tpL6Ox6/jCxJ3tArGSdCLIBHFFko9OlplO3nzH46zbGWSeQFBrdfzs0aGo8uBSpeZ30aHSSOYVTQaEpY5rFb7Yi34/F6HjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=koeller.dyndns.org; spf=none smtp.mailfrom=koeller.dyndns.org; dkim=pass (2048-bit key) header.d=outbound.mailhop.org header.i=@outbound.mailhop.org header.b=FU7I86Bv; arc=none smtp.client-ip=35.157.29.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=koeller.dyndns.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=koeller.dyndns.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outbound.mailhop.org header.i=@outbound.mailhop.org header.b="FU7I86Bv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=outbound.mailhop.org; s=dkim-high;
	h=content-transfer-encoding:content-type:subject:from:to:mime-version:date:
	 message-id:from;
	bh=jX2WzzEDkrArDo5NTqTyMwiQg9qqGG3r2DNi2bKue8E=;
	b=FU7I86BviEy803r85FLafdh/8r6s+6cLIAKdt8bJI7oQmrmwYmyhB/NxYJP5GRIrwtDKm/D5c1VYa
	 2y1gMu8e1XM647rW6if5Ax6TD/Dba+GT/EP9idefRWu3JLB5Me5eejkwVAfpOD6uAA1Ze/u11sAZuh
	 pBy+qasTRHT4NhQjmhX7KsnehLrCeS58ZGXMk2HQ8WUVzu4z53XYafx1X7yFRMjeDyssxEgdYNVN35
	 +R7gMCN6SOZIJ6veUZjsg7m/dHNmncFyBNdEQ5+Y5CYzEqaQOtf1oimtKqeoSE2rkhy2mD5TIXu2zW
	 TrnQkijavlso01/amgDRPy757+hcdIw==
X-MHO-RoutePath: dGtvZWxsZXI=
X-MHO-User: f48256e6-a290-11ef-a024-7b4c7e2b9385
X-Report-Abuse-To: https://support.duocircle.com/support/solutions/articles/5000540958-duocircle-standard-smtp-abuse-information
X-Mail-Handler: DuoCircle Outbound SMTP
Received: from mail.koeller.dyndns.org (ip1f123f5c.dynamic.kabel-deutschland.de [31.18.63.92])
	by outbound2.eu.mailhop.org (Halon) with ESMTPSA
	id f48256e6-a290-11ef-a024-7b4c7e2b9385;
	Thu, 14 Nov 2024 14:01:33 +0000 (UTC)
Received: from [IPV6:fd46:1ffa:d8e0::1] (sarkovy.koeller.dyndns.org [IPv6:fd46:1ffa:d8e0::1])
	by mail.koeller.dyndns.org (Postfix) with ESMTPSA id 24E4F969A5D
	for <netfilter@vger.kernel.org>; Thu, 14 Nov 2024 15:01:33 +0100 (CET)
Message-ID: <f6857dc4-84a7-4bc5-aefe-c3b893671e8c@koeller.dyndns.org>
Date: Thu, 14 Nov 2024 15:01:33 +0100
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: netfilter@vger.kernel.org
Content-Language: en-US
From: =?UTF-8?Q?Thomas_K=C3=B6ller?= <thomas@koeller.dyndns.org>
Subject: Dropping of the end of a chain
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

The nft manpage states that if the end of a chain invoked via 'goto' is 
reached without a verdict, 'evaluation will continue at the last chain 
instead of the one containing the goto statement'. I cannot make sense 
of this; what is the 'last chain'?

