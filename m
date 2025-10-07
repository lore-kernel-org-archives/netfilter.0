Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE9741FDE39
	for <netfilter@vger.kernel.org>; Tue,  7 Oct 2025 22:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759877138; cv=none; b=GUOV5Kpoe/i01Jci7iF3UBaJo59LJgdjxKAAdDE490czGza/xfIlq+i0neXNIsYHc2N/m82yGfqfTzlAnSojeU1u7Hpvllf40z80/cboc9/WF0uqo1pUCNAGN5OYS0TRTOTnAQjJKGxDISe89HkoVpUY7eBdP8z3XobKY10EYik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759877138; c=relaxed/simple;
	bh=2gnV7K7Z5zjDWWxk2NSd4Ib75O43KxpJwJIBi/d65eI=;
	h=Date:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=THISLRre9VuDdAs8vHT0CaMwKNLOGrIf5YuKzO/5/c0ZD09yInI/Fl9HbsQkhbHDrtZk1M/kZ60CFYPecwX+GL8yFHWOAkBFufqKVN3LqTtkIeWDrUWhZSIWiEmWnQNWwDRENBM09rI/2g/BEYALDjzgei8R8NGCTaTWWnpBkJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZHkeYfiA; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZHkeYfiA"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-8572d7b2457so40244485a.1
        for <netfilter@vger.kernel.org>; Tue, 07 Oct 2025 15:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759877135; x=1760481935; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=21WaKikB8izhOWh9C7dBki8FxOFmgGJ/j0W5esF18Us=;
        b=ZHkeYfiAsylqJ6JEGxmXUYDAz5IAFnCttK9ApkQ0p7yguazYVO2elFpj34CVBnsFbx
         Vg2rAMddZaYWdbSNMaN/mf61Vu1/vmzh5tJhoNQ//BLWxROpZaQnw8cegICyD6puqmz3
         Z0kKNw5H+f+S8DvJFsXoIJ60XlyATkV9DnDa8iQ1M/uD0KfS+OJ9MXW0zLsRqpPcPnz6
         hfyZHqil00R4k+cYxHhn9ikgXtWtmSHbAeeed4GQatFyowKi+bdAnVe0rk5VVne+/EgK
         vfYzXo269CyONKwL0te9xJgQAo21rByxPPYUNkk1Ow9U0YHgpWKls2fo1E4ivGsXfDP2
         Etqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759877135; x=1760481935;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=21WaKikB8izhOWh9C7dBki8FxOFmgGJ/j0W5esF18Us=;
        b=WQd4yq8DS/FXOLJqeZWBJyQbazsTRxXO18j6GrmbmcEblFrehqSw3OyMyC9FKCHaTe
         7rpOReR9lBajzqaSZ3Plmk2dpSDYlzoPdrIk++oWcLn0LVL50gnXb6hMMCVXRsnnM7gL
         p9FCY7el6WNSSn6lkLjl8p9xBh94rsGaiy+SwVTgk/4zuwSs/MLapu6NPewJnVcPK/Zz
         0QFLNt8pmzttjbPKURMgetp0q71RGIfKEOgq8F8HUqbECRQluAz74j/zbMIbC6dbV6M6
         fWRZGm7W4JBVYhUdH3DNEd2DHmAXDdLmjF8rZCv4wRDXut5rpR4NTSaf8hgn0cEAHL3/
         ZBaA==
X-Gm-Message-State: AOJu0YzUiYFyXyY8N51HYbICfvJgadB0Fk5TjtT5UfoFc9VD5eSf3dUw
	sSEF0Yayj3dxhHqJswW7FNKO/2TghaQzujoNqb6mui2Kj5jqbEKMQhUUv/XNcg==
X-Gm-Gg: ASbGncugAJfSoJ2wJHzvvOFcED1WGuyWCyQ4cGifHihUW78ytN5wWWM3dMpkNbx+N6B
	LvJeAScrhZSS8KEVjAtzYGHOyvnhQpQXeFV/pgF0iFcToxekhj0LAxqXCX6z9cVc/K5IjQUxECb
	ieuKDUrJwb6/tx+eVKQhPcsVTNrAZOnA6ieTyUI0Szy+By+qw7fX25+g9whLeCGS2OGLb0opYJs
	HdYNl50JREqZmq+Cjkga0nF0G7XRawx84Hn0+BZ945xMC/tO9GqcaV21QXgZi3Xnal6xVopdt85
	mR8D+n9ukoKu54B0nzGr3UveeTgyHt7tIxEXw1T2QPEUByb8IrRKDoLvjpCx7YqAtfabk6d8Nkq
	NRBUte54R+MThG9r8S5HbvmejmuKieR1HvwP5iWYb
X-Google-Smtp-Source: AGHT+IH5sfHgyaPl/BkeRRMtHHcJsi8Z3ENw/gAZ8tzW9y7RNh0riB5SkJ2f0DW60/j9+SRO0f2qXw==
X-Received: by 2002:a05:620a:d95:b0:857:22dd:fbc1 with SMTP id af79cd13be357-8836f55cc43mr150549185a.37.1759877135257;
        Tue, 07 Oct 2025 15:45:35 -0700 (PDT)
Received: from playground ([204.111.226.76])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-87771129491sm1689531385a.2.2025.10.07.15.45.34
        for <netfilter@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 15:45:35 -0700 (PDT)
Date: Tue, 7 Oct 2025 18:45:31 -0400
From: <imnozi@gmail.com>
Cc: netfilter@vger.kernel.org
Subject: Re: nf-ct-list and nf-exp-delete
Message-ID: <20251007184531.73f3404d@playground>
In-Reply-To: <aOT1NhYSS65KwwJD@calendula>
References: <20251007051508.049e8821@playground>
	<aOT1NhYSS65KwwJD@calendula>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 7 Oct 2025 13:10:46 +0200
Pablo Neira Ayuso <pablo@netfilter.org> wrote:

> On Tue, Oct 07, 2025 at 05:15:08AM -0400, imnozi@gmail.com wrote:
> > [iptables v1.8.7; old, but it's what I have.]
> > 
> > Why does 'nf-exp-delete -i [id]' *not* remove remove some conntrack entries even after being told to remove them multiple times? It deletes most entries for my purposes (if condition is met, delete conntrack entry and block the IP using ipset). Blocked IPs are DROPped on internet side, and RESET and REJECTed on the internal side. But from time to time, I see ESTABLISHED conns that don't get (can't be) deleted.
> 
> nf-exp-delete -i [id] ????

Given:
----
# nf-ct-list --tcp-state=ESTABLISHED --reply-src=10.X.X.2 -f details
tcp ESTABLISHED 188.132.249.148:57992 -> 204.111.X.X:443 10.X.X.2:443 <- 188.132.249.148:57992 mark 17488 
    id 0xf016f3da family inet refcnt 1 timeout 10m 17s <ASSURED,DNAT>
----

then:
----
nf-exp-delete -i 0xf016f3da
----
usually removes that entry from conntrack. In my experience, some entries are not, and cannot be, removed without drastic measures that would interrupt firewall operations.

N
