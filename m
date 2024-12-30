Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE870195
	for <netfilter@vger.kernel.org>; Mon, 30 Dec 2024 15:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735572427; cv=none; b=CdlgkhVPnXeTCY9h4JiL6gPDemJyWLT05JBNmY1KV5jO4INjmOgpARikT1Srql5V91EyjpN4Beukm6gLSbb+es5rAzydGOeuuhBCz+8GGMqh1gpzWBORrXHE7S7KpVbVaFZ8btrgcrLF57WrL4vFsvUx52cNDG6bV3DB1QpJrSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735572427; c=relaxed/simple;
	bh=b2seYREhFsN1oCtmcRl1azQYcgBkNF8IiL6rgoOorq8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M0ykHzpS4naQa3gcuCVwMdZrbX+kBmQRox5uROyHAmSR3LWniWRNWGhxZxsJVqfuRc+yD4u6NqdzTzrMFIXoTrzhcwBHVyPqdVaeZVlFqidHT8Gur0WZarhGxvFjbRf3P8kz0tv1inxzR7LDplyFdINZuwQgsDG9d+sz3C1YsaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YwdHpBoz; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YwdHpBoz"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2eeb4d643a5so12566064a91.3
        for <netfilter@vger.kernel.org>; Mon, 30 Dec 2024 07:27:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735572425; x=1736177225; darn=vger.kernel.org;
        h=disposition-notification-to:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=i1XHrRSoUYxUNq0S/qKdxqjG3NXyTTi5CFuoh+pvfnw=;
        b=YwdHpBoz7tcZWnXeKSQnKhL12AOT0+xpPfC6EdZJhjyFT+9jCNQbPl7FSw9skIggt8
         kpkhQ/q+iVrgWrVgesa9U8+Xp8z2E4UdQN3HEnzsNuZJP1hQGTN2f7Az8Vhdz3a+njwh
         6TseN06dxB/Lwe81BSFR4PMbNvW+XtppP54CFk9c9iu2EK5Ue/ir76zt1a4i1OlnHMqU
         A38CC3uNoaimDuUNzT95S6LTepOyXZJhus1Rg6OkXKWLM8IIjF9pkIbzyW0Z9spXBXM/
         q4IPDiVn8rqyjHgngEWM5lgrPm/f/vp8Vh+nR5D3VFSUjiDA5JrwwH8bhVZJsT61yeur
         WvJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735572425; x=1736177225;
        h=disposition-notification-to:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i1XHrRSoUYxUNq0S/qKdxqjG3NXyTTi5CFuoh+pvfnw=;
        b=skw8CYkh02we9vw4PdXs+0nQpVFTQZKj2GzRxx92rilYMOmj39sZL1aevzlxpUslEJ
         waE++goRgJuJSyaHY/+gdptcWi1Gpb8mwFhyq4y0GTz/OX73RU3gp24ijkNDc3lxjqsL
         w+C6I7tp7q+BGT4/p5uwPN2VyFzV+Zd54iCUsK+FLONiNnSjboDDHkb54OiIUOwl/u5o
         4bMIBORPaSlzKxeF8bvNQqBxKKHPZyInxWN02ZfPcyske6t1XkngnTyg3Qsq7kLFGoj3
         n/GJ1rf5QGblLCrJw3+4AnKUjyU/Tc8o0HAAdt/dDXPsFcFJAfCW1mFSkUPntEtCL5Ny
         4/UQ==
X-Gm-Message-State: AOJu0YwiaAL34C9hFM7vsDfQPCv36OL98hEQTP2knW9yOncdKDIGdkEH
	5OC05MR2HnKqXM01IqHcds5IiyajBl2pUZ9W59TGoM6ZVKn5CQ7r2MS5CvHkjTCaFA==
X-Gm-Gg: ASbGncvNpRNfy3z55KVxC0pixjmUFpal/PXqYmMQy4MQTSGlaPjvBK+scCvt+gT/GWQ
	EqtO1Lt4xdwQqyRFUc3PxpKr1sbVAM5dHcIgGBwyf5mRJ0sqMnFEla/rswvJ0AxYTOI9CaDMJ3W
	NoiPQcHSKoKbenQNITxXXTJgD3CS9+BvAvlXVmjNduFaYRiw/hBtHndkI/xoTmQEQmFqYkN0g9h
	R7zlb3HDcHW7cUNqmc1mMmPaCcbirPFUY11gcEPPlRP92B/tlMh
X-Google-Smtp-Source: AGHT+IFmDPgyS9rCFEJK0fOr365Tr+39Y6uxwOFAG+nXViYROYOSfJA61e6mw3mInxIXavz/Bh51+g==
X-Received: by 2002:a17:90b:51c4:b0:2ee:db1a:2e3c with SMTP id 98e67ed59e1d1-2f452df7e8amr50819607a91.1.1735572424892;
        Mon, 30 Dec 2024 07:27:04 -0800 (PST)
Received: from localhost ([2a0c:b641:69c:caa0:3784:b48:826a:b03])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f2ee26b125sm25236510a91.43.2024.12.30.07.27.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 07:27:03 -0800 (PST)
Date: Mon, 30 Dec 2024 23:26:30 +0800
From: lilydjwg <lilydjwg@gmail.com>
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org
Subject: Re: expires larger than timeout causes error
Message-ID: <Z3K7pgkVFKHq6Ytc@lilyforest.localdomain>
References: <Z3EdxDDREx_TeWZT@lilyforest.localdomain>
 <Z3J8fo-l0iMglG5v@calendula>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z3J8fo-l0iMglG5v@calendula>
X-Mailer: Mutt 2.2.13 (00d56288) (2024-03-09)

On Mon, Dec 30, 2024 at 11:57:02AM +0100, Pablo Neira Ayuso wrote:
> [...]
> 
> You have to use _timeout_ to override the default set timeout policy
> for your elements.

The "expires" comes from `nft list ruleset`. I tried to import
a previously exported ruleset, and it failed (and the circumflex
characters pointed to somewhere confusing).

"expires" works, as long as it is no longer than the default timeout.

-- 
Best regards,
lilydjwg
