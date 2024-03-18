Received: from tootai.net (mail1.tootai.net [213.239.227.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6640243AA3
	for <netfilter@vger.kernel.org>; Mon, 18 Mar 2024 20:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.239.227.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710795472; cv=none; b=oK8JDFjU5qlOpaK2BBTcmungNLx9iPFbkyjPWQKl2nVJljdv1tcgLnuFjEIG296N4HOuc6aQjMjyQrGJ56pXPiFwBy6OV8f6kpe6i0P+izLMcyHy4JeGXF//UL5nwEGBk+x10xdJKVo8JEp/hHgRnRVfmSpv0aGzldh2LLrwOo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710795472; c=relaxed/simple;
	bh=gf70dyRgAJHb+mFtjhkGjlwbdF/zy2/C69QgGrhKTsg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=a0ssNqrncuCosSdCWJChwMe5fMSi++1+0YddbxZzGgSUTbemZVN2Q2naTDDf6BYJltxR44ll0k5LBCcUDYC33meIrmNkZE4zu9IbuuW6O0ud+SWfhI6L1P71Z9KbFSPyibct6X8iqkYj/21YlZekLlW/lky1d+Q3/+c+md/1+4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tootai.net; spf=pass smtp.mailfrom=tootai.net; dkim=pass (1024-bit key) header.d=tootai.net header.i=@tootai.net header.b=XJCEk+Dn; dkim=pass (1024-bit key) header.d=tootai.net header.i=@tootai.net header.b=XJCEk+Dn; arc=none smtp.client-ip=213.239.227.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tootai.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tootai.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tootai.net header.i=@tootai.net header.b="XJCEk+Dn";
	dkim=pass (1024-bit key) header.d=tootai.net header.i=@tootai.net header.b="XJCEk+Dn"
Received: from tootai.net (localhost [127.0.0.1])
	by mail1.tootai.net (Postfix) with ESMTP id 406F56081701
	for <netfilter@vger.kernel.org>; Mon, 18 Mar 2024 21:57:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
	t=1710795466; bh=gf70dyRgAJHb+mFtjhkGjlwbdF/zy2/C69QgGrhKTsg=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=XJCEk+Dn5bzUYDTRTvMHRbb0r9f57Zx7QqFcDpAEvTyTUVcXFX8FQSGjHgr3rmlcF
	 QEHrzr43s3cdMr+nieAYXDnAOWs83CRNrMfhqzSAy4KyJuZgBv+d0oFyeGc5/DrsWt
	 V32ZCpxZYXG1oF5vdx/wvpibjcZcSWQ0vLVVFGx0=
X-Spam-Level: 
Received: from [IPV6:fd99:1234:beef:cafe::24] (unknown [IPv6:fd99:1234:beef:cafe::24])
	by mail1.tootai.net (Postfix) with ESMTPA id 0727B60817F6
	for <netfilter@vger.kernel.org>; Mon, 18 Mar 2024 21:57:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
	t=1710795466; bh=gf70dyRgAJHb+mFtjhkGjlwbdF/zy2/C69QgGrhKTsg=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=XJCEk+Dn5bzUYDTRTvMHRbb0r9f57Zx7QqFcDpAEvTyTUVcXFX8FQSGjHgr3rmlcF
	 QEHrzr43s3cdMr+nieAYXDnAOWs83CRNrMfhqzSAy4KyJuZgBv+d0oFyeGc5/DrsWt
	 V32ZCpxZYXG1oF5vdx/wvpibjcZcSWQ0vLVVFGx0=
Message-ID: <e8b74206-90a3-42d3-9393-dce4d856d713@tootai.net>
Date: Mon, 18 Mar 2024 21:57:45 +0100
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: IP not banned in interval set
To: Netfilter list <netfilter@vger.kernel.org>
References: <6586f71b-92d7-447a-bca4-d3b2dbacba20@tootai.net>
 <eb843fc3-8b22-48e0-a9ca-d6ac94f28c8e@gmail.com>
Content-Language: fr-FR
From: Daniel <tech@tootai.net>
In-Reply-To: <eb843fc3-8b22-48e0-a9ca-d6ac94f28c8e@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP


Le 18/03/2024 à 21:14, Gordon Fisher a écrit :
> On 3/18/24 09:36, List Support wrote:
> [...]
>> set toban4-smtp {
>>     type ipv4_addr
>>     flags interval
>>     auto-merge
>>     elements = { 194.169.175.17-194.169.175.18 }
>> }
>>
>> chain input {
>>     type filter hook input priority -100; policy accept;
>>     ip saddr @toban4-smtp tcp dport { 25, 462, 587 } drop
>> }
>
> [...]
>
> Side question, are you really using port 462, or did you mean to write 
> 465 (standard SMTP SSL port)instead?
Indeed :)

-- 
Daniel
