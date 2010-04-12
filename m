From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: Re: removing black listed ip
Date: Mon, 12 Apr 2010 11:54:54 +0530
Message-ID: <n2jcfeab66d1004112324t35d8d49cx7eebfcfe88b4f461@mail.gmail.com>
References: <z2xcfeab66d1004101003j5eb39eb1t38ec3b31ce3ce4b@mail.gmail.com>
	 <alpine.LSU.2.01.1004101910020.32651@obet.zrqbmnf.qr>
	 <z2hcfeab66d1004101020w685d24b3hc2551381819ced27@mail.gmail.com>
	 <alpine.LSU.2.01.1004101938350.4171@obet.zrqbmnf.qr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:received:message-id:subject:from:to:cc:content-type;
        bh=/StzqTUk2Bmi+Mnzmu/vxAxTd6qXZI78rAYBn75isFs=;
        b=ivTvvgDP/P4xTVB3f/f3ochMnrmzIiHB5anjxw+eU9y3ZfNaxUlIEBPPXg+meOk5QP
         66oTJxgwlEg7GSRs9sl4Vc3W9fPShFfoN2FRRmdYZ2UOisbpJ/djmiGX5bUna2nnCmoo
         NHOj8DZoQMI5Z+O+BPsDQMj/PsgJV5vvQoF/I=
In-Reply-To: <alpine.LSU.2.01.1004101938350.4171@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org

On Sat, Apr 10, 2010 at 11:12 PM, Jan Engelhardt <jengelh@medozas.de> wrote:
> On Saturday 2010-04-10 19:20, ratheesh k wrote:
>
>>> xt_recent works by comparing the difference between an entry's
>>> timestamps and the current time with the chosen --seconds parameter.
>>
>>If an ip is black listed , when it will get removed
>
> It will not get removed. If you want any action, such as blacklisting,
> to stop after a given time, you use --seconds as I just told.
>

if  number of ip balcklisted ip is more than  ip_list_tot , old
entries will be replaced by new ip addresses ? . { once list if full ,
what will happen for new black listing }

Thanks,
Ratheesh
