Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A182B27AC45
	for <netfilter@vger.kernel.org>; Wed,  8 Oct 2025 21:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759957318; cv=none; b=WME5BFnrsvh9sgIAJueUbMdRDs6n7xF40Q97KXydshciWPNYyEQ9lKIbDeiW0B2aJWoOfuB3v1zNPLIsMCT/pu1Dager7nhM2/+NCyttm/3t4/ypuPfRFZhGfX4rq2eHJC36OJM3pblHnBeSU8rB4+ml8XcoFoUkM6purtdhDrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759957318; c=relaxed/simple;
	bh=yjoG0nWHeJ/l0oPz3dHC9ZcV6U456US62dWQwfyxvQY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=R5xQVkhINWAahdK5YgSSEhYtIkZEEoBEg5DSkndmwiGT15Via/KzoMT1mKP9XRxZ9YOAfx9r5BGCyQvgk/qhz76ZxiDIrpMrp+O99D/CadSOr8Z2dkzmFYJ7FaHQE2aLpon68/ODuXafFl8wsyhjYkUm1pRekOJ+sgKniySRwhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ee2WYsd1; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ee2WYsd1"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-85d5cd6fe9fso21405685a.0
        for <netfilter@vger.kernel.org>; Wed, 08 Oct 2025 14:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759957315; x=1760562115; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=60OsxgD4U9FITiBGJ6QPC9fN3MgqA/5HjaHm2BMKSsY=;
        b=Ee2WYsd1iERfe+ZdTTDX9fqhBTz+L9agOTBqbod3JaIkWIRVnpSoG5t85vYuaYc81y
         0ZB2UGRaRNpaiUsTWIbAvelkz1ge8Az1typxxLC5h7OIrrnhgz9e8XGKcUVR0gyg688S
         PdPKVqa4Bk41v2ujqPClwtdw3FTlU3tFMGrI+4OEtYBgPNINUGlfUe3G3/fYChMRvH1k
         OpHgGzYzDVUMYNJc9oWmFYFtmqsofSFCFTR4PijoYD2hMFzWerUqQDUFeKWqp408+lZV
         Jw0assOVp+8QQP5uVaXLXwCSuTETwT6cvBrgHHGcBjGStGIOZPKOYxJFMczV+aevxb43
         w1Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759957315; x=1760562115;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=60OsxgD4U9FITiBGJ6QPC9fN3MgqA/5HjaHm2BMKSsY=;
        b=ND22ItBhd28yWKbMC6xidD+mCRQir91cHdIfFhtw6lyaJNOYAo7JKePm17Agxj6omL
         tO1UzEE9XYKa/a/ieQR1+6v+Pcx1EVjgr3pD9BCy95PVV+/HIH7WawjLbpvQoBiBLq0B
         ozf9achWk2ujWmRIVnkdku2iikacW6qpR84OHLbJ8qDL/gVBevjZEOKujCrwP7Lz4prB
         uJZ+3Ei0YzIMvLrWnhgKWkV4JPCpPuf9ke7qWx1O25+r/13MzWeXyAih0Igitnw3PHYc
         zAFmduOyfEDKN9HCMu/gCYhFY11U3A4efMA0hMMCH01ZHMpvt2d0+pwpp8Ufh4RJMmf/
         40WQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5xzpDZz1tQ+bS9rSFs/C9+ACMmn4wbLcPcZe7/5k0e3i+yn0yrs2eDyM3XG6Caj6dZNvyAoyWGbM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvPrintqxhBoGdOE/1MZdZWIiIcugJS+CPBDerPF+Hoj4pcdWf
	vgnENNc8f5G8wi3iOuPDmqHm171M/sCjwDJAS9+6zPVZfxS4GGowZu+cde3CLQ==
