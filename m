From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: Re: kernel BUG: ipset 4.4
Date: Fri, 03 Dec 2010 13:26:01 +0000
Message-ID: <4CF8EFE9.2000602@googlemail.com>
References: <4CF80230.4060309@googlemail.com> <alpine.DEB.2.00.1012031056470.28561@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:message-id
         :disposition-notification-to:date:from:user-agent:mime-version:to:cc
         :subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=i+vyIzWDwA+YMcgCnwgoFThNeary7wuT2AtWapLydnM=;
        b=tiZEK0siMKDCbywVu4lifQsYHzb31FXncFJYUs/0/GVJF5HScRZvReMPZYXYjIC+IV
         TcKUDZi0SD8fngFighyzB4VMLkMFdqc+7aL/WeTV9Sw/5mAjyUkCi13ecfkrKfIIAl33
         hS9Fs1H1nQTz8FsI4Ap2oF8iN2wAo75rig6VQ=
In-Reply-To: <alpine.DEB.2.00.1012031056470.28561@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@vger.kernel.org


> According to the logs below, it's a bug in deleting an entry from 
> an iptreemap type. I'll look into it at the weekend, thanks for reporting!
>   
It might be related to something I did (and was very impressed with as 
far as ipset goes): I had defined a /16 range of addresses in that 
ipset, but later on had to delete a single address from that range with 
the ipset -D command.

When I executed ipset -L (and got the kernel error) I found out that 
ipset had readjusted, 'automatically', the IP range, which I found quite 
good.

For example, let say the original IP range was 10.10.0.0-10.10.255.255. 
Then I deleted 10.10.100.100 and issued ipset -L. The previous range of 
10.10.0.0-10.10.255.255 is now split in two, 'automatically' by ipset, 
to 10.10.0.0-10.10.100.99 and 10.10.100.101-10.10.255.255 - quite 
impressive, though unfortunate that I get the kernel error, which I 
suspect was caused by the deletion I did previously.

