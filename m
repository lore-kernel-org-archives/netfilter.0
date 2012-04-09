From: Aaron Clausen <mightymartianca@gmail.com>
Subject: Re: NAT Reflection on Gateway with DHCP Address
Date: Sun, 8 Apr 2012 18:42:51 -0700
Message-ID: <034990BB-E6AA-495C-A990-23279E5077B6@gmail.com>
References: <CAEH2fGxT9-F48ZT5zTm4HFY2U6ywZXxGKSXMwEaM1oRO2gK6Hw@mail.gmail.com> <20120409010844.GT3502@harrier.slackbuilds.org>
Mime-Version: 1.0 (1.0)
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=references:in-reply-to:mime-version:content-type:message-id
         :content-transfer-encoding:x-mailer:from:subject:date:to;
        bh=URETZFyBpxBGxrLnNCxgAmptC5RAZT7eNScejTo34HU=;
        b=BvTChiUlSkE6hUoc+t0dn5pAWj8PYU/FU9xEAFWqEaIUyL/SGEwJSKoAsXT9Na9yOW
         y07aluyfuH6cwB58vtpT1CkaFJa8LuAnr5oE07soXcK38w9CaSYTfqBVeKJCxEYwTu8p
         rw7uoyfp0sXyQoH6GWdNUTB/jcAdzSreJIYhgh9/zkDa8/bqmhE5CJHJehjVTtJRhz0L
         6UeXr/fHrx0TocX97BkGa4Kby+PQtmo9UlrNuj4am/VmuT2iiSZoQUkbF5nUCRbYYTT6
         SZvfXE5U1epqFK+4KwoY4pSKDWfHrDp69UUqCEWafF5zcSH39jo7bzSCqDvXWKpX9oSn
         ShAw==
In-Reply-To: <20120409010844.GT3502@harrier.slackbuilds.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On 2012-04-08, at 6:08 PM, /dev/rob0 <rob0@gmx.co.uk> wrote:

> On Sun, Apr 08, 2012 at 05:10:19PM -0700, Aaron Clausen wrote:
>> I'm trying to sort out how to do NAT reflection off the public 
>> interface where that interface's IP address is supplied via DHCP 
>> from the ISP. Any thoughts?
> 
> I would guess that by "NAT reflection", you mean that you think you 
> want to NAT internal clients to an internal host for various requests 
> of your external name. This only makes sense if you are using some
> kind of dynamic DNS service to give you an "external name".
> 

And this works fine except for some devices which ignore my DNS and use external ones like Google's and thus fail when trying to access our public resources from our internal WiFi network. Hence the need of reflection/loop back/whatever-you-call-it.

-- 
Aaron Clausen