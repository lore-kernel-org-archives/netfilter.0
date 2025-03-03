Received: from cerberus.halldom.com (unknown [79.135.97.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87FC21E285A
	for <netfilter@vger.kernel.org>; Mon,  3 Mar 2025 18:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.97.240
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741028367; cv=none; b=LgjwDCR5fG8rUNK4x0ZYhuz0wEPRKS0Qhw2mKry66GhATVmS7w27ixJwrRLLek9XlyyV+soIXJTxcAOW2upAnqet5heF2hn46SMBsBKL75s3ODDv+8RLtBW+KRcypgPihddpFEjB9yrf/AJJ1H0zHKasnW2kpZ9kb0EB9M7MUes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741028367; c=relaxed/simple;
	bh=R8ViPUSnaw1TBfQKD1n7+FanzTgsLNLRd1yyadzsj/E=;
	h=Message-ID:Date:MIME-Version:From:Subject:References:To:
	 In-Reply-To:Content-Type; b=A6wcb48xCO75j7zL/hk0yo+ILIB9gEAcx8uQNWMUhL7KU0nharNMFV2oOsiaEpPhf5sbWiJo93+D862MlLqDfRYKOvs6ut5psA17BeCf5eh5ptcCCpT7A+jc5AcTfLvEjQEbVIDMlMSq6XBokiCIpfDEif26ylrh28pITe6VrPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gmch.uk; spf=pass smtp.mailfrom=gmch.uk; dkim=pass (2048-bit key) header.d=halldom.com header.i=@halldom.com header.b=OQqWc98a; arc=none smtp.client-ip=79.135.97.240
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gmch.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmch.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=halldom.com header.i=@halldom.com header.b="OQqWc98a"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=halldom.com
	; s=key20240618; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:To:
	References:Subject:From:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=JfLAnEdLyADdu9VJoHgeQutOW/nLZLkZ8D6zdCrtVz4=; b=OQqWc98aobDkJh2XdkX3Wa42/a
	wQ5G2/h/aAuW+4eTQfD9mIw8PTs9WX2jGSzsAWOvfm7C2WdOk/tEJjvvX8YQIB33k+OiT2AxeG3FV
	THLnN1ysx84U1phosUbzf2B2jyzGStIsfZlqr4fx/w3GtCWW6vZpWhfZM+oGTwNtWzS3FTUNBZat+
	s+cjznILj9kSw0w0+BuTJSi5VNrvjsyeI1/8/oF35JC8foY/N+5e4+LM3kCAItODYTndBn9xr8Fmf
	HrVMX0OBq/s7j41ksBuNvRHf2XdfpaJ85fXoMfU3hB/+rS32wStRQ6tx2QP7XDZl8FqAJhn7mP06P
	U3bobPlw==;
Received: from [79.135.97.241] (port=49752)
	by cerberus.halldom.com with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(Exim 4.98)
	(envelope-from <netfilter@gmch.uk>)
	id 1tpALN-000000000M1-0Vfn
	for netfilter@vger.kernel.org;
	Mon, 03 Mar 2025 18:16:45 +0000
Message-ID: <e526722b-9ec7-49db-8b22-a756a390b24c@gmch.uk>
Date: Mon, 3 Mar 2025 18:16:45 +0000
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Chris Hall <netfilter@gmch.uk>
Subject: snat and Port Numbers
References: <93e5770f-86d1-4c07-b9c9-ba8953e1796c@gmch.uk>
Content-Language: en-GB
To: netfilter@vger.kernel.org
In-Reply-To: <93e5770f-86d1-4c07-b9c9-ba8953e1796c@gmch.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


I'm trying to understand what ports the netfilter snat will map TCP/UDP 
connections to.  I've tried, but failed, to find answers elsewhere :-(

---------------

For iptables the SNAT target may be set:

    --to-source [ipaddr[-ipaddr]][:port[-port]]

where [according to iptables-extensions(8)]:

    "If no port range is specified, then source ports below 512 will
     be mapped to other ports below 512: those between 512 and 1023
     inclusive will be mapped to ports below 1024, and other ports
     will be mapped to 1024 or above.  Where possible, no port
     alteration will occur."

Is the nftables snat the same ??

If a port range is specified, will all source ports be forced into that 
range ??  Or are source ports below 1024 still mapped separately ??

Then there are the /proc/sys/net/ipv4 entries:

   ip_local_port_range:        32768   60999
   ip_local_reserved_ports:    <empty>
   ip_unprivileged_port_start: 1024

Do these interact with the source port mapping for snat at all ??

RFC's 4787 & 5382 REQUIRE "Endpoint-Independent Mapping".  Is that 
supported ??

Thanks,

Chris
