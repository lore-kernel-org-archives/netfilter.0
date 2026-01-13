Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA4F82C026A
	for <netfilter@vger.kernel.org>; Tue, 13 Jan 2026 11:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768303193; cv=none; b=JXnUUje4RNM5g7+DGTLs3Q2/ieAYiStj1pk+HFUaI2+DyGV2x+ro/QtkB6mJoKwcZpPTRkuru2agbQ4E81gnlxnGoivU1H7zEX6UHhgFAGFuLcamNT2Y82YAkPdqlg2L5VpLZneWvoVxMB9ax8s7ekKnxNrQrD/XhG536e/jAIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768303193; c=relaxed/simple;
	bh=SuqQIewfK4yic+inIWcxnQp6C6HHJCEGlNrjLVX9f68=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=XbopZ/7Gu/bzzTHXfKCK5Ukfe2ZVuuhwv5c1EW4DJNGxeaM9QSdLf+4unWuXUcc6aicw0RH0sPwhcusTMuAiFO1tEFxlYuKW6VNt4gbH5P7msdwZqJwZKr5yF8XbcaeHSh++8x9Y27q+rv7nvx8yCB6uVGz0aar2ZFkT8KguvCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=wB52LVGS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=pWs5I3en; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=wB52LVGS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=pWs5I3en; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wB52LVGS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pWs5I3en";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wB52LVGS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pWs5I3en"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C8DC85BCE8;
	Tue, 13 Jan 2026 11:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1768303189; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nW8OJdPc/1/CZqdlVuO8N7RnHzN2Tk/INzYKjt27faQ=;
	b=wB52LVGSS2/SWJ5Aj7NWncnBAsWW5xIQOdiozmqxNzHuULlXslIbJ1bhXnmp8fFyg5mbVS
	5uJrgFknNbGFMgtuo4tMh5UF1q1jXQVWAtWbIuCT+xtwaeJJuzs7o30CkVEcb71q3miUhN
	k2Y5O7jCjvOBHPeX8/Vqb9ylRkCl1wA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1768303189;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nW8OJdPc/1/CZqdlVuO8N7RnHzN2Tk/INzYKjt27faQ=;
	b=pWs5I3enyU9GG2AMhP5p2Dz6E56KBBwYTBxOESP3wIFSI7QV2isTcUBpPdJjH+OvGpDraP
	ayYBmMC8hDuaktDA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1768303189; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nW8OJdPc/1/CZqdlVuO8N7RnHzN2Tk/INzYKjt27faQ=;
	b=wB52LVGSS2/SWJ5Aj7NWncnBAsWW5xIQOdiozmqxNzHuULlXslIbJ1bhXnmp8fFyg5mbVS
	5uJrgFknNbGFMgtuo4tMh5UF1q1jXQVWAtWbIuCT+xtwaeJJuzs7o30CkVEcb71q3miUhN
	k2Y5O7jCjvOBHPeX8/Vqb9ylRkCl1wA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1768303189;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nW8OJdPc/1/CZqdlVuO8N7RnHzN2Tk/INzYKjt27faQ=;
	b=pWs5I3enyU9GG2AMhP5p2Dz6E56KBBwYTBxOESP3wIFSI7QV2isTcUBpPdJjH+OvGpDraP
	ayYBmMC8hDuaktDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 803DD3EA63;
	Tue, 13 Jan 2026 11:19:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id jQ+nHFUqZmmEDwAAD6G6ig
	(envelope-from <fmancera@suse.de>); Tue, 13 Jan 2026 11:19:49 +0000
Message-ID: <d8f6979e-add3-42e0-8560-bf6febbfe252@suse.de>
Date: Tue, 13 Jan 2026 12:19:42 +0100
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] connlimit breaks localhost connections since 6.17.13
From: Fernando Fernandez Mancera <fmancera@suse.de>
To: Florian Westphal <fw@strlen.de>,
 Michal Slabihoudek <michal.slabihoudek@gooddata.com>
