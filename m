From: "sami ahokas" <sami.m.ahokas@gmail.com>
Subject: Memory leak in netfilter?
Date: Tue, 29 Jan 2008 09:51:25 +0200
Message-ID: <f04ec2cb0801282351p1da0ca69u6e5c405f2d2566f8@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
        bh=MHISzpmZO2SfcMgVoe2J5kYFuZETChuzaH6Ap9G2weE=;
        b=Gs283ZsXp/BChMQXcLdc3CuIrBMnZSv4+1UzDwpagww42X4Y677ZP0FYFJZvcwPdsJAnXZUiF9LmKa9Y0HWsVhl3h0w9iznRGmJUJSFC9iBi1/MUaB4wT9r4krHxArBAm6gErHuU8tjxHg6NDYX0SFoN8tE9kXsXb/5CQEzfaJI=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

I'm using Linux kernel v2.6.20 in a routing device. My problem is that
after a couple of days my device resets itself due to lack of memory.
I monitored slabinfo to see who might be consuming all of the
available memory. What I saw was that nf_nat:help cache is constantly
growing and eventually eats all of the available memory (30MB). Has
any one seen this kind of behavior before? Any ideas what could cause
this?

br, Sami
