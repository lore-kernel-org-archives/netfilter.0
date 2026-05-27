Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC567315D21
	for <netfilter@vger.kernel.org>; Wed, 27 May 2026 01:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779846127; cv=none; b=HSpWOV/enPXL/Ug/XHPCumH4ng7JW4xT+jugEwG7rhq5GW2QvkMpnbXA/dS52LsrW3Tt1RHZB+Ku30deXSM6PELNVK7nzunz+WGEJgOIa8ZSyVSEMQLd6A88FWw+wMPJsOOWVikUQMvTnDEtrPVfyMMetph3hPrgR9xNTrd/E4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779846127; c=relaxed/simple;
	bh=32dsN97BG1ZtaFA3Ti+ukBCBqCSSr6/wnuQlbV8qZMo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qwaOxl/oW3diQSoLWYkmifa7CflLIVpcCW3QLoa1fh8vZZ6CyUiKrAY6A6fXaB5sEtNHcfi43Kv40hBVlyUzfSAxMAJ546laJz7sErjeRRcuEy94P43iLxhNXo4piF5ZdYY/yalTiAiBlNq49gxIgaaJ6QKMO81V3MGfAABuzLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U1zUVIcn; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U1zUVIcn"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-914b03e42b2so630842385a.0
        for <netfilter@vger.kernel.org>; Tue, 26 May 2026 18:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779846125; x=1780450925; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tfHhtsUGD4nsHiG1/1+cWW06MDN0GRT266FNCCiFv9w=;
        b=U1zUVIcn5wqKsesqNfWQeCvMalIJASt5utNWytw25hLGHOyvU8ofcQWLzpOCxaeyib
         /ZhbQWGq6SLwrEatgPKCMpAuFjX1F5YaIzfnIqfPYymk66x4am24UeW31tl3z+AeIXD7
         M1i63npsp5e4oDIBvNy4CGAyhQp1kz33WUzk4Ij3BascBVEF5doFQvXC6a13LhWUJUJR
         IibPq+PMULJA7blmuuC/Aq0Wpvw2uaF8RvNEsPoWHfMQ5zRce1RUOq+ptrBJsVyO55ap
         mV6q/aPgGEI5nqTAAa9ktZAXajH/XA4owJgYvPVIgDOwlp5l+9uQitGH2hDklePho0AD
         ASMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779846125; x=1780450925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tfHhtsUGD4nsHiG1/1+cWW06MDN0GRT266FNCCiFv9w=;
        b=FIlo1hNRqhjjerxt+KYSetj8Bb/JSUskjunKrnNcN7rZVtpW10w4g4rgMjiqwhK6Fw
         tfkf+QxSISDla6yxh40nljr7jh+bFU/XK8lnUo99uff5CpX8hzhv+yP6c7Z9sUFMvBQR
         USv31HG9A/9aVRGXnwGTjtY4QZgf/A8DSjU/Ks2/Qc0lk05jmPkEaiWqhWxjbwahjhit
         +85wqrAIYDBKW+emqdOFdnihE5OUDn+1icwfCHIOuRulaSDzQf8eE+0QK7sylMgHxMXa
         q0fSzH9IWs8CDtghdMcqlMLdvUd4zzIjcqdVZFGGqwiy0k/4pVj5DOkwuDc7jicR2057
         /MyQ==
X-Gm-Message-State: AOJu0YxLYRbrUi1UwyZTn150CwQzaYl4aPaJT6t6wJ8VVHZSB+vEH9mS
	1i0+lefVs/8XEV38kEq4XKIyaNFfwLT1DEyuPOeDIzA/fxk2GqSrQ/s5DFO9Cw==
X-Gm-Gg: Acq92OE2tX+LQ22phronkwgde5wr8rlsUEBRReFjqbIfn1F4SHKYSLCNVN7j+iyN4I2
	+c61uCJtKC+DGz0hSra/BPM+25f1pctAHICb+6M9b8xXpiINo+VlNPeUxMDNQOUBrNocryPX37t
	Hiwv3QQWKe+XbZiGTcwPf1hMFR2O5UPXdKe6D02qoREPmAfdh5tWjRU67t6CciAuieoeBE5EmDM
	xOJPnao+VnIJ4Utwi05sneMR45Tfwadda6rpX8wfRdKKca6JQhMtSjNoTQGBM8uxAtsmAXEVNVl
	gr1TqKXmcEw/eNS1y5up+3UwEaGFowlV7h9N0hmvonIEV5ZchVL6UXXzcwWgausjQsQhrXl8QIl
	38AAoH9BDoQ/lBVf8BcorUC+TApic6Qd/o2N4LSZHBvUs05bkxIanhFjmDVQZGzjsUBA4Q6WChd
	wkRXN7MxW9Xmt7vIwV
X-Received: by 2002:a05:620a:1996:b0:914:cd24:cb0f with SMTP id af79cd13be357-914cd24d09emr2062826685a.40.1779846124760;
        Tue, 26 May 2026 18:42:04 -0700 (PDT)
Received: from playground ([204.111.226.76])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-914f870eae0sm354427885a.18.2026.05.26.18.42.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 18:42:04 -0700 (PDT)
Date: Tue, 26 May 2026 21:42:01 -0400
From: <imnozi@gmail.com>
To: netfilter@vger.kernel.org
Cc: netfilter-devel@vger.kernel.org
Subject: Re: ipset not completely working in mangle:PREROUTING
Message-ID: <20260526214201.0e3d6f3a@playground>
In-Reply-To: <20260525205736.1c76666f@playground>
References: <20260525205736.1c76666f@playground>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

OUT! OUT, demons of stupidity! Or to use a slightly more modern saw, artificial intelligence is no match for natural stupidity.

It works much better when I also add the VPS IP to the *whitelist*!

Sorry about the noise. Sigh.

Thanks,
Neal


On Mon, 25 May 2026 20:57:36 -0400
<imnozi@gmail.com> wrote:

> iptables v1.8.7 (legacy)
> ipset v6.34, protocol version: 6
> 
> I have four sets:
>   - blockSetHost (hash:ip)
>   - blockSetNet (hash:net)
>   - whiteSetHost (hash:ip)
>   - whiteSetNet (hash:net)
> 
> I added rules to match the block sets in filter to INPUT, FORWARD and OUTPUT. The rules match and jump to chain blDrop. In blDrop, if either white set matches, control returns. If no match, the packet is dropped.
> 
> This works well in filter. But there's one artifact. The blocked packets are 'accounted' to the internal server where they would have gone.
> 
> To fix this, I added the rules below to mangle. Here in mangle, the white sets never match and all of the packets (that matched the block sets) are dropped.
> 
> Is this another instance of 'it doesn't work in mangle or in PREROUTING'?
> 
> Thanks,
> Neal
> 
> ----
> The rules used in mangle; eth3 is internet:
> -A blDrop -m set --match-set whiteSetNet src -j RETURN
> -A blDrop -m set --match-set whiteSetHost src -j RETURN
> -A blDrop -j DROP
> 
> -A PREROUTING -i eth3 -p udp -m set --match-set blockSetHost src -m state --state NEW -j blDrop
> -A PREROUTING -i eth3 -p tcp -m set --match-set blockSetHost src -m state --state NEW -j blDrop
> -A PREROUTING -i eth3 -p udp -m set --match-set blockSetNet src -m state --state NEW -j blDrop
> -A PREROUTING -i eth3 -p tcp -m set --match-set blockSetNet src -m state --state NEW -j blDrop

