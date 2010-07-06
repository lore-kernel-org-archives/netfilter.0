From: Wade Gasior <wadegasior@gmail.com>
Subject: Re: Redirecting a Pre-existing SSH Session
Date: Tue, 6 Jul 2010 10:34:20 -0400
Message-ID: <AANLkTikPeHVRj9sHH8pHD6PUdnluv1VkrsRhTtOkqIw1@mail.gmail.com>
References: <AANLkTil-BzqRmzGX951pWLLkVqeO8Y_vwywQOD8z2Drj@mail.gmail.com>
	<alpine.LSU.2.01.1007061331300.11025@obet.zrqbmnf.qr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type;
        bh=7mGBS2K1i2ejNJicHJYn/QJeLu2M/cNbRzkD6VAcIFM=;
        b=pOBW86JMlennfkBjXIdvGTy6li2/bvCNZLinJf3VpWC+ZUgpOb+f8OP18HvzuDRM0s
         z0GsJ2Odndzrs8g2JpenN9kEmI8a3oU3SeqUr6jTEK2CyjcInZrRUXh/pb0WCnJDPXHS
         p7mxyOTWX0uZ5lCFt4ydokE3/K42pUQPa0x1U=
In-Reply-To: <alpine.LSU.2.01.1007061331300.11025@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org

Thank you for the clarification. Are there any resources that you
could point me towards that might help me to accomplish what I
outlined?

On Tue, Jul 6, 2010 at 7:31 AM, Jan Engelhardt <jengelh@medozas.de> wrote:
>
> On Tuesday 2010-07-06 13:28, Wade Gasior wrote:
>
>>At a point in time, I want to forward all incoming traffic to be
>>served by .160 instead.
>>I have accomplished this using these commands (on .150):
>>
>>iptables -t nat -A PREROUTING -j DNAT --to 192.168.1.160
>>iptables -t nat -I POSTROUTING -j MASQUERADE
>
> That isn't forwarding, it's address rewriting.
>
>
