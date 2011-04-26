From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: Re: ipset maximal/minimal revision conflict
Date: Tue, 26 Apr 2011 20:25:37 +0100
Message-ID: <4DB71C31.6030106@googlemail.com>
References: <4DB6A9A5.5070301@googlemail.com> <alpine.DEB.2.00.1104261558430.1834@blackhole.kfki.hu> <4DB6DF66.6040009@googlemail.com> <alpine.DEB.2.00.1104262007050.2868@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:message-id:disposition-notification-to:date
         :from:user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=9AtMnX5cns1FCjctL4aadeXdCbXHmff7gVkh4vMJhQ4=;
        b=lV3klkYV1ctI36BFmTDtwEvb0ZfhDgkpfGF6kEm3Cdy5bcC8+TDH0YuWNuifNM+YIc
         bkg3iS6H0SnLsJLG9X9qKIirFHCBNN2ZlLqR/R96WHDVjFqGKrSuc2+b2DTyLa7NClB7
         rd6/qwNgPkJVnmBAXzsClLPNa1irglimlWirw=
In-Reply-To: <alpine.DEB.2.00.1104262007050.2868@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>


> You can copy over the files (header files too) from the ipset package to 
> the kernel tree.
>   
Actually, what I did was to create 1 mega patch with 1) the difference 
between .39-rc4 and .35-88 (the latest stable kernel released by Fedora) 
as far as the ipset kernel modules are concerned; 2) all 
menuconfig-related ipset settings (so that when I run make menuconfig I 
could select the ipset settings properly); and 3) the difference between 
.39-rc4 (git as of 24 April) and ipset 6.4 (the kernel part).

Applied it successfully to the kernel source tree and I am now building 
it (.35.12-88). If/When it finishes I'll install it on my test harness 
here and will see how it goes. I briefly looked at the differences 
between the 6.4 release and the latest kernel modules I've had from that 
git and they are quite extensive indeed.

One thing I also noticed - in the kernel part of v6.4 you have 
"-DCONFIG_IP_SETMAX" extra CFLAGS defined, but that seems to be missing 
from the git kernel tree - is that on purpose or is this new to be added 
later on?


By the time I typed this the kernel build has completed successfully. 
Installation and testing follows...
