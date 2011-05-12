From: "\"Oleg A. Arkhangelsky\"" <sysoleg@yandex.ru>
Subject: Re: conntrack does not display bytes and packets
Date: Thu, 12 May 2011 10:53:08 +0400
Message-ID: <508221305183189@web62.yandex.ru>
References: <163899.90731.qm@web113310.mail.gq1.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1305183189; bh=Ko1ZCEyXi1+oVB/j5cV4+e4fC7+yyqX9Bwspzd+NPNg=;
	h=From:To:Cc:In-Reply-To:References:Subject:MIME-Version:Message-Id:
	 Date:Content-Transfer-Encoding:Content-Type;
	b=DOfRlVjtvDubASpZzeHXhvks4i4aHg+Zf9/MzWKocyEGzuJKZeuUssMXhvUxnkfwS
	 k6oaFh0K+l+LnXMAuiWCIcwUsgeKEic+6xLsZ2t+Lu5odOaj9nW4PQwmIlybjeheNA
	 uFLgWJs8O5JoNc/X9OhA/9dy4ybx7YNHdgmkOb9g=
In-Reply-To: <163899.90731.qm@web113310.mail.gq1.yahoo.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Vieri <rentorbuy@yahoo.com>
Cc: netfilter@vger.kernel.org



12.05.2011, 10:49, "Vieri" <rentorbuy@yahoo.com>:
> Hi,
>
> Since I updated my kernel to 2.6.36 and 2.6.37, /proc/net/nf_conntrack and conntrack -L do NOT show "packets" and "bytes" even for ASSURED / REPLIED connections.
>
> It seems that both of these data (bytes and packets) have disappeared from conntrack/netfilter.
>

I think you should set net.netfilter.nf_conntrack_acct=1 to enable conntrack accounting.

-- 
wbr, Oleg.
