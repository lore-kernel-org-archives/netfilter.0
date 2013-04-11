From: Jimmy Thrasibule <thrasibule.jimmy@gmail.com>
Subject: Re: [ipset] Match both on source AND destination
Date: Thu, 11 Apr 2013 17:23:51 +0200
Message-ID: <1365693831.25705.50.camel@BEWS005.euractiv.com>
References: <1365691926.25705.48.camel@BEWS005.euractiv.com>
	 <alpine.DEB.2.00.1304111701570.32023@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-type:x-mailer:mime-version
         :content-transfer-encoding;
        bh=rcDWcPgFwt7ONHQ0sgbe7Rr+3DcgS8x1HGmC8eIm+sc=;
        b=oKsnPqvESFxtmwEy0rzjw2SjZpQbWuxGfKSZ6H3+ROip98aOLGenqjst/RIoVybmC5
         U99tKUY2oogPxnjpl9gZBEM+jPaazeeDOLFKTJLEGVuT81Yb0YNXQA11gSD43EcqqT0s
         WAopbJhq4R33wsSq4grpmIuGOCjVMvBxV4V07hiLzb5wNfSw49BHQ3VQVD6KIrvneOw1
         53JlTQ2UWMB7ZOYyWeFRA9E2kcTo2DI9foIJWJEYGWz1Kyeu6WV684J/w5BSJB9JMZUv
         GCSCpiYbG+138bjwjlKb8/qLWkmbB3trvYqDiDSUiBIThb2q2+ItKeYCAiq7vpaiHeP6
         2Lzg==
In-Reply-To: <alpine.DEB.2.00.1304111701570.32023@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@vger.kernel.org


> 
> Apply two matches:
> 
> -A FORWARD -m set --match-set mynets src -m set --match-set mynets dst ...

Ah,

That's the first thing I tried but as I didn't load the module twice it
wouldn't work.

Thanks.

--
Jimmy


