Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E642EAB98
	for <netfilter@vger.kernel.org>; Mon, 25 Aug 2025 11:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756121987; cv=none; b=rc1C5cLfsnPvNz12o3FvimGKeuZphqsKOldzHOTdToEmgVdRG9R6R42voDZSl90hAkGfvQUKXCyb7YlheYr16RXyMikKiBHQyctR2WF19xSAjYsWeATVmz5ibbECauZu1TL6G/qgw+Zo84zjJDzGWBKzmKP4veUdtd2d4rEF6Wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756121987; c=relaxed/simple;
	bh=bJ1kLSQEtz/GO3Nvavfa7uzH3JgfIg0fa4PpeR9sRec=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SuHIVnXdqT4PsamsBYPdf43olOg9NQ+69jdJEtggp4BKsl/Qlo8fKU2q6WCESxdexM89lio2fqeAAahk01flmqfiko0R5tTf1L29YPAP89KVJg/uxw60QqZk6keZSMkviqXjG2ADhMHmlQKVuV6YtFprCzKhDTdyIcyy5S44BeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NeSYosQy; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NeSYosQy"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2445806e03cso49497575ad.1
        for <netfilter@vger.kernel.org>; Mon, 25 Aug 2025 04:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756121985; x=1756726785; darn=vger.kernel.org;
        h=disposition-notification-to:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hy6xRfMFQs879hfhQuVJLzopMO85kJm+BtC1qmd4cOc=;
        b=NeSYosQyS8XpboelUM6R56M5GRFDdK4cFKUnkK8W7+WZbZAHGlyeUoDAButZoy9IEV
         Fe3cWVFeYAFfWSbTUvjEhBttOOGUC6bcaWH5QlXNqTy1ZrGGu5qG8DG5p1c55GPTq04Z
         9IIK3ZM4A+nhAW4QaRCDf/ECVOFmh5eGe8Elplj/uN1sTzQd6BusjdkK2jyXCXVGEnGP
         dkc7FCyUzR2nACCsZnfdVhsv95OmzonCL1yY/nQsyNZgrW2G+Nsz6P7c402FAfNEuQzp
         /MJXwuA9FOOybr3cxUhCnC5uI9t2GJIeWmEeL/6EEQvVNpdP2e5cdkgauhmG+GmtIa+T
         7+lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756121985; x=1756726785;
        h=disposition-notification-to:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hy6xRfMFQs879hfhQuVJLzopMO85kJm+BtC1qmd4cOc=;
        b=MNfSZkDJJZvKxw3PKkL4m8S0hY7f+UMOmI2EpnTgmFJbYB0yoQHATjcOdqedc1ZG9Y
         W2g68hc+2Yjkp1NZwvNLyBqqGEyKdKwOc2oF1VL1nforz3oR96B69DzY/NIZVaOIIBIK
         00gPsYVKrGPSm0XEiyUPnT5Vjes70UPGjVYKwIQH+Kx9c6RAi9i1bFOmQ7ibjnNGwc1z
         CVgddf1BwBWRChDtWdFWivU0sQ87MD9BTuI+Py7ITp/EgoKyRlpen+YhA9nKfSS7Kkv1
         9KTP7RebOX/T68ZlTifFXu7RywNhrRn+maes+PyyXlr0tdGlb0andSfIA0OmNCUEcQED
         wntg==
X-Gm-Message-State: AOJu0YzofIzynAFjgczI1fGlnzR0EJPbcvCNiE5V6c+cR6+1DUA1fIsQ
	NDwRk46Ro8N2OqhpYJoFYgLd9M6LilGpZ1+CspT5/8M84qlTYgEW4Qze
X-Gm-Gg: ASbGnctEjCx/9CIuGAryp2NZP/gLeHYDT2s5voUtfABrQkQTlPK0WW3XZZCa66GUuOI
	OCbl98CsPleQbcGeVb66lM7KwUJpSdwMVr5DzGKOX6wwisSzH2HaDRL0kQCg5hCmRIHt3g8zdOh
	Juq0lAN0iSlIit9OSEGiLOsHhZj7L6TEjdHts3/8hX6bESTJQAeynhiPS29GnPt2t+EffO/tggn
	+SguapTWwpnzHs4RqsXQUorXZX3qAl6q2g1saYvqSFv3cP8nXoSxVhdd8bwUwmmN+H4zGOG6tg4
	jFwrroc9loRSdo0Nkq7JriDpXP94GynAgO53+0rA+WOwz/+afEYEL1TFg9Fy/RQUUR9KzIty5tH
	RcTU5wlbXHyzNF6nCEZg7+g==
X-Google-Smtp-Source: AGHT+IGlBBSIK5tnu4jR2x1kCrYA4ZlmX+jwt1pcwIGs+MALKMFQ+PPcBe0r+EG/pEHgCQXZR7WBLg==
X-Received: by 2002:a17:902:f689:b0:246:d98e:64e with SMTP id d9443c01a7336-246d98e0aa8mr40658015ad.36.1756121984904;
        Mon, 25 Aug 2025 04:39:44 -0700 (PDT)
Received: from localhost ([2a0c:b641:69c:caa0:c280:2033:78a4:1176])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-24668779fa9sm66615025ad.27.2025.08.25.04.39.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 04:39:43 -0700 (PDT)
Date: Mon, 25 Aug 2025 19:39:09 +0800
From: lilydjwg <lilydjwg@gmail.com>
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org
Subject: Re: nft error Could not process rule: No buffer space available
Message-ID: <aKxLXVwDTD33XJ0b@lilyforest.localdomain>
References: <aKrK6h2zYdqj2unR@lilyboudoir.localdomain>
 <aKw4DikLFS8MVGVY@calendula>
 <aKw_GLWO53mX2ELx@lilyforest.localdomain>
 <aKw_XTxe24gOAreu@calendula>
 <aKxBrp9tMSbM6Pw0@lilyboudoir.localdomain>
 <aKxEz_q5TEQT-oRV@calendula>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aKxEz_q5TEQT-oRV@calendula>
X-Mailer: Mutt 2.2.14 (516568dc) (2025-02-20)

On Mon, Aug 25, 2025 at 01:11:11PM +0200, Pablo Neira Ayuso wrote:
> [...]
> > table ip6 gravity {
> >   set domestic_ip6 {
> >     type ipv6_addr
> >     flags dynamic,interval
> 
> Error reporting is misleading, combination of dynamic and interval is
> not supported.
> 
> Looking at the example below, you do not need dynamic, remove it.
> 
> ENOBUFS is reported because each element hits an error and
> 
> I am going to take a look to improve error reporting for this case.

Thanks, it works! I didn't think the error was elsewhere. I thought
dynamic was convenient when I needed adjustment later but it's OK if
that doesn't work.

-- 
Best regards,
lilydjwg
