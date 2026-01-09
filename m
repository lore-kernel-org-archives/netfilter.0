Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 237222D8760
	for <netfilter@vger.kernel.org>; Fri,  9 Jan 2026 10:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767956244; cv=none; b=SBIFx5tgcHkruu57/NK7TUDrMPQyGx6Evx6pstEKk54/7qsY1V5CEXlbpW83OuQCSghOAuee1WXUvDzdAnfQ+oX70MNA28YbP/0jPRnlRY7ka0yyNncfRwuXdFHPrsBs5M/bdQHK5bSqts9pG3rYGAW0h9PXJOAA+pqZqqeYwU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767956244; c=relaxed/simple;
	bh=VuVYhTDdPzyjZ9JJjdmyTbUcyDFXxx/jscnas+EXCe0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qZFKahW3mpFx5gDqA1xpMx16lFN2NDwr0z+Ae4f+tmsAeyCUyACqjJL+6Af2DL1O3ziOKHwuSHUULexCr4AvJF3zLOs4Ifla/ppqjBK8R6Fs7lAxaLTlZ4J1ToJdDCrpzuxKyhyLhcJXtuRYucAVbPJSwz+qiPTKuWspElQeLvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fEGyQGx0; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Iwd3SW6r; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=KCGHa0kq; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+UvgC1TG; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fEGyQGx0";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Iwd3SW6r";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="KCGHa0kq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+UvgC1TG"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7E98B336B9;
	Fri,  9 Jan 2026 10:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1767956241; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9QlSLHQBE1EfZq11GmTcA+WN9hQOshUg0WYsGZyEcy4=;
	b=fEGyQGx0UGrmZM52vvIraamlcB0kLof4fE9q43rUwwCYo4+JlJ7JGQaymgdZffwyTRk6hl
	/bIsOqAXL7cdZ6Un9mkbxe9Mc1Z+XEx8sxHxB4TCFVnbFbSPXmzVcSYNWU106IrO9Q6OdA
	WxY+Zishzz58bq5qoLFR9mBa+tTw5ag=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1767956241;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9QlSLHQBE1EfZq11GmTcA+WN9hQOshUg0WYsGZyEcy4=;
	b=Iwd3SW6rTknmi6e2eVufaIkBW2nHbsjzYmENCSzQyz372VF8GpA7SgfzJr6Z2F8f0Os/q4
	h1Ub5v7nIjLehqDA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=KCGHa0kq;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=+UvgC1TG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1767956239; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9QlSLHQBE1EfZq11GmTcA+WN9hQOshUg0WYsGZyEcy4=;
	b=KCGHa0kq4tes604luznmuU1DWojmJrqayGafk2kjlBja3WrIPlyPDpBvq22Q7MrRm6Twal
	D00lBn0XChKfOu4ztmEaXTbnD2S+DOQZGMLARp3Oa9v6pM/+slmBMKVXtx+JzUfKF4SnMf
	da33WwWOii9fzW6YsiePsBDNJNLemJo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1767956239;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9QlSLHQBE1EfZq11GmTcA+WN9hQOshUg0WYsGZyEcy4=;
	b=+UvgC1TGdAWgeCd4AnP8GWvBuSwr605cCKJm9FrL4Q11b8mQFtD9Laztz0vJjERhP+WiCg
	+VxrXbfj8Po9/TAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1D9D33EA63;
	Fri,  9 Jan 2026 10:57:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id +G4dBA/fYGlXWgAAD6G6ig
	(envelope-from <fmancera@suse.de>); Fri, 09 Jan 2026 10:57:19 +0000
Message-ID: <c1d5ea6d-b1fa-4218-9ace-81738c82e31f@suse.de>
Date: Fri, 9 Jan 2026 11:57:18 +0100
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] connlimit breaks localhost connections since 6.17.13
To: Florian Westphal <fw@strlen.de>,
 Michal Slabihoudek <michal.slabihoudek@gooddata.com>
Cc: netfilter@vger.kernel.org,
 Jaroslav Pulchart <jaroslav.pulchart@gooddata.com>,
 Tomas Klouda <tomas.klouda@gooddata.com>
References: <6989BD9F-8C24-4397-9AD7-4613B28BF0DB@gooddata.com>
 <aV_mILsZWZQg0SbW@strlen.de>
Content-Language: en-US
From: Fernando Fernandez Mancera <fmancera@suse.de>
In-Reply-To: <aV_mILsZWZQg0SbW@strlen.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Score: -4.51
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,gooddata.com:email,suse.de:dkim,suse.de:mid];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid]
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 7E98B336B9
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

Hi Michal,

On 1/8/26 6:15 PM, Florian Westphal wrote:
> Michal Slabihoudek <michal.slabihoudek@gooddata.com> wrote:
> 
> [ CC Fernando ]
> 
>> This happens specifically when connecting from localhost to a non-localhost
>> IP address (i.e. not in 127.0.0.0/8). The first connection succeeds, but
>> subsequent connections immediately time out.
>>   Removing the iptables rule with the connlimit match fully resolves the issue.
>>
>>   Expected behavior:
>> • connlimit should only match and log packets
>> • connection handling should remain unaffected when using -j LOG
>>
>>   Actual behavior:
>> • connections are silently dropped
>> • client experiences TCP connection timeout
> 
> We have very little test cases or real world examples, especially
> for iptables.  Hence constant breakage is expected.
> 
> Fernando, can you please have a look?
> 
>>   iptables rule used (for custom logging only):
>>   ```
>> iptables -I INPUT -p tcp --dport 443 \
>>    --tcp-flags FIN,SYN,RST,ACK SYN \
>>    -m connlimit --connlimit-above 500 \
>>    --connlimit-mask 32 --connlimit-saddr \
>>    -j LOG --log-prefix "IPT-443: "
>>   ```
>>
>> iptables ruleset:
>>   ```
>> Chain INPUT (policy ACCEPT)
>> num  pkts bytes target prot opt in out source      destination
>> 1      0     0 LOG    tcp  --  *  *   0.0.0.0/0   0.0.0.0/0
>>         tcp dpt:443 flags:0x17/0x02 #conn src/32 > 500
>>         LOG flags 0 level 4 prefix "IPT-443: "
>>   ```
>>
>> Test case:
>>   First connection from localhost to instance IP (X.X.X.X):
>>   ```
>> curl -I -L -k -m 3 https://X.X.X.X
>> -> HTTP/2 200 OK
>>   ```
>> Immediate second connection:
>>   ```
>> curl -I -L -k -m 3 https://X.X.X.X
>> -> curl: (28) Connection timed out after 3001 milliseconds
>>   ```
>>
>> Without the iptables rule applied, repeated connections succeed without
>> any issue.
>>   Notes:
>> • This looks like a regression introduced in 6.17.13
>> • The behavior resembles an implicit drop, despite using LOG only
>> • Regression might be introduced by https://github.com/torvalds/linux/commit/69894e5b4c5e28cda5f32af33d4a92b7a4b93b0e
>>
>>   Please let me know if further debugging data (conntrack state, traces,or kernel logs) would be helpful.
>>

Thank you for this report, I am trying to reproduce it. If I am able to 
reproduce it I will provide a fix ASAP.

>> Best regards.

