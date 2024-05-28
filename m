Received: from cam.del.bg (cam.del.bg [193.254.29.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D88F16ABEA
	for <netfilter@vger.kernel.org>; Tue, 28 May 2024 11:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.254.29.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716896975; cv=none; b=DqdEWtspLjDvx3C1gGQCG7YFMP5X/Ss4YjYIpDcWWxIzf/nAlRGL9+BQJJitZRFOFpbNt6KWMXdYnUTyBwTJRUSbmj7aZMcULC5qEmD0zvxfg5/1rCK729Q461EJgbeIyjseH8GN7Xna98lUGp/PHFajsTKpN77ZiDrzbEz1xds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716896975; c=relaxed/simple;
	bh=Adm71UTtpCGOCQFKiL9R58u0gPudu9daJMCtV4ZmE0U=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=XAJbXHspY0wOxy/H85/yiIK1VmoTxRioeP7u9SrzZiRok4ktVWowt1p5Hog/D2EGC8Toyqaxg52kurwI8Cg9Jgy1WKN3DZAXhb5GGsMbZgTeA9KruD44htj2TeuNwgf5x146CKtE7v8bP5XoCctsdQDDRPR/b1CLcZ0DcgL8ku4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=del.bg; spf=pass smtp.mailfrom=del.bg; dkim=pass (2048-bit key) header.d=del.bg header.i=@del.bg header.b=dNI4UC+v; arc=none smtp.client-ip=193.254.29.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=del.bg
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=del.bg
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=del.bg header.i=@del.bg header.b="dNI4UC+v"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=del.bg;
	s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=rGjM2RUoQFiHAfpM8OnFJo2pFqqfpYAGhfZlvbdttMk=; b=dNI4UC+v6jbN3m6FSBu3tkrRsW
	oAiER7JPY8rARA6u1uHVEcLHqiQ+/WF6HvvgPyg2/2z690twxP4QJJ8Bbur6+0WlSQLlCen8YEZRw
	85dritZF6u6evJQE3xRv4gkAPt+8sdWNu7F+0yiqCalN3LZNfi37OVOFs85H2Ew/OQXyDws6AnEAI
	0fvYnCqodVys8Ef4aMQXFSkWsEJskql33LVaJdZoceHyuUR5L0SoDEyDqVM4YGeSr6l3o5cwT1ZLw
	RRb8JpRb2wdxTgQHvgknzh1ETQkOIQuht20h0VIt/EteMLNzOZ09xZdfqQa7TWsJSQRtTzRQPqPPL
	/S+Lnjxg==;
Received: from mail.del.bg ([193.254.29.12]:52512)
	by cam.del.bg with esmtp (Exim 4.89)
	(envelope-from <tm@del.bg>)
	id 1sBvKd-0003Kf-Em
	for netfilter@vger.kernel.org; Tue, 28 May 2024 14:49:31 +0300
Received: (qmail 25559 invoked from network); 28 May 2024 11:49:31 -0000
Received: from unknown (HELO ?192.168.168.21?) (tm@del.bg@185.58.21.156)
  by mail.del.bg with DES-CBC3-SHA encrypted SMTP; 28 May 2024 11:49:31 -0000
Message-ID: <371a8e68-4a89-41e3-880a-14e0a6371fdc@del.bg>
Date: Tue, 28 May 2024 14:49:30 +0300
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: nft not logging some layer 2 frames?
To: netfilter@vger.kernel.org
References: <20240524155729.4fd15210@localhost>
 <70c9f5d0-b6be-4ab2-b154-d9d334ebb19d@del.bg>
 <20240527171718.7db995bf@localhost>
Content-Language: en-US
From: Teodor Milkov <tm@del.bg>
In-Reply-To: <20240527171718.7db995bf@localhost>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 27.05.24 г. 20:17 ч., William N. wrote:
> On Mon, 27 May 2024 13:17:50 +0300 Teodor Milkov wrote:
>
>> I just tried putting log before counter and still nothing showing in
>> logs. But does order really matter?
> Perhaps not. I just thought it might be worth trying.
> What happens if you remove the counter and use only log?
>
> I tried this:
>
> table netdev xxx {
>          chain ingress {
>                  type filter hook ingress device "eth0" priority -600
>
>                  counter
>                  log prefix "TEST: "
>                  drop
>          }
> }
>
> and I ran 'arp' on the other end of the eth0 link. I can see logging
> works, i.e. without specifying any particular protocol whatsoever.
> Counter works too.
>
Yes, as stated in my original message:

"From a brief review of the source code, it appears that nftables might 
only log frames of certain known types like e.g. ipv4, ipv6 and arp."

So, if you have a way to test with some other type like STP, LLDP, CDP 
or similar, maybe you'll be able to reproduce the issue.

