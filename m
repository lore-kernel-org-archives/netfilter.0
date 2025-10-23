Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C8C2320CC0
	for <netfilter@vger.kernel.org>; Thu, 23 Oct 2025 14:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761228070; cv=none; b=GjQ4+DVz4vo75vMLbEaPMYiq7AlupdTDdYv5GFuosYLQDnmtJuyRprCAmtjddUpqTUGWMz7hiE/sm32pWRMn0y81Ib3XoI9VJWMhZ04lrdvYO532G9Uu4BVyaUtJ3/PstZZqC69ft5I+e1EJ8jQYJCGprXq2mo1E2WMRRgi5MRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761228070; c=relaxed/simple;
	bh=qcQ0N9WOmo8cRYfausJdGnaPkhS8cnNOY1GzFndO+3s=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=eJ0qV0LgJrz1olNlxjyDzpIX6N3rrwS14ZsusLie4ufTunDIYP4z0tO97E476mvSFXlX0K1/iuYJMd3Vu0hKBgHY6vet7OO0F7roztnBHL+8RxAcKhfn5dYOfjsFO6jcXD6OoM7wm4uoVeDw87FmBwLKGtRBfAgh+NSJrVjrubA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=yF98rY4M; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=21cD0eUH; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=iIoGhK6o; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=LF1e2aZM; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="yF98rY4M";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="21cD0eUH";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="iIoGhK6o";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LF1e2aZM"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 65F502120C;
	Thu, 23 Oct 2025 14:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1761228062; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y0TcEauEn84Q3VXWh7tH+rJ4kKDdczN/AEcexOHFMG0=;
	b=yF98rY4MnXL15YDX2cd6cDYD2VJiFFOXzbxe30r7+OjD5u6GhxL+7rZsw6+bZzu5GGeu59
	sVPIrmnIH2cbAy95JWBJackZw8yE/43eZzvWlmK45FTVx++/QsFF7PV/Qsa+E3GA4yxXYU
	ylHsWGaWqczka4+uEgAlDE0pczr4aPY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1761228062;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y0TcEauEn84Q3VXWh7tH+rJ4kKDdczN/AEcexOHFMG0=;
	b=21cD0eUHOkxU1Q8AV3bZE9xA5alIMQFi4F5FdCBgKWsNKoJuT//LfVBvrmHVRFn4YV00xF
	iIOG3BlHf8AnMjDQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1761228058; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y0TcEauEn84Q3VXWh7tH+rJ4kKDdczN/AEcexOHFMG0=;
	b=iIoGhK6o/uEo7w1mGfve4LlxpCYTxo5o7rjXSlaDmGro26kGDLOEPM3mvMD0inxS954Nc7
	4e0vQIF99BPlCXz3H2EQp7mZju9ihmKMdJo5wB2le9+kF0uAoXkhJos9L95jfbJ7nnxAwc
	H2zyw/rhEWBeHDET/iv9mwALwTO9miM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1761228058;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y0TcEauEn84Q3VXWh7tH+rJ4kKDdczN/AEcexOHFMG0=;
	b=LF1e2aZMHh6a7gpn9rNASCi1XD8Qxs9ahJRMxy1tkQnbvXbki5xYOJoHSI3tbG5cwiWaW3
	k2il1qNLWZwOVtCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3C1C1136CF;
	Thu, 23 Oct 2025 14:00:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id LTysCxo1+mj6SQAAD6G6ig
	(envelope-from <fmancera@suse.de>); Thu, 23 Oct 2025 14:00:58 +0000
Message-ID: <055140b7-e2c2-41ed-a8ec-4e8e074d37f9@suse.de>
Date: Thu, 23 Oct 2025 16:00:51 +0200
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Nftables ct count over 2 counter continues to trigger with only 1
 connection
To: louis.t42@caramail.com, netfilter@vger.kernel.org
References: <trinity-85c72a88-d762-46c3-be97-36f10e5d9796-1761173693813@3c-app-mailcom-bs12>
Content-Language: en-US
From: Fernando Fernandez Mancera <fmancera@suse.de>
In-Reply-To: <trinity-85c72a88-d762-46c3-be97-36f10e5d9796-1761173693813@3c-app-mailcom-bs12>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_TWO(0.00)[2];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_TO(0.00)[caramail.com,vger.kernel.org];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[caramail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,caramail.com:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -4.30
X-Spam-Level: 



On 10/23/25 12:54 AM, louis.t42@caramail.com wrote:
> Hello,
> 
> I have read the documentation and asked on Stack Exchange but am unable to find an answer to the following behavior.
> 
> Given this table and chain where 123.123.123.123 is my own address:
> 
> table ip mytable {
>          chain mychain {
>                  type filter hook input priority filter; policy accept;
>                  ip saddr != 123.123.123.123 drop
>                  ip saddr 123.123.123.123 ct count over 2 counter
>          }
> }
> 
> I am establishing a varying number of TCP connections from my own address by connecting via SSH. These show up in "ss -at" and "conntrack -L" as well as disappear once disconnected - all as expected.
> 
> With 2 connections open I see "packets 0 bytes 0" on the counter. With 3 connections open I see "packets 6599 bytes 475441".
> 
> The question: when disconnecting 2 of the connections (from 3 total back to 1 total) the counter continues to increment. It triggers even when "ss -at" and "conntrack -L" show just one connection with no TIME_WAIT or other entries.
> 
> It even continues incrementing after a "conntrack -F" and often feels as though it is a one-way switch once the counter has triggered. Sometimes closing all connections (to 0 total) stops the counter from incrementing.
> 
> Is there an explanation as to this "ct count" behavior in more detail?
> 
> Thanks.

Yes, this seems buggy. I have reproduced this with upstream kernel and 
also on 5.10 so I guess this has been here for a long time. I am working 
now on a patch.

Thanks!
