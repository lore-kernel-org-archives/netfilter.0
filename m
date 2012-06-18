From: =?windows-1252?Q?Nejc_=8Akoberne?= <nejc@skoberne.net>
Subject: Source port translation only
Date: Tue, 19 Jun 2012 00:28:11 +0200
Message-ID: <4FDFAB7B.9060002@skoberne.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=skoberne.net; s=google;
        h=message-id:date:from:user-agent:mime-version:to:subject
         :content-type:content-transfer-encoding;
        bh=qVG/JCeSEaDPrlR+PaJPRSyj/TZ5q4gwr5u06xRTrhU=;
        b=GN5wUm+oimpyyP5DDxQwCr0f8sqVtL4snO6hnxxteLYxmlLorJDMLC/UWyMP9lIJyV
         2sUglwwp6nABSwvt+So5NqdE/xXTTcIxlgEAe5TY3tmP9nX42407lNody/i4+VAkC6w2
         TEAy5ACWYdai8YAvPULdv1kHHLTkTXGDe7Ug4=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi,

I want to do (stateful) source port translation (restriction actually) 
on my outgoing packets, but no source address translation. And I want to 
do it for IPv6.

So if there is a TCP packet like this:

SRC ADDR: 2001:db8::10
DST ADDR: 2001:c0de:
SRC PORT: 53523
DST PORT: 80

I want to translate it so that the source port falls into a specific 
port range, say [1024:2047]:

SRC ADDR: 2001:db8::10
DST ADDR: 2001:c0de:
SRC PORT: 1500
DST PORT: 80

If the source port is already in the requested port range, no 
translation is needed (but the state has to be kept anyway).

Is this possible to do with netfilter? If not, does anybody know for any 
other (simple) way to do it?

Thanks,
Nejc
