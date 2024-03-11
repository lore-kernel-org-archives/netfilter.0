Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 743AE5466E
	for <netfilter@vger.kernel.org>; Mon, 11 Mar 2024 18:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710183398; cv=none; b=RZrT/p/lsW9vkVDSd3ArbeDMeArLTziRdcXBp1c7fOfx57hf16ViSsXp3MgUUZKP0rWiDuDa5/Kyn3WjDJ/Dl+uchgjnpllI0ZG5929TBsQ1MJFwkMTWGXVt5ReKCvIS70clm356dpwt05JKRFOk/G9gubLJWZthJmLCeYSA+4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710183398; c=relaxed/simple;
	bh=SAlM4ZH2rOx4JNT4eCYjWPRwlI3TeLcFKxYlMwkJiVw=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=BRrGjw8vnJcPJBlvKriD1hS0jctNDT0qX/F4invXO+0S2A2VSUy8dHJPkPgSFYKYP1BsUznMKrv5NgK0GCSjJQCDvLzoKln9jG7idtREFpMauZAqXfizhmMKkjELOrSyo+o8HrWzDRoaa6Goscsx4AuEqi7vBi2yUxQQ/XIjI20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OJ7HVfT3; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OJ7HVfT3"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5684f95cc9bso2779501a12.1
        for <netfilter@vger.kernel.org>; Mon, 11 Mar 2024 11:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710183395; x=1710788195; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SAlM4ZH2rOx4JNT4eCYjWPRwlI3TeLcFKxYlMwkJiVw=;
        b=OJ7HVfT3Czbsc4erztXGgcB1307CFhoS57/BIe+ICrbH+eZ5K9OzI2kfJg4XSMS95H
         6bB7SO7i5bATcQ4IxHyuRpjb0Lbr2skX1pbL8ingEQsGvVZPnrBMEOHHyRabV/YnaVHW
         dUzx+WyvFt+DR82GL7OS4Ehb45299Op1tSQfFymEupB5eQMcC+Wj+s8AmirnqfR1zv97
         0U0JeX5Bp4PtNcXZHP48Ao4K+lHlAZAvK2D80xpXTbIHYat5xwWPWneYhN6wUo38Xir2
         WnLaZmzPxzAf+goStNQ1IHwHmLgcym+/9udZvB6IUghm/1etC6dQ0NTj3Xtp6VkrQLAp
         RWSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710183395; x=1710788195;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SAlM4ZH2rOx4JNT4eCYjWPRwlI3TeLcFKxYlMwkJiVw=;
        b=p7243CX7E82SK3TytJpPvXJtpCgyaml7Yl0zaeAKCPOrTfP3rbqi9NEb+umcPVSaf0
         GuOP5pi0BABEsJfxs0oo/jK8SZj3RnaH0uXSTM9sjJu0eoih2diqI4JUx577Ht3m8LCp
         N8fgskCgjkS7V9KIAAft9kNVEjBi9xsIOH2cCLZlCZkkd4Oomgi+0UlPFnR/sRXy4uJM
         bcZRrm6Z8TEKMtPfTDZ4EpnIZ8+l2jMzQU1eWcXDcma27TAusg4A2KrKs51GHYfU8oh1
         /YNgVmiyRRSV9pLffmjRXVgIDyqodak3SHq0IM5L46AskbFAa1T/ClgeFzunSpcS0Lsu
         euWg==
X-Gm-Message-State: AOJu0YxiSaCpGNbqKFfW4RtY9OqlgoK+dOAMc3Zc3byJGarYtPEJhXXz
	IvdHzlpBkxdpd5SVvxQ4f593aWjApFfIEBO7XBvUh4wFBZnE/Jqr4d9aZACSyMrFs8pJUPPaBKp
	Gu8e1qMoimcDzZti/BwkVnNem0ZXodEA1nWk=
X-Google-Smtp-Source: AGHT+IEnM7tIOgY3mIGbPZqdAvdTM12wVTGrXps1ZV60MS6FaOPfQE3Nz9KiP2osypzARl13BfTT8/LbTcKMIq7+JBA=
X-Received: by 2002:a50:8ad9:0:b0:566:1952:afc4 with SMTP id
 k25-20020a508ad9000000b005661952afc4mr8494223edk.6.1710183394756; Mon, 11 Mar
 2024 11:56:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Tim Lewis <elatllat@gmail.com>
Date: Mon, 11 Mar 2024 14:56:23 -0400
Message-ID: <CA+3zgmt6ZK+VR5iAb5GKV+vgu5eeDHBFUb=9p+_-kQUziVawfw@mail.gmail.com>
Subject: SNI filtering
To: netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

May we have an example of Server Name Indication (SNI) filtering on
the nftables wiki? When using an environment without the variable
position support of iptables string match, an example, maybe using
eBPF, for SNI filtering with nftables would be helpful.
