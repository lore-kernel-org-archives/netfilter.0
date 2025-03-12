Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 987FF156C62
	for <netfilter@vger.kernel.org>; Wed, 12 Mar 2025 18:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741802586; cv=none; b=s0FWGI+3ym6R238eUT6Qf1U0GX+gnpHsTskIKB9gk9AgAiReY7a9jOt4eF7rrgBGyPrilE77ZYy/icfTNxTrz2YhGg0ioyDmjL0UqFnn7aRoZ5wL/KnxcucDV3b5kdKdGHulrBoSTLPJNO3i5Y5erLJAweuZv0kqqBdQn015zZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741802586; c=relaxed/simple;
	bh=D58rwvSsveCMjce9qsI+fjk4c630RddW2DutBE1V6sw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tUZjwiopDf7/WlNA9aL5OOQLIp9ob3klhixmQgfOOrdyH3AIb5aOCb6y048MqHNhpqkEpJ8ljwhkCNWTC06FkIZvAGCb5WeF6dVkCi2n4tycOq4g9zHwWy7EJ3eGz13+5qNCoO6jVnhESgLstEcXNVmnrDLTGWu8HiDOOmuIoYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TkM/isv6; arc=none smtp.client-ip=209.85.166.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TkM/isv6"
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-3d434c84b7eso564585ab.1
        for <netfilter@vger.kernel.org>; Wed, 12 Mar 2025 11:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741802583; x=1742407383; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=D58rwvSsveCMjce9qsI+fjk4c630RddW2DutBE1V6sw=;
        b=TkM/isv6QGHiTMIxT+SFm8K0I0+55vWHPMvJIAU5/nKL8A2/XNLg2SiHt/DU0GayqQ
         hLHPumdiMnHqobGsZp3I8LRk7S/ybYMjKgT9OE/CMMuXCZM5vn7+NrKSMCdlmGM7sMgW
         WHEubxr4/5GWcN2qMjEfWrOTaIhO/XmkqA7Oku5OTjUhkR1QxnrlXofG8rXOdy92Oi3f
         0E2XINdEYXMvHCsLHf7NqgQciq4J2sWhJv6WmRUrJ3S/+p2CSLDdct9cdP7vGWy3q39w
         Tj0FgbWv/jhxPsLUTlJYBtI2Ysw5Ndng32qw4DQFRxUVDW8JX+wd077LtPte3GIcG1vO
         Dv5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741802583; x=1742407383;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D58rwvSsveCMjce9qsI+fjk4c630RddW2DutBE1V6sw=;
        b=ROGMGHcUUuGFY/h45fMG3z/Xe9VWzb/WeqqxUWb3NPGKYGhCgszClqlf4NEojjwYFD
         kWTYXvXuQTfXYwqraDFOp49xGeTa+OA7ERRqKCZYyoQCpm3Y8mcAl3Uw7wF5XdRlMSy8
         Y76IHbA0qqbskOOBMXf7a2BjXhRU1howaoGEUxtkj8DLSWd9Nr6zoneEnC7yEullQ87V
         nM+M37EXo4eRXHB2ubtCtMdqIpKkVnbb1zraIqXAW8VWnMdtZwpiuapnDNKN5+ZR0O4w
         He2R8RJUQsgKwxsi8za96JZKoutDF3mfYpHNiX5PeZrRd4Cv+1zUmEPjfLOWzIopCdUr
         3Irw==
X-Gm-Message-State: AOJu0YwRq0B94nqzgeYgYqTlAK8G4b7KMV9VYP0tCG0dWwLjyzCIDQbV
	ArELMq1Smp1auHditJaZZ45YXGDd5IJg9jjHwe6Fz7Z4GHEMYglGA6P5GjdwCqBCaZ8qUsOhq1Q
	pLso37fvK0zxGgNNCfGzal1fmLvU=
X-Gm-Gg: ASbGncuFU5hkuUWoFXmErRuvpFlafXP4bJVfrSAsyEtrVHgSMmK0GHe7D0dxSykr/Yg
	I1/lnR0GrdmkWC3X3HLXiy6slS90v4eVDzAhDnMUDR9RvESUAe/I0GQdRBxEsE2ZqJrzh7lnS2a
	Y1m0jc2sRawrK7N86x/nSdtveAWmjfByL4nA==
X-Google-Smtp-Source: AGHT+IF53BZyl+Y/S+JLKJygXiL+vNsGiAIE23+M6YST4XK5N81wSxLUjv+2ygC4PqVD60Smgj1Z4FMn9AIMEcNXgto=
X-Received: by 2002:a05:6e02:1d85:b0:3cf:c773:6992 with SMTP id
 e9e14a558f8ab-3d468921f4amr106597235ab.12.1741802583608; Wed, 12 Mar 2025
 11:03:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CABhP=tYOynShd82rwVuDMJDTE8LcM6+FHwx7Tfuk183EW+ipPA@mail.gmail.com>
 <20250312161324.GB28069@breakpoint.cc>
In-Reply-To: <20250312161324.GB28069@breakpoint.cc>
From: Antonio Ojea <antonio.ojea.garcia@gmail.com>
Date: Wed, 12 Mar 2025 19:02:26 +0100
X-Gm-Features: AQ5f1JoEP_84ng9iPBQXs4DD-_3kQkmY_1CQ1hJxZ8tlZ7cgUdeEwVbtpwJoBio
Message-ID: <CABhP=ta1mct0M37VvT5_HA-oQdJ5s8LCRL4AF=Mb=TzZS=0F0Q@mail.gmail.com>
Subject: Re: netfilter expected behavior for established connections
To: Florian Westphal <fw@strlen.de>
Cc: netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Are you sure this script works as intended?
>
> Doing:
> socat tcp-listen:12345,fork PIPE &
>
> socat PIPE:P tcp:127.0.0.1:12345 &
>
> echo foo > P
>
> ... causes endless traffic, since listener echoes
> P back, that gets written to P, socat reads from it,
> eches foo to server, that sends to client, ...
>

heh, I got bitten for that too, that is why I have

echo PING >&3 && read line <&3

the moment that you read it from the fd, it does not come back to the
socket and you break the loop.
I like this approach because it guarantees the packet traverse the
network , but I think we can make it unidirectionally and just dump
the other side in a
It is surprisingly more complex than I thought to create a persistent
connection that you can reuse in the test..
Let me try to find a simpler way
