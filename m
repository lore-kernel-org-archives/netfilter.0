Received: from mail2.lcrcomputer.net (mail2.lcrcomputer.net [74.208.17.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 707033C1D70
	for <netfilter@vger.kernel.org>; Thu, 30 Jul 2026 15:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.208.17.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785425558; cv=none; b=GxD49GXXJEUObAZpR5xXkqGdPYw5GSJqvykHtxPF7u2x9nTUuQywa0D8kX7ga74e2J8Lj5WiJnuoHwUgnTUoAh0ZkF90p/BrZcwD6WSO38ZkzMMZZzLpKGwskKzoil0UVd8y5lv73kW+jw/xgWVZihJSZlGhROCC/erY9QHRNjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785425558; c=relaxed/simple;
	bh=bIkL3j1SUti+mxRknWXsGzjEHfZ++LfAOrCAj6OvBfk=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=N6EHqwDkKaSgTXS5az+WxFvSGAdwtSnNcqzbnpXAMYX4XdOi1jdfrw1me0wEfCBl/Ox/4jdJNK3IC2UaM6Wx5bnQIve2HxygGUw9dRgQqg4EMP7Qz0F+ar+ypRhbEY37YheUQNIe2RybVQNKUTz9o5TkL58Pb7OdLlxDjME+BAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lcrcomputer.com; spf=pass smtp.mailfrom=lcrcomputer.com; dkim=pass (1024-bit key) header.d=lcrcomputer.com header.i=@lcrcomputer.com header.b=EZVvPW4o; arc=none smtp.client-ip=74.208.17.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lcrcomputer.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lcrcomputer.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lcrcomputer.com header.i=@lcrcomputer.com header.b="EZVvPW4o"
X-Default-Received-SPF: pass (skip=loggedin (res=PASS)) x-ip-name=73.22.239.67; envelope-from=<lyle@lcrcomputer.com>;
Received: from mail3.lcrcomputer.net (unverified [73.22.239.67]) 
	by mail2.lcrcomputer.net (SurgeMail 7.8m) with ESMTP (TLS) id 116084-1224446 
	for <netfilter@vger.kernel.org>; Thu, 30 Jul 2026 15:16:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lcrcomputer.com;
	s=default; t=1785424586;
	bh=bIkL3j1SUti+mxRknWXsGzjEHfZ++LfAOrCAj6OvBfk=;
	h=Date:To:From:Subject;
	b=EZVvPW4o9rkbwhgpSKUaRWh5LYubftU3wNd6kbRGwaG/3Gp0TGuLqO8hT0qHogDYu
	 aU6Y6jhHm2UmSIP3vWk/w4S4MLl9DAPtW4T9U+hgI6qiWY8nx7hBd0fgDsMMF74CDd
	 F+a0rqPUNKFTr38r6pu3tYiefiTIvAjExsyq80GA=
X-Default-Received-SPF: pass (skip=forwardok (res=PASS)) x-ip-name=192.168.250.160; envelope-from=<lyle@lcrcomputer.com>;
Received: from [192.168.250.160] (unverified [192.168.250.160]) 
	by mail3.lcrcomputer.net (SurgeMail 8.0o) with ESMTP (TLS) id 1386569-1794114 
	for <netfilter@vger.kernel.org>; Thu, 30 Jul 2026 10:16:25 -0500
Message-ID: <8975796a-5319-423c-bc9c-f146c50bd389@lcrcomputer.com>
Date: Thu, 30 Jul 2026 10:16:25 -0500
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: netfilter@vger.kernel.org
From: Lyle Giese <lyle@lcrcomputer.com>
Subject: subscribe
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-X-Qnum: 1386569
X-X-Authenticated-User: lyle@lcrcomputer.com 
X-Qnum: 116084
X-Authenticated-User: auth_admin@mail2.lcrcomputer.net 

subscribe

