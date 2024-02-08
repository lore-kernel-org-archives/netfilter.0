Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91BB47CF31
	for <netfilter@vger.kernel.org>; Thu,  8 Feb 2024 16:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707408002; cv=none; b=PEnjYEKvq53ZDecoxICaSrA1kiBOMMF0Ixw8kIi/6L8iJvr1+7OLxti8A6YgL1As0UDm+VhszFwUOPFZ5zQG21+9ZFDawGq7plpFDAeDylKjqZAgrJWse1I5TF4LDwBOVmtPOQaDoQ3Xn011oJ7aewXy1x+36q1cKrWS5/sSe9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707408002; c=relaxed/simple;
	bh=FrK+Vcjo+ISKrNKENKQTlpsdVUfaVAcnEuu3ZIsrDBM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z4olxFyfIWNF33BZodPldHvMcLozXsh1xcfTbc/g1aE+2aRFxzpbhBHP45Fxt3dlAFBdtQnIbCnSYkZoF1AUx2KN2zdjpvaPj0AyPCDTDT4jbFfwUsOYoW3wXn0QnBe2Z2Ai0OI5VMs4k3LtJXNMUW0s9YfiarXTV8Qh4ezfV38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JeE4bEjP; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JeE4bEjP"
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-dc6d9a8815fso2058739276.3
        for <netfilter@vger.kernel.org>; Thu, 08 Feb 2024 08:00:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707407999; x=1708012799; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zv0Oyw+Z4vz3MA9LzK/BL3C0iDO3dhIsNB65ulixuZo=;
        b=JeE4bEjPi5SJNPUhB8lh+1X0dKWql/VaB5ECD+t4bq2Ougf/IcYksdLNKPORn7fGkc
         HF+NQsjsOpC9uzoy4jFOwWKhTMb1RC8LexemDuiB7Yc+4xghdRjQk3LeBFhEJOKFH5g2
         ccsOFzSSBRPzDMQx9VOz/I4Qm883WV2fztPCBLMNAZDViRRVe61mnHXTBvPXSnQ3M7Sc
         UGNrqsKlQdS43YoPsWajdDn/VHuAjI8HKYn5/6STHGz9AM7IFDtQuyk0p0mrqGp4d0W8
         OLxhhffiyz8lmLB0QnvPXsbtS5v69WRzezwzF15BKdtJwelMWkDuaXS2/W+TFxFiZiO+
         YCyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707407999; x=1708012799;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zv0Oyw+Z4vz3MA9LzK/BL3C0iDO3dhIsNB65ulixuZo=;
        b=akFdnNs43j2+JyeqrywA3Zx/R+6WirIbJrHbViOWo1UwBjQHX/pI/CwYZqIKjDVTtn
         hmX33bM/IZxry0NtKIoINcFDM2PSi+KRMUNipkLR16YABE+XoVGO8Uvye5QLdqDxoWd3
         RNZQh6m6hmzGH9bvNV561DtNXccxskA15nKYYm7VGBqW9AqJtQy6qq7qYN3uKhqHqwRi
         kYx06WJdNB1nSX/YG1/BXxRNQ3UjxvzEKvKC9Hmpr89LZ874yj0MTYveRzVd2Fdm6Hbv
         Q7S/hry2HkyTziDpxJ/omeEGuNDqqThay8qGfszsDZM/b8mKpgn0yxeCdcU+WHB3O0x7
         CpTA==
X-Gm-Message-State: AOJu0YyPHABe3YVZwkocu3PuwHOnYiXWj2Th89fzvDc8QP85h5KhpgpM
	AatNB6cZCSGqns9SZ9s5fj8JVoUMCqZebRCvMaXrjBWbr9A/Fw7wwAtac1rJb5S89KOWAD3FUcc
	1tUcJ5e2SAQFsG/lgEBBGbYp2BZs=
X-Google-Smtp-Source: AGHT+IGuvFdAk7XlGTTUH4iRI3Ir7VJzSqi9UF+A+Rs0moXdRNOUTeI4vO2sPkm9KYTD7xziVpUx6sEAEVc9UOTVaZ8=
X-Received: by 2002:a25:83c6:0:b0:dc6:ba6d:7404 with SMTP id
 v6-20020a2583c6000000b00dc6ba6d7404mr8455235ybm.37.1707407999297; Thu, 08 Feb
 2024 07:59:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240208162047.0a4c7007c908cbc38d5357a2@posteo.net>
In-Reply-To: <20240208162047.0a4c7007c908cbc38d5357a2@posteo.net>
From: Anton <anton.khazan@gmail.com>
Date: Thu, 8 Feb 2024 17:59:43 +0200
Message-ID: <CAJE3=wmZAELgnQQne+tAY+5UTiOpPFO9sJ+GBbpYB=8nkUChRw@mail.gmail.com>
Subject: Re: Are there nft set limits?
To: "Xavier B." <somenxavier@posteo.net>
Cc: netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

It might be included in one of the intervals, which is why grep doesn't see=
 it.
Try this:

nft get element inet my_table badips { 198.199.104.80 }


On Thu, Feb 8, 2024 at 5:22=E2=80=AFPM Xavier B. <somenxavier@posteo.net> w=
rote:
>
> Hi,
>
> I have an artix instance with nfttables there. I have several rules (atta=
ched file) but mainly I have a set of ip addresses I want to ban:
>
> table inet my_table {
>
>    set badips {
>        type ipv4_addr
>        flags interval
>        auto-merge
>        elements =3D {1.0.147.18 }
>    }
>
> chain my_input {
>                 ...
>                 ip saddr @badips drop comment "[nftables] Block ban IP"
>                 ...
>         }
> ...
> }
>
> Until now, when I add some new IP to my badips set, everything is fine, b=
ut today is not:
>
> # nft add element inet my_table badips { 198.199.104.80 }
> # nft list ruleset | grep 198.199.104.80
> #
>
> As you can see "nft list ruleset | grep 198.199.104.80" produces no outpu=
t, which means that this IP is not added in badips set.
>
> So, I suspect nft has a theoric limit size of number of elements of a set=
. Is it true? Or not? If it is, what limit is that?
>
> Thanks in advance,
> Xavier
