From: Oguz Yilmaz <oguzyilmazlist@gmail.com>
Subject: Re: out of vmalloc space
Date: Fri, 9 Jul 2010 08:40:12 +0300
Message-ID: <AANLkTilfibDwRQIGZlS-5yQ-Zf2Bl-Be9ACaBgMj2W9e@mail.gmail.com>
References: <AANLkTik2BuVthgabtSh838mUwe9AE_Q1HUuoPFRnit4G@mail.gmail.com>
	<alpine.LSU.2.01.1007071911440.31991@obet.zrqbmnf.qr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type;
        bh=W6MISUvnUSritl0tqtQ3OIApXKZf6g2E+T5Ar7zbPGI=;
        b=ZVVZT45j8fu3HOmGZhK4JH2Ke13SmCEo169BjWSK3pllY68mEQLN2WiB7re2mWHiuO
         NzdmUakltd79RujAmRmWuHAg+/kjHoi7A5v6fZHlDPN7pUBRG10dTEWst52rODC6JqVH
         D58sTdU4V8xffEI7ojFwM8RUYHhr+qVj40lv0=
In-Reply-To: <alpine.LSU.2.01.1007071911440.31991@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org

iptables stop:
VmallocTotal:   118776 kB
VmallocUsed:      5556 kB
VmallocChunk:    57472 kB

iptables start:
VmallocTotal:   118776 kB
VmallocUsed:     34948 kB
VmallocChunk:    57472 kB

Total lines for iptables filter, nat and mangle tables are about 5000
Total chars fo the same output (wc -m output) is 536212 bytes.


On Wed, Jul 7, 2010 at 8:13 PM, Jan Engelhardt <jengelh@medozas.de> wrote:
> On Tuesday 2010-07-06 11:27, Oguz Yilmaz wrote:
>
>>Hi all,
>>
>>Symptom of my problem was:
>>
>>System can not ping to 127.0.0.1
>>I try to add an basic iptables rules
>>iptables -I OUTPUT -j ACCEPT
>>and command returned with an error including a long number.(like the
>>error message when you want to add DNAT to an unsupoorted chain)
>
> Long number - was a known bug. Please update to at least 1.4.3.
>
>
>
>>In the dmesg log:
>>
>>allocation failed: out of vmalloc space - use vmalloc=<size> to increase size.
>>printk: 2 messages suppressed.
>
> Do you happen to have too many rules?
> (Though rules are cheap, like 20MB for 100000)
>
