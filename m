Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 198AA2045AD
	for <netfilter@vger.kernel.org>; Fri, 20 Feb 2026 11:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771588397; cv=pass; b=Vlhj6JZY6DL6Mt7BRjXoUEwHKdybv7MXqLJx+lkKBY5j8ToprnEll+cApbs4AC4+Rp9dhl7SGLB+NUryrfMd63Nyx6W8RddG5YcOsXnIH/dxH49GyDnBZFqMiSdCiI5ALKwiNy2Tuc6f9gAmYfwV9UpTHBGfOv+EFWbbCmYkXoI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771588397; c=relaxed/simple;
	bh=FSvDEBA44bDiYZE4U13R7/fLXcFyL9CAEfnuMIL71hw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rxZEjvhJyuSEDlaqubOOJHCYDSLtbTWjmoVpRSWdevgJYKCcfKQVlHVL+B5aqcBO9+Cn/TPz0jXVR+sLpCqY+3S2H22Xvh/uvIfGn0JVdWt9pvLpwXZfKezdqQAfdqCCa73tZeWLtom0yy4rg2SNllJ94gyVkVzOd2u7Obw8VL8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PQEZQRBO; arc=pass smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PQEZQRBO"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b8fb6ad3243so327343766b.1
        for <netfilter@vger.kernel.org>; Fri, 20 Feb 2026 03:53:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771588394; cv=none;
        d=google.com; s=arc-20240605;
        b=g1bFc0XaT1P1NUhBTCOWvZs3cXY/XghNXnjwUEIhR6F58MDN4t7d6OWBHJMj6Lc750
         UE3kr+rY60rpoqwsflzlB/OUrlIbdhai57UobeJas9l++B6/wf+eYrnzM9ySqV2kq5nW
         l1bsnMGlvBr4bG9EBqAtiC8ULybsFJKRf80okj0RmO2FJYsFlafJ6RdHzJ+juf2+c11y
         SUcLUak4GbUVacEkvo5BEItnNRBBJcqLczbl5rxG7VJpzgfbqitOI4pkXBp/NwyIt+rQ
         JP0GFShNSQ6mPX18qlA2zXol3soLSVygVUxpvwZ6jSGqqMU9CoAUPHwu+id31/nG06NF
         iCbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FSvDEBA44bDiYZE4U13R7/fLXcFyL9CAEfnuMIL71hw=;
        fh=dQL/icvlRnEEU32fCG/BceaqwZ1e8totpmh8mBT8gSg=;
        b=W1Hm9JY9a9t5lmz+NbUtqbBp3xtXD9jhfdoVfXBEAd3n6KWNAtQyfqNdVRyG2Ksw3z
         E2F8pLSzcPVatv1zFXFJPhG3723TeMo1AOqyF/cKVjRKgXVcr8VErHQS9gxZZx/v6Pxh
         pUirvXW/EXJAOao0f/BCkXCmh55Q+OugzcC4OkwkbTn+dnRTSMTwEddj2zn5mfQX3dPr
         j3PukvslA3BkvySg8ZyAVPLqShV6T0dW3uDxQUEbU5cySSkgFmLdMziTYy7qK1hlWvm2
         ynT2QC/UW28RBRhHzEhDI///R8a1WgtZktJmqXCCbuIQ8D9NcIpiKL3qFW/UyqurpmV4
         w1Xw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771588394; x=1772193194; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FSvDEBA44bDiYZE4U13R7/fLXcFyL9CAEfnuMIL71hw=;
        b=PQEZQRBOc4XoTw51IOU55FZaUIfo/RdclexSU0rXtXrUSROUiZ0gNBhbp2dxZ10xkK
         zvXyen2Xrp+44Srvk1IqkSV7BCt3tZIXjjZZDBb7jaLZgP5mBO+YMvrmCXE40F0pY1jy
         yI0QPIZAMfxUjbTdAj5J22BaXi8DhoL1a6aHz6v+Q2eeLIFYOxRylvHICGAYww2WtZLD
         7LNG1stfKidlPYY/pKEHsakomEGGTCLl+3M2WHRfJyeJ1OmvFiB1dj0lMAXmE5nMF7cK
         HonKvfgQZlT9Am4dnQVdZvKc00dQZziOBZP+QVOpWg8UH6xlGYuykLNPU6HBHxzc9FFb
         JcPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771588394; x=1772193194;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FSvDEBA44bDiYZE4U13R7/fLXcFyL9CAEfnuMIL71hw=;
        b=xCk0F8XHqxlrIMYOoW2cYJo9Hte8tkJtABByosVgPTs0/e4cvmkHTTBgNrlpqiQeJA
         qDIes1CZYIq/gvHFXEnZ61jJAu5ZHSD70zmt0moHh9zVNMjQH6crj5RQeIRyFoyIv+qs
         YTF0IgSujHP6zkE6ykyj6/vGPJbC0lObSIP6CxT8r/hi+Zx8kIDRX/scwwRiVXfxsPwD
         JBl9gOc+7dxreuFLQ+yw1L51hCPHaVmIeXdgIHdzaWHckvdYiondsfK4Yi31gfKUczNm
         I9R/FZ3Upo0f5eHezDGh3J9ytyvjoVpLcndwI0Klm2v9by3tvgShLXBcaonToem49kVU
         kw5A==
