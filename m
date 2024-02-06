Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E0A21EA7D
	for <netfilter@vger.kernel.org>; Tue,  6 Feb 2024 10:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707216455; cv=none; b=KV8IiFaIv9dP6HUbI8Bsw/gSy9jN1qF+jffQDYjWKDckofnni9dJReOP6aawvfhgTM2UE6rGOPQHVwucfVAMret66O6DXpYlxIDOR739OOZFh8CXeujBCswu1+znIbIY/T+YjyYyEuR0IkMBRMPx4Bh29/dlbjwkK+2q7KP964U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707216455; c=relaxed/simple;
	bh=fHTVRqbUZTMRJ9omj0OoKAUp1y7iG3mtC/PW7xPID2g=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=uwyE5vHMCg+0q0Jop8AlvpFOEZvhQ59nlH58DFtcH2dWRfC4fv0cw4R307JXORkKxOzCJlvQ6oKOtOzdHhcRsZvsyaFRu8ZL/gxa4ju2wqBiP7jsrfo5RyBmhe2eHre1egsgQ2X4/Li+jYIOXkWGNExXJnkyVuo8sBqBYPL3C8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j0SdPX25; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j0SdPX25"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-60481aa5ae0so2067677b3.3
        for <netfilter@vger.kernel.org>; Tue, 06 Feb 2024 02:47:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707216453; x=1707821253; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fHTVRqbUZTMRJ9omj0OoKAUp1y7iG3mtC/PW7xPID2g=;
        b=j0SdPX25JgC6GQqojGW7DmvpCGndcZzkCrTgVuuHtuWqC4+Ac1broTk81ccXn3z8Xh
         CLjs7sPjBww+lTdhjFICAFFy28jsqyRAnd0wi3mY2NKxEG9VneibXCyTvLDfKDnJEChn
         IUBMkJdj+C2hb0+jakkCwGctQ8d8ALyJm+YErs8nrmuBt6Im0xSe5y7+N3M8wBFwIb7N
         hLw9CxJb7RrQvzYOVf/9JDiIwNECHGNKKLNGlBnfn6JKy7rs5Au7uW/z37nN/b9ulkAj
         OZUIT4mlhKbE3fpqy8Vk+TpGHqJN8x4VNDlFvUV6IYsKJwwN32Tn3514kxi2C1LPlR3N
         A3Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707216453; x=1707821253;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fHTVRqbUZTMRJ9omj0OoKAUp1y7iG3mtC/PW7xPID2g=;
        b=ZqwsOD1l6f+jfZNs2hTWcBGIrMameSQsqdzEMcKTIvrXvdaXvL6Ok9Od/PcHAI/Hws
         1sMiaI9NfllKvuGLlkHHofNWrNsotPgIAoDvRuy9ZWQTwdRMYNROG0UhaRUMMWeGOGHF
         IMs86Nz1hpoz4zmExzKoRJQl5x0jBeXvgZGR3C7EIRdOfinhLt/iF2mR/JxL4ZYt6lYg
         2FLJ8cy3+wwl0L3VoUK9mjIzEZHA0Quaxz0FJUBaC34hMPLWQSGkFYD+mmM0OC4gRJBS
         0UJ2rIyBxWHl60KVvHCAxSPWsD7Obc7Sxkm445Ed8P0RISJjCr7fbl8vf51lkJvkOBPF
         Skkg==
X-Gm-Message-State: AOJu0Yyj5rSBVqA0hbq28nryNhkUFWZweUmWkxUBD1CKv1ziIuHkLn76
	l1lBmwjiBkfvHNhUbEg//PgPPWpAKCO17opWkP9Qq99BYUKbZV3oHp9heCYlfPK5+Z/hO7nz0aB
	AJxOwQTxhbqZFlcNkqI8SiTAVtHanpJOt
X-Google-Smtp-Source: AGHT+IG6+EJYoRU1NpXeBX5LQ6sEoKuPRGuoSNtB8lglgxGncG7yLfTl46Y/Ouy3CpZj3LNM7sAtBAR98a9JfOpH5FE=
X-Received: by 2002:a81:b24a:0:b0:5e8:995f:6a0f with SMTP id
 q71-20020a81b24a000000b005e8995f6a0fmr1237638ywh.13.1707216452869; Tue, 06
 Feb 2024 02:47:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Anton <anton.khazan@gmail.com>
Date: Tue, 6 Feb 2024 12:47:19 +0200
Message-ID: <CAJE3=wmUcJ0E8nobG=T084XkiEK9UUgR4kyfLHk2enZOunH_1A@mail.gmail.com>
Subject: What happens if the machine runs out of memory while adding new
 nftables sets atomically?
To: netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi folks,

While experimenting with adding nftables sets on memory-constrained
devices, I have run into OOM conditions. Currently many embedded
devices such as routers are balancing on the verge of not enough
memory if using nft sets (at least interval sets).

I know that there has been progress on the front of reducing memory
footprint, but it's not yet in the nftables versions supplied by the
distributions, so for now I have to work with the current state of
things.

To be on the safe side, currently my scripts add sets separately from
adding rules and removing sets. I'd like to ask the devs, is it safe
under these conditions to attempt performing all these actions in one
atomic operation? Is previous firewall configuration guaranteed to be
successfully restored if the operation runs into OOM?
