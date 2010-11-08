From: J Webster <jw.jwebster@googlemail.com>
Subject: Re: Delivery Status Notification (Failure)
Date: Mon, 08 Nov 2010 11:52:43 +0100
Message-ID: <4CD7D67B.9080206@googlemail.com>
References: <001636833518b9ca2e049488651a@google.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=YE1VNGtFk23WaBYfP2owAHx/exxNPJioKqBuwqsg/fw=;
        b=L3kvchI8CpVWlwxrPpQVqTZVvZvdBh/O0/FKBjoBsdUw6uGBiA+d5qUiicOrxCtpBa
         7HC8MAoqUKlsPKvwUn6dliODNeWsc6y09/0EQZLTR/HVKNkfnwMxTbGZusfAPzajJpJn
         yYddHBrGR2r/FEptE8HSYmrtmkJJ5g9YGKNLI=
In-Reply-To: <001636833518b9ca2e049488651a@google.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

I have a 100Mbps data centre connection.
I would like to limit users bandwidth to my server but only when it
becomes clogged.
It seems users report problems when the bandwidth gets above 7000kbits
per sec
I think this is caused by useres downloading many files rather than
streaming video.
I think 2000kbits per sec should be enough for streaming video so is
there a way to throttle this and share it equally between users anytime
the overall connection gets above 70000?

