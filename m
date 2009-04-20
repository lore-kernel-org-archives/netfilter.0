From: "Paddie O'Brien" <paddieobrien@gmail.com>
Subject: Re: conntrack -E problem
Date: Mon, 20 Apr 2009 17:15:16 +0100
Message-ID: <3e67fcb10904200915y6d2cdf0dw9c634d7fc31b1a6d@mail.gmail.com>
References: <3e67fcb10904200801g76ccdea8jde758f5f5c3a6276@mail.gmail.com>
	 <49EC92AB.6060807@freemail.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=CUSd0BDlMPeRUuOjuSB3fZ29LPzy1dUQ9NovAuV6/SQ=;
        b=uQkedgZIAp9+scMj9oKwBVljweRdvJwljeC6mRXvET6EHnElQjD09a0bflbpxa9rqo
         dLDEvKvLtfKzkA75zk9R4CPWitmwYTTPL9bmX+S4GIDaZuXap1WgDKsxovrRPIpwK+wd
         PIt4ciPDnAaYKy/9ykGyjeCEwokyJs0iVJilE=
In-Reply-To: <49EC92AB.6060807@freemail.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: =?ISO-8859-1?B?R+FzcOFyIExham9z?= <swifty@freemail.hu>
Cc: netfilter@vger.kernel.org

> Just a question:
> Why would you track unsuccessful connections?
> If a connection ATTEMPT is unsuccessful then there is no CONNECTION -> so
> there is nothing to track about....

I want to know who on our wireless network at work
is attempting to connect to my machine.

My (shaky) understanding was that with conntrack I would
get a NEW event for any inbound first packet irrespective
of whether it led to the creation of an ESTABLISHED
connection or not.

> Or am I wrong??? :D
