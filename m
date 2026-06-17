Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D2EE23D283
	for <netfilter@vger.kernel.org>; Wed, 17 Jun 2026 01:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781660074; cv=none; b=vDwv/rpmufNZigI68WSUrpNg1zqMoIFq3l5GJXl9siKUiAfxLYhYFcxuBITI6kVGZxXxOldKr3DGNIFIg/ljTc+eADyfQ4GrziOCmy0GpEob8gF8JyLzMePi07s3DSnbMaO0V3hhJfDQbV1oQBkaIs2MJm0lhZHXG+LYopHGHGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781660074; c=relaxed/simple;
	bh=ONxDV3H6Ui+3TGe88vM+zcpoxa3ItP6s1EMxTS7Udho=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=Rse5SY5I6jjYcJMzdIYyj5WSlvmsGxKJex7nEoE7eLxCCIddJiioU+CMqnfVhaUP8ktqHCeg+SWi4+nlBKml5laynoikQX6eOlZc9WT9bjEMtzSI4Qd+IFxVk4QFXdzvaIT0HTU0ynNqygz6bzPuSPbZN7xTLSuqqxpOWZ9g96w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bne2gCMg; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bne2gCMg"
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-4877b2c9e9fso1425772b6e.0
        for <netfilter@vger.kernel.org>; Tue, 16 Jun 2026 18:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781660072; x=1782264872; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:content-language:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B8t9abydGWpQKYiXn7ipObax1HXtmRLTpr+s1REdhvM=;
        b=bne2gCMgyWDWVY8KzKrWDgNYwYnmzGph/Dkc/r9qEEiL+2f1K6NKEFt/LEAN4rNvQH
         QjVTKV+4Yi3+nMyHIYKGROkScuPd4W8+um8tr2rUlkbz8xNP8K81hFV09Mw6y1BYcgHh
         EkPOAdQ2MusPeyaM5k/nmVaEf2Itx2H5DV0aQ9qeqs8YCNO3dn6/mNAl2MLGT7I3rqkj
         XUkulUxQ+OiU45mkK0Zgk78zGRSp+RotY/64H9WaZd1rqzx8N+YQAtj7WIe0XCPiVCHR
         5fOQwtRZ5Mkeubjy1U/FEnbKFxZ39p4Emy+RxaaNF4sDnIPnBpDVwIYMRCRyLI4izaSA
         Mgog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781660072; x=1782264872;
        h=content-transfer-encoding:subject:from:content-language:to
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B8t9abydGWpQKYiXn7ipObax1HXtmRLTpr+s1REdhvM=;
        b=O12IXFBZx/b75RqkWSgw5CiiF3YDUPzcDV5MWxc98OE90UeB9sb2eWamCaiGtp44rM
         V7BnvayCi0+izhDqMWeDTGoLhoHzEGNJIzej13tMZ2eVgKxbsa4/Yis7HtldMZOu3ZGE
         4PE8FMvgRVSnLm7IE9npqI8UyPcP5D/WxqMavjWwHDAz5+GcdPkCAasQEAe+p92BpWdN
         yPawCtOHcC1QvslpqT6MoJquH3DIcONgEjYqtBGv2KcspSxm5MpZWo3EtItBWWFhxOrE
         H2pE44ch11o5fdU1b6xJLuRHRUbS+c6kLY6JhmQY0dAQjeX8gBKvTSEDt9GHHv6zdxJI
         XWqQ==
X-Gm-Message-State: AOJu0YzO1mHx9OlZ4tZFP1A++npHhMV8eagck3y2dYXca82WlatoyUqT
	zVg1X8/1jjPVz1CR10Vh83WkfHFJV2kulvpJPQzPStLiNzylknpTML6wZ7FrCrpCcdaw+Q==
X-Gm-Gg: Acq92OGuVZmHUSR/Oq1Jfnu4IH+Pz8B5FFupUs6Vx7GHWchwaCZaUxv6uOYbwkdrpZQ
	0BtSclCBwmiSxnKPe+dyByw8nRx/m3aB9q0sY+olSQa/FFL4Q28B5qyMJlrN9wXKbjEaRNKrZSu
	LCf78FYUtjFvVmJXnxVxOwpgozoNHqwZzkmYZWcdvTNfUQx+EJmb2CJKEIctYa0OZVRyOHW8gm6
	nT2QEGsjAwmwhFPmB4d2+P6VEn/okWzD0dk5/aF/8NkcXqFPcwkssDZhrH4hMJRI9Ipvipm1W6s
	6L0WEa9plpMHTFxHil7WiMXSHwZi2SGhJfaSdl5OP2eY5g8rsajB+Za5/GwaKAK2SIf5OnKOPcS
	iEmisffC7w0Twoouepzzu7wimTcL1C8CtDvDsNzLzJUH+JHjO5cni2iWF4jqIYcs894+EoY+GX3
	QRWhkSmThCLEFUb8aCcaVIjyfP9RMDmvhrONRRPGxgTCE=
X-Received: by 2002:a05:6808:1813:b0:479:d779:353e with SMTP id 5614622812f47-489429ab613mr1857147b6e.24.1781660072158;
        Tue, 16 Jun 2026 18:34:32 -0700 (PDT)
Received: from [192.168.68.54] ([99.43.137.6])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4875dfe4a89sm5627498b6e.18.2026.06.16.18.34.30
        for <netfilter@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 18:34:31 -0700 (PDT)
Message-ID: <8400bf65-82b4-495a-a5ef-4ad7a1fafb08@gmail.com>
Date: Tue, 16 Jun 2026 20:34:30 -0500
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: netfilter@vger.kernel.org
Content-Language: en-US
From: Corwyn Briggs <corwynbriggs@gmail.com>
Subject: No meta ibrindex/obrindex, only meta ibrname/obrname
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



Hello!
I am somewhat new to Linux and am configuring a custom firewall for the 
first time. I have come across a discrepancy wherein the index of an 
interface on a bridge (i.e. a veth bonded to the bridge) cannot be used 
to match in an inet chain, but the name can be used via meta 
ibrname/obrname. I would like to use the index since it is a bit faster 
and my interfaces should not be dynamic, but meta ibrindex/obrindex does 
not exist in any manpages I have read. I checked over the archive as 
best I could and did not see any discussion about the feature either. Is 
this an intentional difference or rather just something which was never 
implemented?
I wish I could offer a fix, but I haven't the faintest idea how a person 
would go about implementing one, so I appreciate any advice on this issue.
Thank you all!
