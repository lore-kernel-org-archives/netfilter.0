From: Jimmy Thrasibule <thrasibule.jimmy@gmail.com>
Subject: Re: Strange behavior with ipset not matching on public range
Date: Tue, 28 May 2013 15:30:04 +0200
Message-ID: <1369747804.5217.2.camel@BEWS005.euractiv.com>
References: <1369662135.4058.24.camel@BEWS005.euractiv.com>
	  <alpine.DEB.2.00.1305271548390.11760@blackhole.kfki.hu>
	 <1369665896.4058.29.camel@BEWS005.euractiv.com>
	 <alpine.DEB.2.00.1305272011390.13657@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-type:x-mailer:mime-version:content-transfer-encoding;
        bh=VnBEUK7uvUvCzgYxHjUkYxkvUrNDFWchJQlQwfmfH1U=;
        b=xts+ivrwJObibMJl9O4GmKK1V8hRVJmSHJE470HSMyeK6QGHz/3mb60aloF13HJZbZ
         8TGwUlb241nUl/diqder1EE8ZOpDpoHqs/6d9K/lGv02cshZiDtWIKpN0vqEZtDQWUt2
         QOrAZNXqaKm6PSfUH9wC/7bjomJyhsHDVMtIYIyU0gHleCB8+pFw2H3WcVreuDoH2NwO
         hzeGyf1pLOj0OgTYfiZIvO9T6Vq90RF9VjMRWON8J/4eDHVQkZkFfCxRvkB+irdqBTeB
         ITDztyFMZsxYRW78gMuWwBYelMJmpJhbNJ+wrrS89wQgTW1Ez6A/NkMdTuiZcVFFrQfD
         enAA==
In-Reply-To: <alpine.DEB.2.00.1305272011390.13657@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@vger.kernel.org


> 
> I think you should upgrade: some drivers doesn't zero pad interface names 
> and than can fool ipset up to 6.12.1. It was fixed in 6.13.

Looking at the changelog, it looks like 6.13 is fixing an issue which
can be the one I encounter. Do you have a link to this commit or a
commit hash so I can report the bug to the Debian team?

--
Jimmy



