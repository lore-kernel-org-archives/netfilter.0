From: Ye Liu <yeliu@carmelvision.com>
Subject: Re: Invalid arguments when using '-j TEE'
Date: Wed, 11 Jan 2012 13:30:55 -0500
Message-ID: <CAO=pG1DZEaKoWUi+zSxFtLgNuowY1Up5m98JMNoFwn9hcePwdw@mail.gmail.com>
References: <CAO=pG1As783Kach_+8_hUHBMqaYNBcvw6a13RUB4cVnuOeUB+g@mail.gmail.com>
 <alpine.LNX.2.01.1201111924450.23643@frira.zrqbmnf.qr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:sender:in-reply-to:references:from:date
         :x-google-sender-auth:message-id:subject:to:cc:content-type;
        bh=TF12rAnUAP8n+sC5rjC8t4xkhjajuvqGaP0YRu3fNDI=;
        b=WpB/8Q91fXjfsDZwvE3zBiqlrNq/Ww/8vimXgzHYKrPwYdbrBusfywWO6PQZSSzbFR
         4zy/GOdmPBfR4TMrFRgsdsa27uWejCOqHjJe321oPgKSuxZ+AMQQ4z9aRtDNKDTGbWrP
         0bZ/ndVJFUQewxbFTMZC7an/oxaN5Sp8qOVFw=
In-Reply-To: <alpine.LNX.2.01.1201111924450.23643@frira.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Engelhardt <jengelh@medozas.de>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>, Dov Berliner <dov@carmelvision.com>

Jan, I replaced the real ip with X's, sorry for the confusion.

On Wed, Jan 11, 2012 at 1:25 PM, Jan Engelhardt <jengelh@medozas.de> wrote:
> On Wednesday 2012-01-11 19:20, Ye Liu wrote:
>
>>Hi there,
>>
>>I need to setup iptables rules to tee the traffic, so I've tried to
>>add the following rule:
>>$> iptables -t mangle -A PREROUTING -j TEE --gateway xxx.xxx.xxx.xxx
>>But the command gives an error, says
>>$> iptables: Invalid argument. Run `dmesg' for more information.
>
> xxx.xxx.xxx.xxx is of course not a valid IP address.
