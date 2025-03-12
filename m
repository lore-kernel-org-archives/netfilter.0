Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCDA5245017
	for <netfilter@vger.kernel.org>; Wed, 12 Mar 2025 13:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741784680; cv=none; b=TERGteJLDoT44paFeiCUU+5AfZramfLcKEoTYqQljAL3YY7jSXix+oJ4vEZockMV4oZVyDFEMy15b+8oQ6hjKrjPtB5O9atK0mVNL+d4NMTEJf6/+B7SXL/HDwjaomFJF2m/QLFqYnOf//lICjFdF8TVDQf/suMW8EKFrSHvN+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741784680; c=relaxed/simple;
	bh=1+gIRJGF7+E7snfT1vnL5C4gD0npCRIpVoPr3DXzd98=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZwyzTRA5YaOqN86W4njKCIc/uW9UQp9PNZmN+eisijSaxCB3ipzGXZek4Fx5O5I46l2ZHVHBH61jyP52xmq62f7D5JahUsWmsn6EwXAncjY7NWn+4uoGMt3ZiI/2MXkXOmozzECbbaZ097d6fACYPmQK73NgAuQIFfI9bBOOwgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UGnxHHYk; arc=none smtp.client-ip=209.85.166.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UGnxHHYk"
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-3cf8e017abcso23754215ab.1
        for <netfilter@vger.kernel.org>; Wed, 12 Mar 2025 06:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741784678; x=1742389478; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1+gIRJGF7+E7snfT1vnL5C4gD0npCRIpVoPr3DXzd98=;
        b=UGnxHHYk0bRNYgF08H6RqioJLZgYS2Yi8hYivxAa9GRtol+Nmz8MJ8xYRzRQhEfH/6
         XTJXCjVmglSm4uiS/jwAlInARY3OYJCz7spa241MkgtrGi+p16tKviMYs9Es9Qb4YrBX
         jdjXkqtw/kuVaM+XS5OAXbH4yt28BSbrOoNSHwC65VME8UWH0evK1DfKhGZOB9FC8obq
         k2oPAk1dc4yjVUnrTmfY4B+xGteVML9dJvaHFCtshpUsvR+qbYYAumSSz7K6I5SxYwLo
         bLwxn9TQye79dfxRS9aCOrVM5YBGz+itOIZ86UJCmPvpl1w1UNBgNU1CK50fFbSeBJio
         uQzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741784678; x=1742389478;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1+gIRJGF7+E7snfT1vnL5C4gD0npCRIpVoPr3DXzd98=;
        b=Sl7kR7Hd1aeLde5rxE4DO9ky0v353k1EM3XJIYZXwHnJy6JFByEAZdk6rsomb1IlyQ
         lvBAzz3kB6MqKPt3cuPBFRfTHpK+QkYrEJm6714s+f9C26mGwTMVz7g/la1R2KaOAEMu
         9M8JVaC9UmtSqwFoAS6+ylvDmTmX0+U1xwik9VLxr3QKiQJ1dXzN3B+dlmE0FTfohhrX
         aqBKtkGNlG3Eyf1N5tJBkuLZqDACQtpA2ysGH91O75Nnc9et8cJN4IGS/+B0PQmPWJ6g
         6Vbo51y+hZJ0ELGe6AmLOHzFu8FhDMuaicm4jgMxQItiZPAF7h7SRIobyUJrbohLN2eZ
         IqHQ==
X-Gm-Message-State: AOJu0YwxFmnmticTqkqc/igMkx23n65fQ9fDgdDdk8Vsrl36mipFjnrR
	Lp1CL2yqc7ZbfsekJbW9nOE9wijS82AzRAbyk3kbW2iHaKa524E+gSZy1U1mA3Th7EM/UEgvbZZ
	Q4vR+nLYnWYY1K5YJoZdXvA61v4CC7+Ygi30=
X-Gm-Gg: ASbGnctwIRahWfPosFbGJW3WiKZCFVDN7Af3G1PoD+Bak/5vN7iEEoAf878CGu963/T
	B8NCprFHABCt7KRXJLWWeCELpDNA/ZdNlyjYdePrLT3ktwOOaEit3a/mgMMcY7Gf0R/5V4twYD7
	h4x1EY7DFvsiCOoohbNZnuAQ0=
X-Google-Smtp-Source: AGHT+IEgmUMPC9mqMG4o1kKdE8Ze4DL22jvDOD6up/MrHr0utfU4E2O3d7QwMfjbubeqgfJKskdS8FSb3dlIH7U05Mg=
X-Received: by 2002:a92:cdaf:0:b0:3d3:eeec:89f3 with SMTP id
 e9e14a558f8ab-3d4419c1cf1mr199721335ab.13.1741784677703; Wed, 12 Mar 2025
 06:04:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CABhP=tYOynShd82rwVuDMJDTE8LcM6+FHwx7Tfuk183EW+ipPA@mail.gmail.com>
 <20250312071148.GA11288@breakpoint.cc> <CABhP=tbcvzOBbBPTMQK+Sz_yBvQ95_Jb-5cgJk6ziFk1nH+zkQ@mail.gmail.com>
 <20250312125142.GA23038@breakpoint.cc>
In-Reply-To: <20250312125142.GA23038@breakpoint.cc>
From: Antonio Ojea <antonio.ojea.garcia@gmail.com>
Date: Wed, 12 Mar 2025 14:04:01 +0100
X-Gm-Features: AQ5f1JpzHsGMY4ok9V3LRCCPr6AZbtt8aSfVii_GbjhW8eBmisxOiD764mRoOYk
Message-ID: <CABhP=tYr-QOwsxiKnJwNP_7JsybxhK-2_y1c6CEfP8nGMhgD6Q@mail.gmail.com>
Subject: Re: netfilter expected behavior for established connections
To: Florian Westphal <fw@strlen.de>
Cc: netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 12 Mar 2025 at 13:51, Florian Westphal <fw@strlen.de> wrote:
>
> Antonio Ojea <antonio.ojea.garcia@gmail.com> wrote:
> > Is there some kind of optimization that just directly copies the data
> > without going through netfilter hooks or am I doing something wrong?
>
> Looks lke whatever environment you are using has bpf progs in place
> that change packet flow, or some other proprietrary modules.


hmm, I'm building a vanilla kernel and running it with virtme-ng (but
it is indeed a controlled host)

vng -v -r arch/x86/boot/bzImage --user=root

let me try to run in a different and more clean environment and report back