X-Gm-Gg: ASbGncu0Dtf+kVkp7CGLtAzuruxQClRETI49I/T0q13yG5J0vRyzVaX0T1aUDfeWy20
	zidpWbvBX5xdVJ4xLGCzGtqzDXfuJiFn992g65o5j4RXDP+bABnUeENDC7pAqiZG+m2/sSDzaOO
	5kTLudFn5q8Q+4xw2PpKFyBVUJpsav7lMMkczsGmWPDXhpOhDtjDLRIA8LUrV8fTfwOFOoA+jQp
	2NYh2BF5rJgcBPuUZJjXXd78537u5ljvqFIcs3iKEKT73kl42mmIJCG0UJmyu5N6iiLri3ZOEU5
	7jQqeDOe3WgjzfoAxT2AEEE+MyqZTOtQDLdPnUVFiMRRwwXHmYoEcyVXfnRj2g18eK4NVKGfcka
	h8fVVLvsedl5w8mBHTAJ2sAEL4n7Ovw6Xpa2mQo0N
X-Google-Smtp-Source: AGHT+IFundR4DNjz1TylTGwjxQCRlhfiy1A4aJPyVFzJHYA29dK6doqpqaD+FLMAxUw77WR7GbKBmg==
X-Received: by 2002:a05:620a:29c1:b0:863:ff43:bc26 with SMTP id af79cd13be357-88355a5397bmr881523185a.73.1759957315312;
        Wed, 08 Oct 2025 14:01:55 -0700 (PDT)
Received: from playground ([204.111.226.76])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8849f9ad8f2sm68424685a.20.2025.10.08.14.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 14:01:54 -0700 (PDT)
Date: Wed, 8 Oct 2025 17:01:52 -0400
From: <imnozi@gmail.com>
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org
Subject: Re: nf-ct-list and nf-exp-delete
Message-ID: <20251008170152.7d8e13c0@playground>
In-Reply-To: <aOZP-v75f5yMTdrk@calendula>
References: <20251007051508.049e8821@playground>
	<aOT1NhYSS65KwwJD@calendula>
	<20251007184531.73f3404d@playground>
	<aOZP-v75f5yMTdrk@calendula>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 8 Oct 2025 13:50:18 +0200
Pablo Neira Ayuso <pablo@netfilter.org> wrote:

> On Tue, Oct 07, 2025 at 06:45:31PM -0400, imnozi@gmail.com wrote:
> > On Tue, 7 Oct 2025 13:10:46 +0200
> > Pablo Neira Ayuso <pablo@netfilter.org> wrote:
> >   
> > > On Tue, Oct 07, 2025 at 05:15:08AM -0400, imnozi@gmail.com wrote:  
> > > > [iptables v1.8.7; old, but it's what I have.]
> > > > 
> > > > Why does 'nf-exp-delete -i [id]' *not* remove remove some conntrack entries even after being told to remove them multiple times? It deletes most entries for my purposes (if condition is met, delete conntrack entry and block the IP using ipset). Blocked IPs are DROPped on internet side, and RESET and REJECTed on the internal side. But from time to time, I see ESTABLISHED conns that don't get (can't be) deleted.  
> > > 
> > > nf-exp-delete -i [id] ????  
> > 
> > Given:
> > ----
> > # nf-ct-list --tcp-state=ESTABLISHED --reply-src=10.X.X.2 -f details
> > tcp ESTABLISHED 188.132.249.148:57992 -> 204.111.X.X:443 10.X.X.2:443 <- 188.132.249.148:57992 mark 17488 
> >     id 0xf016f3da family inet refcnt 1 timeout 10m 17s <ASSURED,DNAT>
> > ----
> > 
> > then:
> > ----
> > nf-exp-delete -i 0xf016f3da
> > ----
> > usually removes that entry from conntrack. In my experience, some entries are not, and cannot be, removed without drastic measures that would interrupt firewall operations.  
> 
> Where are these tools in the git netfilter.org repository ?
> 
> And how does this relate to iptables v1.8.7 as you claim ?

Sorry. My mistake. They are from the libnl package.

Please disregard.

N
