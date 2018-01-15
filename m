From: "Oliver O'Boyle" <oliver.oboyle@gmail.com>
Subject: Re: IPSET persistence on Ubuntu 16.04
Date: Mon, 15 Jan 2018 11:13:47 -0500
Message-ID: <CAMOPTEzkV5v1DJEqqT-ohMTs8UAkWgphEEzdH5+T22b2YSap-g@mail.gmail.com>
References: <CAMOPTEwan+tog9RwsuDFGWGGyHbv9cq_qmua6gmdjr4XoGM7HA@mail.gmail.com>
 <d9567a92-e4ee-0b38-f7a7-5447b9cb5b25@pkfnet.co.za>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=0VzJ24UDjMEfWhw4hnSGYuJzmfSNNC+dZQeTxP/cYu0=;
        b=arEvoWLiqS46LbuqafnclbfZztzZGO+iv97F2s10R5zac8B50gZn4THUP6tKgz98eH
         fedntbzgtv50lFOzOHIrBMTumZXCmMl4Alc5rjWsVKRbnHfrPOcO5hKoVKMjremMb0Yd
         4v0KTA/SFaflnOA98WyuVMFoMzA6zTSLpXOjAg0aXIx9rLezZ1ToRK20jc/iCnfzRliH
         zKsyfgR6jb5OhJLwHgg7wHSw1grGZYq9obnWB7ih1ngL5bsnOkcWc1BN9YBAZUexv1h7
         enVMpubBCtemskJFchm5CsEDqiFOXJ36RF70hUK7qoZ1eBGHAdec+ANVjrmvUcKFrF6p
         jk2A==
In-Reply-To: <d9567a92-e4ee-0b38-f7a7-5447b9cb5b25@pkfnet.co.za>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Coetser <mark@pkfnet.co.za>
Cc: netfilter@vger.kernel.org

Thanks, Mark.

Someone needs to write an ipset-persistent package or integrate ipset
into iptables-persistent :)

Oliver

On Mon, Jan 15, 2018 at 3:36 AM, Mark Coetser <mark@pkfnet.co.za> wrote:
>
> On 12/01/2018 23:20, Oliver O'Boyle wrote:
>>
>> Hello,
>>
>> Just started using IPSet on Ubuntu 16.04. After reboot, my set
>> disappeared and my ip6tables config vanished, leaving my fw wide open
>> with default rules. OUCH.
>>
>> What's the proper way to do IPSet persistence on Ubuntu 16.04?
>>
>> Oliver
>>
>
> either create a script that you call from /etc/network/interfaces ie
>
> up /full/path/script
>
> that has your ipset commands
>
> or just put the ipset stuff into interfaces file
>
> auto eth0
> iface eth0 inet static
>         address x.x.x.x
>         netmask x.x.x.x
>         up ipset xxxxxx
>         up ipset xxxxxx
>
>
> --
> Thank you,
>
> Mark Adrian Coetser
> mark@pkfnet.co.za
>
> What causes the mysterious death of everyone?



-- 
:o@>