Cc: netfilter@vger.kernel.org,
 Jaroslav Pulchart <jaroslav.pulchart@gooddata.com>,
 Tomas Klouda <tomas.klouda@gooddata.com>
References: <6989BD9F-8C24-4397-9AD7-4613B28BF0DB@gooddata.com>
 <aV_mILsZWZQg0SbW@strlen.de> <c1d5ea6d-b1fa-4218-9ace-81738c82e31f@suse.de>
Content-Language: en-US
In-Reply-To: <c1d5ea6d-b1fa-4218-9ace-81738c82e31f@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -4.30
X-Spam-Level: 

On 1/9/26 11:57 AM, Fernando Fernandez Mancera wrote:
> Hi Michal,
> 
> On 1/8/26 6:15 PM, Florian Westphal wrote:
>> Michal Slabihoudek <michal.slabihoudek@gooddata.com> wrote:
>>
>> [ CC Fernando ]
>>
>>> This happens specifically when connecting from localhost to a non- 
>>> localhost
>>> IP address (i.e. not in 127.0.0.0/8). The first connection succeeds, but
>>> subsequent connections immediately time out.
>>>   Removing the iptables rule with the connlimit match fully resolves 
>>> the issue.
>>>
>>>   Expected behavior:
>>> • connlimit should only match and log packets
>>> • connection handling should remain unaffected when using -j LOG
>>>
>>>   Actual behavior:
>>> • connections are silently dropped
>>> • client experiences TCP connection timeout
>>
>> We have very little test cases or real world examples, especially
>> for iptables.  Hence constant breakage is expected.
>>
>> Fernando, can you please have a look?
>>
>>>   iptables rule used (for custom logging only):
>>>   ```
>>> iptables -I INPUT -p tcp --dport 443 \
>>>    --tcp-flags FIN,SYN,RST,ACK SYN \
>>>    -m connlimit --connlimit-above 500 \
>>>    --connlimit-mask 32 --connlimit-saddr \
>>>    -j LOG --log-prefix "IPT-443: "
>>>   ```
>>>
>>> iptables ruleset:
>>>   ```
>>> Chain INPUT (policy ACCEPT)
>>> num  pkts bytes target prot opt in out source      destination
>>> 1      0     0 LOG    tcp  --  *  *   0.0.0.0/0   0.0.0.0/0
>>>         tcp dpt:443 flags:0x17/0x02 #conn src/32 > 500
>>>         LOG flags 0 level 4 prefix "IPT-443: "
>>>   ```
>>>
>>> Test case:
>>>   First connection from localhost to instance IP (X.X.X.X):
>>>   ```
>>> curl -I -L -k -m 3 https://X.X.X.X
>>> -> HTTP/2 200 OK
>>>   ```
>>> Immediate second connection:
>>>   ```
>>> curl -I -L -k -m 3 https://X.X.X.X
>>> -> curl: (28) Connection timed out after 3001 milliseconds
>>>   ```
>>>
>>> Without the iptables rule applied, repeated connections succeed without
>>> any issue.
>>>   Notes:
>>> • This looks like a regression introduced in 6.17.13
>>> • The behavior resembles an implicit drop, despite using LOG only
>>> • Regression might be introduced by https://github.com/torvalds/ 
>>> linux/commit/69894e5b4c5e28cda5f32af33d4a92b7a4b93b0e
>>>
>>>   Please let me know if further debugging data (conntrack state, 
>>> traces,or kernel logs) would be helpful.
>>>
> 
> Thank you for this report, I am trying to reproduce it. If I am able to 
> reproduce it I will provide a fix ASAP.
> 

Hi again, I have been doing some work around this issue. I have been 
able to reproduce the problem. I am testing a small fix for it. In 
addition, I couldn't reproduce this with nftables so far.

I am also wondering, what is the purpose of matching flags FIN, RST? I 
believe SYN or ACK SYN alone would be more appropriated.

Thanks,
Fernando.

>>> Best regards.
> 

