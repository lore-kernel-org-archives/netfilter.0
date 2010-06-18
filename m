From: Steve Fink <sphink@gmail.com>
Subject: Re: match many protocol in a rule
Date: Thu, 17 Jun 2010 23:27:43 -0700
Message-ID: <AANLkTikvTa8WAC9FMbLsaXVKlXZNT0OUWhDeC6-fs-zO@mail.gmail.com>
References: <AANLkTinVb4YBnyfJJN6JFA4U9TDDonG2Drmtz-yjMIOV@mail.gmail.com>
	<AANLkTilErsiq8IUBxUUUq-EhS6KUQUEs6KNHKVD4UPCH@mail.gmail.com>
	<4C1AD332.90603@riverviewtech.net>
	<AANLkTinQfTvUhhbwcutlXNql0gzpi1jDJjjkRVLCU0f_@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type;
        bh=dLbsTSnFpgAg+8d/UmhVH3sOu2yDbiROEt0lSXg8hO4=;
        b=oDyA4AaFoKhNp6uXXTx4SauDm2PhD4Ct4usbyylgzPunZe8oqCoefoavz2ifsIzyPa
         X3Ajy3QsHBnrY6RmC3EU1isosGGmUShu3yJqOg0P0cGviSL4ai2RuCE9mTe0YpXA22hs
         Sbv5SK0y3LRoPT0wfrEzj8AXn2SebiCTudHqc=
In-Reply-To: <AANLkTinQfTvUhhbwcutlXNql0gzpi1jDJjjkRVLCU0f_@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Curby <curby@cur.by>
Cc: Grant Taylor <gtaylor@riverviewtech.net>, Mail List - Netfilter <netfilter@vger.kernel.org>

For tcp/53 + udp/53: TCP and UDP have the port at the same offset. You
could use a 'u32' (or 'string') match using the offset of the port
field. (The source port is the 16 bits just after the IP header; the
destination port is the next 32 bits.) You'd also have to match the
two protocols numerically.

Just sayin'.
