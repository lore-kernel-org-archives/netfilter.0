From: =?ISO-8859-1?Q?Humberto_Juc=E1?= <betolj@gmail.com>
Subject: Re: Bridge IPv6 traffic between 2 interfaces
Date: Thu, 22 Mar 2012 07:15:04 -0400
Message-ID: <CACuyg26hOvXUmjh7X=r1HM4md9kz+DSK-ZtH1LJhbqks+14jAQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=SqgZMuAtfyDsZt3hurCPT6xfx7Kddae1vX1fnNt2PD4=;
        b=JbVSw8tf+p1Utk1hrV9rJu2AqBNUDkpiXIJjdprGuLIOMYcUt1HWDCxATC9LF02Qxm
         wode5c/DKkCfS+HrA/gaCYbSLQ/L4eMywohwl5rwUcSFcAiHcfwYa3wJG5iK578K6SaC
         6hXLFNi1Hvv/tXAxHrlAZf5R0EKXrHAGySwXh7/fYnxJzFL0XJnl0l760Toygzb3I6hP
         UozeOUjYjDg8YDjqPFPnMm2FMnbRsJrpkI5wL9Bh6Su5IscP8hOFX/M/ViWyRvVlJt++
         epE3SWffYjioG67xb46IClZqgWtnLqFkOXrsf1Om7Pzen2UgnJrbY32tDbHjDfuhPmTC
         TsAQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

I do not know if I understand correctly.

You want the IPv6 traffic across the bridge transparently.
But whether a control standard for IPv4 - is it?

To control what crosses the bridge or not you should use ebtables (in
broute chain).
I believe it is something like:

ebtables -t broute -A BROUTING -p ipv4 -j DROP

This prevents the processing of the * bridge * for IPv4 packets, but
you can still use iptables to filter * routing *.

I hope it's this and that works.
Thanks.
