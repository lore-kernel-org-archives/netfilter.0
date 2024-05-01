Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF025646
	for <netfilter@vger.kernel.org>; Wed,  1 May 2024 00:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714524391; cv=none; b=kiC2BZIIBMR44jvAzsjfh/DxOR1nN65Dv4eh0rpVmyYxYkRlo/PmKqi9jYt2FZ5cspgmdq8mqd4h1/fCIgw+nY0OsqFTQkNRCEhnVapZmXRgu6qc/JdpV5VEkFmxaN4feeBydhR89BtkBFz+f7lhXW++mKV9FPNs2TR8Xop4+3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714524391; c=relaxed/simple;
	bh=57hsRmYAc/t7OZ3pOFiv0vUk+tb/w/nuG2nMBuqaKrE=;
	h=Date:From:To:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k2uU0BwnsAAOvN+yXEpfdaoro4+W9/E/0grVPwo5WJJJyjERQoKcuAADMb2vtkWE6E12LPMYWLDFTFEcgmBw4MI0/2yqkRYWmwkb9VDXmj0jB2DYpYCMruIuO4LlOi8P6f+5YCla5nUjlgRXpl0nNpb3cdYxjaoO4uDlPIMu010=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lNcs1Hx/; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lNcs1Hx/"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-79100a90868so183107085a.2
        for <netfilter@vger.kernel.org>; Tue, 30 Apr 2024 17:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714524388; x=1715129188; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BSqHV3pY1VvrURGZmZEDdOGxJ+dfIjFQ4Vd/ETqi/fg=;
        b=lNcs1Hx/7K7TPSkDIRQV9lTzeFJEcnLY7+416lPBsbqNXkbuCmxE0LG4HZOWZDupUO
         KFNTTTmlZAGDT944QT8mpr2pUXIArdhZJMiVcid6yf8Tp2NAOdnI5kTFxDbr9eMSeYke
         AVNyRpPTQuCTgXLwirb4ywP2ySKdCxwAiNfLHHfVU/iLNssdkWlEmTCKUhsVqufuVtAd
         yvwS2dxaz2rVbtH6lWzDkQ5ceMvwcGo8aB5HNL/4wpHp1HFSSfkgiR1awxah0FrzJutM
         li6x9E3YS07YNpZk3jhD0SbCeQ6nKooYmWY0ORQKQ8pCWAWZ9w1URG1Oz+wWLQKSwiNt
         cxlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714524388; x=1715129188;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BSqHV3pY1VvrURGZmZEDdOGxJ+dfIjFQ4Vd/ETqi/fg=;
        b=W3d3X8osJRTlqiH8lntiRFzp+8hRok64bB88DyhxcMUj25zj850TICPdONg90QEShy
         iChymo5x0HZYn0HhDhAxMeGh1oYacUvb9WsQtT7eqq1GBGeC+dPoj89iBn0TBcT8nEK7
         eX5HobUIUHfSyfT81O7Duo0feTwzLnLb4v3TyPdUuurPtAYbhG+oy94pIqAvvpoM2Zsb
         OiUSo6r2akDcz05MIOknHiXrxyNJ0vXAh5xpAO0VIAJi/FrMH87OXeX4kCjWupNhrdXB
         ZMXfVB7thYygx+bLiYZK3X4ldcOEyeA06+uuv4eGtncOJmVNY0Q3Y4E5ao51Gdyr+RAY
         YTCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLeUlkUwT1+wl81E9wBQ/Fe/nEa3N+ZoBjmQglwkRXP3aKihjv0ckmwEBlKrOqGp0SueRczvpPPdNkzv5a9fiV0FHHE3GC4zUX
X-Gm-Message-State: AOJu0Yzusv7nJYKYl6yR0QSnCvf8MDXX2sb6lAXZv3MVm78+2ylHKH2B
	kpKD6ZD5gRY8TWthF1HdidgtUetop4UgB48vobz/snfjod4ufrcLaRUzoiV7
X-Google-Smtp-Source: AGHT+IFswX01ARA/vA2PMxXCNOb4Xm6ECobTqis/qD3nKKj9lFj6xA6UjMzdW4JSNEmTZEPan0aXtQ==
X-Received: by 2002:a05:620a:5706:b0:790:8ca1:2bd0 with SMTP id wi6-20020a05620a570600b007908ca12bd0mr899976qkn.43.1714524388504;
        Tue, 30 Apr 2024 17:46:28 -0700 (PDT)
Received: from playground ([204.111.226.63])
        by smtp.gmail.com with ESMTPSA id w2-20020ae9e502000000b0078ec3aa9cc7sm11918398qkf.25.2024.04.30.17.46.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 17:46:28 -0700 (PDT)
Date: Tue, 30 Apr 2024 20:46:25 -0400
From: <imnozi@gmail.com>
To: Sven-Haegar Koch <haegar@sdinet.de>, netfilter@vger.kernel.org
Subject: Re: IPv4 NAT and lo, and iptables
Message-ID: <20240430204625.19335253@playground>
In-Reply-To: <184bed16-17ab-d6ee-992b-2e094b639016@sdinet.de>
References: <20240430182200.39ac9ea1@playground>
	<184bed16-17ab-d6ee-992b-2e094b639016@sdinet.de>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Thank you! It *is* an oddity; but it's the nature of the beast. Added two rules and it works.

Cheers 'n' beers!
Neal


On Wed, 1 May 2024 01:03:28 +0200 (CEST)
Sven-Haegar Koch <haegar@sdinet.de> wrote:

> On Tue, 30 Apr 2024, imnozi@gmail.com wrote:
> 
> > Questions:
> >   - Is lo ignored in PREROUTING?
> >   - Is it possible to DNAT local traffic on FW_A (changing) the public IP to
> >     the private IP on LAN_2?
> >   - Would I specify '-i lo' in mangle:PREROUTING and nat:PREROUTING (as I do
> >     for the real NICs)?
> > 
> > The uber questions are:
> >   - Should I be able to DNAT and SNAT traffic on lo just as I can on other
> >     LANs, or do I need to take extra steps?  
> 
> Locally generated traffic does not pass nat PREROUTING chain - you need 
> to add matching DNAT rules to the nat OUTPUT chain if you want dnat 
> rewriting applied to it.
> 
> And similar traffic targetting the local system (after DNAT) does not 
> pass POSTROUTING, if you want such traffic SNAT'ed you need to use the 
> nat INPUT chain.
> 
> >   - Is this a known oddity? or was it known back around Linux 3.16 and
> >     iptables 1.6? (Don't ask; sometimes we're stuck in a place we don't
> >     want to be.)  
> 
> c'ya
> sven-haegar
> 

