Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A4D1386DA
	for <netfilter@vger.kernel.org>; Wed, 12 Mar 2025 18:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741804231; cv=none; b=IBWpGY1HYSGY4Eu+y71GiOt7NcSw+0EFlx0KY5FnB/QVM3HlB+asOnZEaz78j11ARq5tf3XliDAprmBPeKDp8Vq/9yEHkncqUXomvZ4Dd4r6UxwVLi7vawJGzpBWR6kU7LTlg3PVm6pARne/j78V0IQguBGwq1uvaBxPUn77+n4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741804231; c=relaxed/simple;
	bh=dnBjRP25fDWTHaXS6GvoUjyWPwAFPjbKZ5wIwcxvGHc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ff7chyBrYToZP3IMxndwT/shZqBfnY4TnDcuu6u1+XJb2KskPGIXnc2Fdte8qGS5clL1PQ+dOEuM5Tc9rVVJscJkcznmDKyBUGHAUmJpqdppiX0Eb+jdrS++44uggKwy6/YzXYaYOCO4FkQqtFkU2UPwFtIwaMnrkmxBBdHBIbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZJ9tJKR8; arc=none smtp.client-ip=209.85.166.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZJ9tJKR8"
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-3d46693a5e9so720325ab.3
        for <netfilter@vger.kernel.org>; Wed, 12 Mar 2025 11:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741804229; x=1742409029; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dnBjRP25fDWTHaXS6GvoUjyWPwAFPjbKZ5wIwcxvGHc=;
        b=ZJ9tJKR88WOxCVXc/vpWMc4Nbv+kpw/zZbaX6wozUfJd3CD/EmtCLvsc1Fu+0c0Hty
         7WCp7pWmtN2wB5FdFS+dgXSD/+1ha0J/rYQ2yWY6XCAyMIm48CVyUjOK4qipVaalHx71
         S/7cHjix8klG8V5//gjWlq5ZvTdgfd2sHXZ0/2b9WfAL/UMimeif8FeM9ju5/+wf10A/
         RhnJX7ZWY0jm7VRk/O82m+uC22Lda4NwFJhhUkgdJSPw4wib4QU9qD9fNd2qP/R4lXZf
         ZLsvqTH0U/Qh+dN6MNUT9hGGexJJOXHBFs/2pUWrqgPiXSKM0qAE1cHx4baNcydzvhRl
         FJXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741804229; x=1742409029;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dnBjRP25fDWTHaXS6GvoUjyWPwAFPjbKZ5wIwcxvGHc=;
        b=m9ciuhW/jeHRL8iWMOO7uHzHWFWTTxN56tpmniNTZpVQW7fbaXPl/q3odsbcGTHpmq
         jVQnPP2BrR2oREbsZ+hpI49elmPE+VRZXQspSpx74TjlxTsssnivIhx0328/WBhFcemw
         v35P0T9KVSy6BP8/YylUPoMvDsALB/wDvn84P/r3fknlNuCvKqaNvQ3Pr27ARrSJ+E07
         NBNwpsUkOHRs0rLTyEXHp6Az0OCax9yeSv6Oto7NgUKc870L9WiGedGAgtL1V1FHC23y
         eDK13BfIIOxXzZEdOuFJQS3uOoO+t+H972WryE1zAsW8T2WmCrPEZk0rYHeXiSXTNb56
         aVeA==
X-Gm-Message-State: AOJu0YxsPwqI7F82ECFdQw0pGVEtD5k4FiMNFC6GWlUAop4zZCXDDJET
	3dQR7qoo1V3gAxNIk9Jmrdm3LOEMLU6bn8/gqw3OOonKp0w9XkTxGUvMJ7bKcDJSKZZSLoHep5Z
	YbUIOuxiOFBHiJmrNSG6CXb+WIDzj7E7v
X-Gm-Gg: ASbGncvM0PQEWm2qqHft8BYYxZNZPKOMLjK4UaBaW2QPeeubQQVuhE6RSE1NqNLS4DL
	1HTokiwFoxoRZL/NiYmnN8lWyJjhy28onZl+QLDYFDR/uU2WVtPpo5jTPfaKv2zBSQVH8YR2o6g
	wXXx1GpvIwh2tQgDGBvpgLwuo=
X-Google-Smtp-Source: AGHT+IH4zDVMYeiRkVx2FxtBJhCWXOT4o01JC97QGE+CfZVg4xl7Be3IrfW/5wBS5uWhU0/5r5y2ojxpBSiGB27C+4w=
X-Received: by 2002:a92:1901:0:b0:3d4:6e2f:b493 with SMTP id
 e9e14a558f8ab-3d46e2fb819mr45006665ab.11.1741804229364; Wed, 12 Mar 2025
 11:30:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CABhP=tYOynShd82rwVuDMJDTE8LcM6+FHwx7Tfuk183EW+ipPA@mail.gmail.com>
 <20250312161324.GB28069@breakpoint.cc> <CABhP=ta1mct0M37VvT5_HA-oQdJ5s8LCRL4AF=Mb=TzZS=0F0Q@mail.gmail.com>
 <20250312182021.GA3007@breakpoint.cc>
In-Reply-To: <20250312182021.GA3007@breakpoint.cc>
From: Antonio Ojea <antonio.ojea.garcia@gmail.com>
Date: Wed, 12 Mar 2025 19:29:49 +0100
X-Gm-Features: AQ5f1JqPUpwS8tn5j1OHhWiDy7pKMCTUK612smJdMkEXv_QvPLJ77vGNLQm2oCw
Message-ID: <CABhP=tbbS3S=yCViCq82RcG3bYt6=C4i9i7pn-w6nZCzjpyKuA@mail.gmail.com>
Subject: Re: netfilter expected behavior for established connections
To: Florian Westphal <fw@strlen.de>
Cc: netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 12 Mar 2025 at 19:20, Florian Westphal <fw@strlen.de> wrote:
>
> Antonio Ojea <antonio.ojea.garcia@gmail.com> wrote:
> > heh, I got bitten for that too, that is why I have
> >
> > echo PING >&3 && read line <&3
> >
> > the moment that you read it from the fd, it does not come back to the
> > socket and you break the loop.
>
> AFAIU the read could happen before socat managed to read from
> the pipe (so nothing is sent over network).
>
> Or there could have been several writes over the network,
> not just 'exactly one write'.

I tcpdumped to verify the behavior, but let me work on it and use a
different approach that is not so racy and random, I just wanted to
validate my assumption on the expected behavior
