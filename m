From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: kernel helper modules parameters
Date: Tue, 07 Feb 2012 23:44:50 +0000
Message-ID: <4F31B772.2040102@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=message-id:disposition-notification-to:date:from:user-agent
         :mime-version:to:subject:content-type:content-transfer-encoding;
        bh=mxSrW542pOSdC63ps8Lfe851uqLRbdVg5ahe8V+FBxo=;
        b=okMhgPUPvI/nT0uJNhYLX6NcjqGlXD9jnYnwJQ46xm2B/5Sl6SLl6snxhz+phChU5M
         3yV6BoauzcYnwtLqioJWA4Xkizz8Ry+L3Ggn5IMgCbQvHK9wQftFG6MjWifr1EGCashA
         dfTTvGpBApv7GdhhiMNt7H025+xcfwpA+R9vA=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Is there a definite list/doc/man page describing the parameters which 
can be used when loading/configuring these modules?

I would like to do some testing with the (t)ftp, sip, h323 and possibly 
netbios_ns module helpers. I am most definitely not going to use the 
standard ports these protocols operate on, so need to know, among other 
things, how can I reconfigure the helpers and the degree of leverage I 
have (i.e. what I can/cannot get away with). Thanks.
