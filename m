From: Jimmy Thrasibule <thrasibule.jimmy@gmail.com>
Subject: Re: ipset - understanding hash size and maxelem
Date: Thu, 11 Apr 2013 16:05:59 +0200
Message-ID: <1365689159.25705.39.camel@BEWS005.euractiv.com>
References: <20130410141955.590b9ef8@vd.bk.hosteurope.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-type:x-mailer:mime-version
         :content-transfer-encoding;
        bh=ICToQF+zGRBj+mcP/XIbFWFbVt7Py1uJ2IZ9Sj0xTy0=;
        b=o+Vbm1bx7Wdte4EgYDjzXsdxJjUiNSxrlo1sL7TbokHU2GrUdCh9fMFgesG1DVQ2rC
         swGX1h121ygdKNpUl/QF9MgjU58ptVmRt66ZPxxoOdMpCA0FHJXN7h7sdDsQuSk96ySY
         TG+DW2Tl1wugaQwZGZERAHPP7cOeMmlTISO7tKn9k0QQbCMtCOz2Ml5/ZOlB9QDG+ITB
         gjqIC67t5BL38WNDeU4wEC/ApJaS95sdBVepPB0b3UwFw9qz+3lgR9m3WlfXZzt1Kzng
         PJrwwLiOXfrUkC5Ruy77VAhSeU3u+/wMMQYUK+0/q5jt8LIqMXAGHoD8vNGtZjfdFg+s
         /YXw==
In-Reply-To: <20130410141955.590b9ef8@vd.bk.hosteurope.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Vladimir <ml@foomx.de>
Cc: netfilter@vger.kernel.org

On Wed, 2013-04-10 at 14:19 +0200, Vladimir wrote:
> Hello everybody,

Hi,

> at the momemt I'm setting up iptables/ip6tables rule sets based on
> ipset (on Ubuntu 12.04, using repo packages). As set type I use hash:net
> to handle networks and single IPs.
> 
> Is there a direct relation between the hash size and maxelem parameter?

`hashsize` is the maximum  size of your set. It should be a power of 2
value.

`maxelem` is the maximum number of elements you want in your set. So
that no more elements can be added when maxelem is reached even if you
still have place (hashsize) for more elements.

> When using maxelem on creation of a set this value simply limits the
> number of entries that can be added, right?

Yep.

> maxelem parameter does not depend on the netmask used for a certain
> entry, right?

Yep.

> Should I only specify hash size parameter if I know that my set will
> hold few entries? If I understood man page correctly, the hash
> size grows dynamically by doubling its size (somehow) if needed.

hashsize default value is 1024, minimum seems to be 64 on my system. You
can specify hashsize to gain memory or have a bigger hash. If you
already know the maximum size of your set, you can specify hashsize near
to that value and maxelem to limit the set (for example to prevent
accidental additions).

> Best regards
> Vladimir 

See ya.


