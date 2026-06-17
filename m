Received: from achilles.binarus.de (achilles.binarus.de [168.119.77.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2FC93AFD01
	for <netfilter@vger.kernel.org>; Wed, 17 Jun 2026 10:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.77.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692214; cv=none; b=sSzV6fRHSrjIUIZNjwdAdivnHXYAYZk9KIl6k0Z1hEu36/BTMIKYmth/nuTcRXpEBmMGKWZvCwSNcHig266RL+Ee+zPV5knZWoSumNh77BxllEn4XhctdXNHtlEatVP9pr3YYvObPaktTvg/qMvxlAWMHn9ix+D9oovzAhHTSQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692214; c=relaxed/simple;
	bh=+q5LEfOFjuw+/te5E+yGAg54vryVM6dbXEJwt1J0c1Y=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=sqIUr3srR0e56iMiD+2VTyiiReGo2oDbQ2Do8rgUFuv2PLchJ5I627tAhofMDLJyOA6Dbo+LCtP0Te6BNME7BWoSfkTkHz7lyA2uM/ZIGf1kywQN0MrA8MSLejYuqDmdlQOsCC2z0AIru02TNVIJLZ03Bwon7L0xBuK/kKpsN3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=binarus.de; spf=pass smtp.mailfrom=binarus.de; dkim=pass (4096-bit key) header.d=binarus.de header.i=@binarus.de header.b=YnamttyG; arc=none smtp.client-ip=168.119.77.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=binarus.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=binarus.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=binarus.de header.i=@binarus.de header.b="YnamttyG"
X-Envelope-To: <netfilter@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=binarus.de;
	s=b201601; t=1781692202;
	bh=+q5LEfOFjuw+/te5E+yGAg54vryVM6dbXEJwt1J0c1Y=;
	h=Date:To:From:Subject:From:Reply-To:Subject:Date:To:Cc:Resent-Date:
	 Resent-From:Resent-To:Resent-Cc:In-Reply-To:References:List-Id:
	 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
	 List-Archive;
	b=YnamttyGJORojAAVqxfgGXwNw+upDlpoAcKzM9DY+4xXX4/xk3+OVq3svQovcsLEO
	 IdNAWIxSW4MZf9/IfTJBKrcwM5XN41aM+/fGRszK7YnROL7h9M+rO+wgCSiw9gnWhk
	 9VQZW7T1yk3CdOdFuKQOVPVLnrAtaK//2qakozKr4o9KkmVsA+ebZHZNVQPPp/Lcch
	 3HtD519fwFGHl7ukhzKmsKCr52nI5/KeUMOaZlOOZkZxWrK7AV0OKZCGevhd277D67
	 yWTruO8mZ68MmNhchYTul0ePH4opvRUNuWDkUsM6+cURGBP3Etx3dVU04CFzv0TGc3
	 DySdean8bFmzG54yXRKVby4X6UA+H+O9+z2bI2yoOmxX/dAIuWT+AOdiOv/v3TSHWu
	 JAj3vDlyK+jm6jdJQk3dXHHjmFphJOwCZ6VyQKyaePpZ/HjrdAmlmXQBvpi4m0wfb9
	 DQBoc91Wk9Y2US056Hrp4u7YS2EI+lpdmqRFLXw/15+7wX+T4Pnpe8thELUXHRV3s1
	 M8Qm3+RAZ3bhBpGir0w2KWkjz5Ea+DFIL61/E+93kY0c5Oih/0i+pwxrmyI8DV1dap
	 Lrof1zibhgW9BFBAOx2lWPw7rTDAQ7I1l3RFWfcqViqvXZcpgOsbSxMC1vTP58i0kh
	 13LKYCKTNF7/D8VFftKomQoo=
Received: from [192.168.20.100] (pd9531579.dip0.t-ipconnect.de [217.83.21.121])
	(authenticated bits=0)
	by achilles.binarus.de (8.18.1/8.18.1/Debian-6) with ESMTPSA id 65HAU2wd1772459
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netfilter@vger.kernel.org>; Wed, 17 Jun 2026 12:30:02 +0200
Message-ID: <bb1f251d-fb7e-443f-8e04-8d3ee00bf7ab@binarus.de>
Date: Wed, 17 Jun 2026 12:29:28 +0200
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Content-Language: en-US, de-DE
To: netfilter@vger.kernel.org
From: Binarus <lists@binarus.de>
Subject: Is the article "Secure use of iptables and connection tracking
 helpers" (by Pablo et al.) still relevant?
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Bin-MAIL-FROM: <lists@binarus.de>
X-Bin-RCPT-TO: <netfilter@vger.kernel.org>

Dear all,

I've come across the following article (which has been co-authored by Pablo):

https://github.com/regit/secure-conntrack-helpers/blob/master/secure-conntrack-helpers.rst

All statements of this article make sense in my eyes. I have understood that it relates to iptables, not nftables, but it seems that the underlying reasoning and explanations are valid for nftables as well.

However, since the article is 14 years old (at least), I'd like to know whether it is still up to date and whether we should follow its recommendations.

For example, the nf_conntrack module in modern kernels (e.g., 6.12.90 on my Debian trixie system) obviously does not have the "nf_conntrack_helper" parameter the article mentions. Hence, setting it to 0 does not effect anything. Setting the "port" parameter to 0 seems to do the trick, though.

Background: If finally have upgraded my firewall from iptables to nftables (and have learned a lot in doing so). Now I'd like to improve security further by applying the recommendations from that article to the nf_conntrack_sip helper module (I have an asterisk instance running on my local network that communicates with the internet / the telephony providers via NAT, so I have to use the conntrack sip helper to make telephony work).

In other words, I' like to know whether we should still prevent the automatic loading of the nf_conntrack_sip module, and how we can achieve that.

Thank you very in advance, and best regards,

Binarus