X-Gm-Message-State: AOJu0Yw5wuk7fLDF8ACTh4PPqA+kmnudV4ZNYDrriBGx4nSOWKg6966D
	ZujSMOvxcz4E4P+ck+wIaKUtGoILbwWZ4bsrXRox4NF9zQPtc3qV/GWp4L127MpzBIJ0YKSVZvZ
	86+Awb2Zvg9WF/KKWLXK059SsfFShMbVhWA==
X-Gm-Gg: AZuq6aIVtGeS5mp1vbsoWGlyAEo1T2hmSjxBc3Leq+D0oFnOTPpHjZvz/M2BOPy4GlV
	h5gSgmIYmyI+gwLoZbo/jznoj63C6wS3KgLgq0wLP8s5lIpz1H5kB9SI83XJHaH0BMwOxhsUYYC
	hEQx1UQxb59v2I/SATxdTBqTd5/FnhBZcPXHTKz1IugTwoLZ1LPjUZSlLPh8MMVTVGlsfaHASXx
	K7JWhryPlZSsRP7ZZym5cEwSUWq+axHDJG+qTUZ2MGvuyDMBFqjPtf0RqjiRAFjOiLkdqJUN4DG
	NBCEDPrRZjqVBlJsFejLXSdnLzexJoRzvqqgPwKdsQtPc2MMDMQ6
X-Received: by 2002:a17:907:848:b0:b8e:fe3c:2255 with SMTP id
 a640c23a62f3a-b9072e22c9amr84054666b.5.1771588393937; Fri, 20 Feb 2026
 03:53:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <37d6e23b-a14f-470d-b97b-2466849fc4ce@localities.work> <CAPJdpdBYt-VTdjeZ-X8BeLNTuxSmKssacgZEin9jFjypEqkEUA@mail.gmail.com>
In-Reply-To: <CAPJdpdBYt-VTdjeZ-X8BeLNTuxSmKssacgZEin9jFjypEqkEUA@mail.gmail.com>
From: Paul Robert Marino <prmarino1@gmail.com>
Date: Fri, 20 Feb 2026 06:52:38 -0500
X-Gm-Features: AaiRm51E-30toulzaPLowo0JBrYth9XDdFkXub5iUB3dGQXd4z_siun9uqeYmO4
Message-ID: <CAPJdpdA=oSy=s0m+xNGjA1swMjiOcKU+ofm+4wuATr-Zb9jOCQ@mail.gmail.com>
Subject: Re: dummy net iface?
To: listy <listy@localities.work>
Cc: netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Let me clarify
If you enable ip_forward in sysctl then you can port forward from one
port to another on a dummy interface or to a port on another
interface.
Though that's unusual behavior, normally you would want to bind a
service to the dummy interface and port forward or route from a
physical interface to the dummy the service on the dummy interface so
if the physical interface goes down the service will keep listening
and traffic will resume after the physical interface is brought back
up without needing to restart the service.
However if you want to port forward on a non-routable interface to
prevent external network traffic from being able to connect to the
service then you would use a loopback interface instead because any IP
address assigned to a loopback interface becomes non-routable by
default. but note for port forwarding ip_forward will need to be
enabled in sysctl regardless if you want to forward from one port to
another. Also note you can't forward from a physical or dummy
interface to a loopback interface or vica versa.

On Fri, Feb 20, 2026 at 6:39=E2=80=AFAM Paul Robert Marino <prmarino1@gmail=
.com> wrote:
>
> Did you enable ip_forward in sysctl ?
>
> On Fri, Feb 20, 2026 at 6:09=E2=80=AFAM listy <listy@localities.work> wro=
te:
> >
> > Hi guys.
> >
> > 'dummy' network interface - I get that those are meant to be
> > kind of a sing/black-hole but... should such iface not
> > port-forward on itself? (as oppose to other ifaces, which it
> > does not I think)
> > So, I cannot get "normal" port-forward - firewalld with
> > nftables as per default in Fedora, which I try to do it with
> > - because it needs more tweaking for "dummy" ifaces _do_
> > port-forwarding or.. they do _not_ - do you know?
> >
> > many thanks, L.
> >
