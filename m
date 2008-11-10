From: "JC Janos" <jcjanos245@gmail.com>
Subject: ipset, when to use iptree?
Date: Mon, 10 Nov 2008 08:57:07 -0800
Message-ID: <7259d7020811100857h45ae4116o714723e5282c4e6@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:mime-version:content-type:content-transfer-encoding
         :content-disposition;
        bh=n0QcyIYyHhrZnNR4gihNyDfpImVfiYCz1JrxqlBgB/c=;
        b=buFx74wPeCDWJsO9eTXh/cHPCyfRXI2/PcK2fyC//y5FKktWUbLRjKBzhWM8LcK7dk
         CEsFD8RBCF2NB1UvX70FYK5KTQXFJiTOaN8c7quQgwhTjNT1thnljwh8Jr30QGarmz6j
         WMys859jqBQpQz9qDz1E44KNv0YT93mhcKT+o=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello,

What's the basis for choosing between ipset's iphash and iptree set types?

I'm guessing it's performance, but I'm not understanding the
difference from the man page.

When to use which?

--JC
