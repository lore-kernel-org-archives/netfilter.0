Received: from mail.pahlevanzadeh.org (ip44.ip-54-37-192.eu [54.37.192.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04186213E67
	for <netfilter@vger.kernel.org>; Tue, 29 Apr 2025 18:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.37.192.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745952036; cv=none; b=lqOzad3MxqnxhDO1rWEXl+aCIKyTHAf1BUTUsSWYj7O7ai9pXNcfY2+/4odCa4QaydWqHwQtPoBFBf6IqrjLtgVWkobC5rfy0fwQOErgRtmFpavKkb5/AMzPiqLSguOtfqRkylI/ugcGReDbXvzgUSa82lGOoWExWXyLmstzX4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745952036; c=relaxed/simple;
	bh=IGaFD2QmkXP9nwy77+Hvvpr9aIkNhSiWnRs9Xx0Rnts=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=k+T55Iclk66fGwGunhYI7tQkCwUr1c3CgMC6FMktvGguAh3qHliY7G7FtiImzRC5msDpvOLDLf3jhXLxOe2Pwed4DLgEEUfm1IQmtn2G5kg2fnZZFm5XSps1QUbIKPRNLIWNtnUwTPgF6ZPmISL7IIrP/6zIt9G9VeVP97x+bHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pahlevanzadeh.net; spf=pass smtp.mailfrom=pahlevanzadeh.net; dkim=fail (0-bit key) header.d=pahlevanzadeh.net header.i=@pahlevanzadeh.net header.b=kOGVULFK reason="key not found in DNS"; arc=none smtp.client-ip=54.37.192.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pahlevanzadeh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pahlevanzadeh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=pahlevanzadeh.net header.i=@pahlevanzadeh.net header.b="kOGVULFK"
Received: from [192.168.1.102] (unknown [94.182.74.46])
	by mail.pahlevanzadeh.org (Postfix) with ESMTPSA id CA41E3BB3
	for <netfilter@vger.kernel.org>; Tue, 29 Apr 2025 04:49:59 +0330 (+0330)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=pahlevanzadeh.net;
	s=iss; t=1745889600;
	bh=IGaFD2QmkXP9nwy77+Hvvpr9aIkNhSiWnRs9Xx0Rnts=;
	h=Date:To:From:Subject;
	b=kOGVULFKJsvPDXoiE3+t0lY/S7TvmXi0lFcTiSvxaavGJHyIcsvWZyijTQ4WPJePN
	 F/GmM5dycqR/s6m0TyCpAmpw+nj7nKqWvYnDJsw6nDtIEPsuPLHfnqgY4leJvdqa45
	 dn+gZPpm/tkIKypCbLVGTfagspjAkMAJP313RqiQ=
Message-ID: <0f1f9636-ad4f-410c-ae4b-b628552dc98b@pahlevanzadeh.net>
Date: Tue, 29 Apr 2025 22:10:30 +0330
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: netfilter@vger.kernel.org
Content-Language: en-US
From: Mohsen Pahlevanzadeh <mohsen@pahlevanzadeh.net>
Subject: send all traffic to a specific address
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Dear all,

I have a linux-box and run a program to send my traffic to another PC.

Now I have 127.0.0.1:8080

I want to send all of my traffic to this socket. I don't want to send 
even one packet without touch 127.0.0.1:8080 Then 127.0.0.1:8080 send my 
traffic to eth0.


How can I implement this scenario?


Yours,

Mohsen

