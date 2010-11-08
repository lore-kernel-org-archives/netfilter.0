From: J Webster <jw.jwebster@googlemail.com>
Subject: limit bandwidth equally
Date: Mon, 08 Nov 2010 11:56:02 +0100
Message-ID: <4CD7D742.2040702@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:subject:content-type
         :content-transfer-encoding;
        bh=YE1VNGtFk23WaBYfP2owAHx/exxNPJioKqBuwqsg/fw=;
        b=lrUOWj6GBkA/i3WZ4z811C8QD69qCBJSNW6yl0rO3IQTOaV422/+w7/ikAAopYgnkx
         n3Lg1dy8s16ZMmHs7WGVWwiR82RJdq4dINDR9dE3fkhBpD8+CgzffCfjGH6SKvzWGnn4
         n8upfxuTlALse0aeFFmYP3laaYRh/4jiiGlGQ=
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
