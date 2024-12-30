Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D85C0195
	for <netfilter@vger.kernel.org>; Mon, 30 Dec 2024 15:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735572004; cv=none; b=ismMmti5Jpw3Y19/ObjKDaVAtaI8GFLn1rKWO5ZhqVjQNPhzUKYr5Ym+eWWJDtJ11Km0tDvRHSsroa7K7H8KAHMIncGT7oNZouJabpNff/Ea/jUjNtIJHptFXzlSuQRMcntm77bJrNIx54rZghswXAdMuSmiBzPfi3fH7IZ/Hmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735572004; c=relaxed/simple;
	bh=Ur0/+kMqAJeOhefj/fOb0BaIj1ZO5u6sEpgeN1rQlic=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HJLRNDruILfIqbxfdGaKGEsOmWwTSbYEVxV3lJ4pWSsIKPnh/7kV6/6EcmynAQvXb9aChoOpYDN8ApH3+wYGtYcZ7QenLbXbMbU7KKBqQO2+MzBuZkqyF4yz/nZ4+MM204CupkCBCbxmJpkWHz9sJea0B+XNWrL4SRQKFW+mzNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CfhldpVn; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CfhldpVn"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-21670dce0a7so23852175ad.1
        for <netfilter@vger.kernel.org>; Mon, 30 Dec 2024 07:20:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735572002; x=1736176802; darn=vger.kernel.org;
        h=disposition-notification-to:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kHkrQy1sZ0ZtjuxUgl/Y3NFbl1vtKeKDaeiJxMI6R4o=;
        b=CfhldpVn8bZrlOiWK4GuNWAg7mH7EnIXSi83XLtti47LdN2JMk3U1qFBi33czv8S8F
         P/nY/XH/mX28B5V6JQ0YDeQMeygOYWAHM1TJn1vd73+h6hWKYwYtuFu4xpf/7G6uEvGU
         2mcKuR4PDOhQ5E7xC5e8pHv0KD6AQLNM3BNwfzi1fuZYEMeCWf7BOmpIuni/wDG+NS67
         Sbv6MDG0wM3FERKA+9ulljJbkqP0SNC+P9tg6p6YN9+YofXB3coQwZt5S9ojcG23Mf5b
         i50ZUGCz3oRe1BnBh1mcZOaBoVp+9uVCO1xkBpT2ugCMO8p1OIP0mVyQg48F5EuRRqKF
         fpZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735572002; x=1736176802;
        h=disposition-notification-to:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kHkrQy1sZ0ZtjuxUgl/Y3NFbl1vtKeKDaeiJxMI6R4o=;
        b=r/ap1ZjZsGVhk7CuytyLsxounoC3+rFqVoLVSYnsJ/wxoJT4hOriYQe7gjmjteiUWS
         ZQcqCawnp9tPYXpFaEIVMd+nVr9UMiVI/TujIlbmzSu7ookkHeEybcvrC+wHRSRQweeF
         J+t51A1eCnucyvGc84hn+D2k10nH1zP0qYLW/3GLACPIFGtagNRYtcAT3d2CDftblduL
         DOSRbwqx3AgboVEJR+CJqR/iFmp3/+JgseBCnvCnoDwbC7e/1vn+lLBdPFAdfvWM/69Z
         lGJnsa4cfGsyX4vcTbuU0wJqiYLykQlFamtQ5XmvWTZ2eMYlhUXWPqyApFKtMdgE8sDC
         hOwA==
X-Gm-Message-State: AOJu0Yx3dfSEWlZie+IZL40kP3PJaJVwDF5lE6eVtt1mjsIyjjP6X/fX
	R2ixh9QFUznlOXKhVS34rhLB78Eq1r3IDU1+W6kanPMGqbmm41DQzZ3AMWu4VeDExw==
X-Gm-Gg: ASbGncv12IMj+Rmnh/VTxXJk8jWsQ107vCiLa9mXZ3dG0RDu6cIwd7sjHUwLcOb+9SW
	Jwnr4UhbBOw0uECw4ZlbtzJvbskhzsV6bLxGqerGPXQICi6hTgh4cctS4s4z/kQScGis0l5dJcn
	3Auut5HybhM/rdCAljvazrGAmgCo5k5ddZRr+zi7eM+TWzo3sIMY2WYZMpp349bINEeo9GQPlGr
	wCL/uKYFbpGYsHMO3lg1MhyWVDjlw3f65+eC+CC09CSLGgY30Rp
X-Google-Smtp-Source: AGHT+IEI/xkbpzhQCW78XgH8iIAOQBj8kSZe9rU4y+3AK1M+fPlXqE/SRVa++n/hM2PSj/Ra5rPHyA==
X-Received: by 2002:a17:902:c406:b0:216:2bd7:1c4a with SMTP id d9443c01a7336-219e6ebb716mr532326335ad.26.1735572001582;
        Mon, 30 Dec 2024 07:20:01 -0800 (PST)
Received: from localhost ([2a0c:b641:69c:caa0:3784:b48:826a:b03])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc96eb83sm180490125ad.97.2024.12.30.07.19.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 07:20:00 -0800 (PST)
Date: Mon, 30 Dec 2024 23:19:27 +0800
From: lilydjwg <lilydjwg@gmail.com>
To: Reindl Harald <h.reindl@thelounge.net>
Cc: netfilter@vger.kernel.org
Subject: Re: expires larger than timeout causes error
Message-ID: <Z3K5_wCC4LwwCKHu@lilyforest.localdomain>
References: <Z3EdxDDREx_TeWZT@lilyforest.localdomain>
 <95e9679c-0ed0-4f57-b7d0-203729321d3b@thelounge.net>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <95e9679c-0ed0-4f57-b7d0-203729321d3b@thelounge.net>
X-Mailer: Mutt 2.2.13 (00d56288) (2024-03-09)

On Sun, Dec 29, 2024 at 06:01:48PM +0100, Reindl Harald wrote:
> 
> Am 29.12.24 um 11:00 schrieb lilydjwg:
>> I have an IPv4 set with timeout 2d, but update its elements to 4d when
>> a rule matches
> 
> why?

I just found it. With the timeout seperated, I could distinguish
frequent and active IPs from inactive / once.

Not very important to me. So I'll just stop doing so as it is
obviously not supported.

-- 
Best regards,
lilydjwg
