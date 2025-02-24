Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DA041632D3
	for <netfilter@vger.kernel.org>; Mon, 24 Feb 2025 16:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740414746; cv=none; b=hzhknjZgwt2sguse9dl37pooGerW/Zh4jqvqJEnkit1SUGEWMKglwtQa5ZYw0FeSun7GXn9I/61LGizEYt3pkDfYLA+K5FTze9O8646Qf7kunmRPcMH+uy8dxtHwt8csTm8AAfq9S5DE+JhEPeQFpAniMezO8L2bzd0zwyy/I6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740414746; c=relaxed/simple;
	bh=g5ilM35rn5hzPydv9uzkzMw6HArxrSeQxmaeNSwRF38=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=joujgOuHUbRKNiaoiTxf/fVT3UBEGt7YqS8ugSDDVASCWDfZcaAiLmZeonZy1hukgADOLlOR7eXUR5rcfKoTIfv+ULvoxgA6vpvKo5ZxoVCQirdxGXWiw4KvUuq5i5yT4REccdD/rfpbiXdcnrwjqxK5eK/2ii2IdnoN1gJyPQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FlItJmlB; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FlItJmlB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740414744;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Whk17sOxn2Xe4kiQQzC1o0c0aQ+DyO6pP2sOM7fQCLw=;
	b=FlItJmlBOAS8uBtD5N+/L1PJgkE4pG1icdr0tBuyhlgJSAnW9l8PwL6Q3phPd6GWtyLyHZ
	JoWutHBEli4Or8NmFZy/BA2l6qPCXq8lcrk7B+Um3BiwtCAzFZTINdHQMqKn1IazfgQaUf
	TBYJHQA2+uJafbQ9kaTNwKB2DbMd9b0=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-493-s2Ec15G1NO--HvrBLZ3PtQ-1; Mon, 24 Feb 2025 11:32:22 -0500
X-MC-Unique: s2Ec15G1NO--HvrBLZ3PtQ-1
X-Mimecast-MFC-AGG-ID: s2Ec15G1NO--HvrBLZ3PtQ_1740414742
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6e65a5ee5f0so103951206d6.1
        for <netfilter@vger.kernel.org>; Mon, 24 Feb 2025 08:32:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740414742; x=1741019542;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Whk17sOxn2Xe4kiQQzC1o0c0aQ+DyO6pP2sOM7fQCLw=;
        b=XWXQw48QpGxA3gg75FIitWMhWAPudsdRsHf3uGfzzNOVDdIyM3oWm/2MS/yTz1q1Lr
         lFsSkq7l7va0N8YidRGB8Kruk3vG58vd0pwM0SHoqKJNqp5cf0m56YWiSAW2INHwR6Mx
         fB8AGRO1SRvJyMqFAueF+Gtb59Sw3R+7yjSMfyU2sIvhWcmiSOYsNhxmdCUXKNk7B+kH
         pacWdTZP6OAP5kWquYYXsGX5KN8A4HRz6C1dZ5SWaY9dHHN961sSNehheZxUsVqHqmu/
         f1hH8XfLAibDMrPpcWZmxQ2PzhbQP1B4TRIRqEmgLXsPFRNnvIe6KoCS9cW2upb8sGor
         v3bw==
X-Forwarded-Encrypted: i=1; AJvYcCVg3EQsYTYZX+tkN21B9iv/TZTDN24res0DUa1n5Gm+PBXhLJ7EQVECCSBXVdm3U7rN4eAaQ8v1OjA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLG2V7JiwCSjSFf9u40DCCFBcisWbBfNCP+lbMX0BnGU7wlZRa
	lqz8pDdMKJUmvEwCeThqEtX9ysCtGJq9GOs3Bk+vcjfgyFo/YQM/RGqzTYmljjcGl6AoN7zqrzk
	VLjiufHrLVtwM4uyfHX5JKxDVo3gE2Oi7cYQwTZOfYE5b22EashjSU0NHxsSjfoH53w==
X-Gm-Gg: ASbGncvY79VRoNvxJ7RoRMYe/W8AuOnZAkwxOOSVNHECXvkVMd+xCAdlDut4jyQbcEn
	lTA23oDQpSSMT/VZjkrLcIWWCiG+p0HJDZvAQgQQCnQccv5Kg8xBpqemWUrZ7QwFbqn51Wk0vCq
	H/2i5cKC9xqiTosQiStv8B7NTJ3p5j1Q38YyPdWZaGQ93fqKaZSxOeYEu2D7uOCCgMjWPh5ZBfB
	yo3v/+ws8Rec3pvx3ghMMpqEeceR21U6Bq5GuSWWJ1CVDE//D2MzPdWEmAmOrt/JQfUKoAvxXjC
	903HfH/c0l0pD79b4dPg5aSkKOC4nFy31C0L3J4+z2o1KCOhLEAJ1KZRmP9o0vOBNQHymsmF
X-Received: by 2002:a05:6214:1303:b0:6e6:5b8e:7604 with SMTP id 6a1803df08f44-6e6ae7b149dmr206405646d6.12.1740414741965;
        Mon, 24 Feb 2025 08:32:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGOwEY6XDy6xg4/OGAynQz4X42HHvPLpUPmHgVBoETpO4ATZXUfHsbGMqaKFJq+WggDg6QgcA==
X-Received: by 2002:a05:6214:1303:b0:6e6:5b8e:7604 with SMTP id 6a1803df08f44-6e6ae7b149dmr206404006d6.12.1740414740566;
        Mon, 24 Feb 2025 08:32:20 -0800 (PST)
Received: from [192.168.0.158] (pool-96-231-239-120.washdc.fios.verizon.net. [96.231.239.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e65d779446sm134832916d6.1.2025.02.24.08.32.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Feb 2025 08:32:19 -0800 (PST)
Message-ID: <132daf73-668f-4321-8945-c809db2277f5@redhat.com>
Date: Mon, 24 Feb 2025 11:32:18 -0500
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: What is *supposed* to happen with automated nftables accept
 rules?
To: robinleepowell@gmail.com, netfilter@vger.kernel.org
References: <Z7ieg3BGT2gxXqP3@stodi.digitalkingdom.org>
From: Dan Winship <danwinship@redhat.com>
Content-Language: en-US
In-Reply-To: <Z7ieg3BGT2gxXqP3@stodi.digitalkingdom.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/21/25 10:40, robinleepowell@gmail.com wrote:
> So my question is, what *should* happen here?  As far as I can tell,
> there is absolutely nothing the libvirt tooling can do to override
> my reject.

The libvirt *tooling* can't do anything about it, but the libvirt
*documentation* can. Rather than changing your firewall rules without
telling you (!!!), libvirt should just document what network traffic
requirements it has, and let you update your firewall appropriately
yourself.

For example, [1] is the documentation from OpenShift explaining what
sort of node-to-node traffic needs to be allowed, so people creating
their own firewalls (via any technology) can avoid blocking critical
cluster traffic.

-- Dan

[1]
https://docs.openshift.com/container-platform/4.16/installing/install_config/configuring-firewall.html#network-flow-matrix_configuring-firewall

