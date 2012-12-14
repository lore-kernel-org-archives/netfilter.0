From: =?UTF-8?B?5Y+26Zuo6aOe?= <sunyucong@gmail.com>
Subject: UDP fragments , legitimate ?
Date: Fri, 14 Dec 2012 12:06:12 -0800
Message-ID: <CAJygYd1+1W7HqokAwgD2hi+ixeor+Eesz6BetbB-cScgsmd7NQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:from:date:message-id:subject:to:content-type;
        bh=HSo8AQt/Z90Z5InEhhFBACX5vMUgutevN7yH0bmseFc=;
        b=TG4rjxAYbMQXaC71vgG5Th80Q+3KRKoffkWw3tOBOuLewi0s0J23p+RRbL/1EQeKXR
         5pkRHnT/mnOHf3tu2T3nLBfBwGPMXRX67mGegiY8oMslNGj/rIZIXS8y+38lyWE7qu4k
         agigP+6LwDoPaj2nI5toz03Zc3SucQprFW222QQpJ0PaBtRFgJtYplKEMOmB0/cdKZG3
         YYHrTB2f2RggGvwmOd91A6sBjDxqfLSxIqgnKH5+TB9WwKgYvd4rASxl1nFf6jVzWlle
         RFLr3lP0/Qw0wIQqfCWoPrzL/KNqQhul2lkCC+qowSGI1FdSY/Qec15dZYTLoZnCldC9
         tipA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

This is more like a general networking question

Is there legitimate use of UDP fragments in the wild? have you seen
commonly used application sending/receving UDP packets that is large
than MTU ? Is it safe to assume such traffic is nothing but dumb
attacks?

Thanks.
