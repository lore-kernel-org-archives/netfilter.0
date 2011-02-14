From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: Re: how to install xtables extension to arbitrary path?
Date: Mon, 14 Feb 2011 14:43:28 +0000
Message-ID: <4D593F90.5020609@googlemail.com>
References: <4CB712C3.3030804@21com.com> <loom.20110214T152123-163@post.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:message-id:disposition-notification-to:date
         :from:user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=zcsztVauanyAnEgQhx4+WuW7tmuKbfV148jdD6Jce3U=;
        b=VObCiD9rhY2bpY8LsvkWEcXppY2zMmMNg7lQFuAu/x8cssaAwcGfQHfFxVcciuENIF
         LBykT5XvBspZZ7WVYGsaoeQ2k9D/qp9rxjBSFyd4vIRTJM4o7PZifQNPnCdDZZZqAZaY
         XOpY4IC/IPKUXKXRxCleDGXfAACdSpUV2GwzY=
In-Reply-To: <loom.20110214T152123-163@post.gmane.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Fabrice <fabricedeyber@agilemesh.com>
Cc: netfilter@vger.kernel.org


>> When building iptables, we can use "configure" to specify the xtables
>> extension install path by "prefix" or "withxtlibdir". And when we
>> running the iptables, iptables seems to search for the xtables extension
>> libraries only in the path that was specified by "configure". If we move
>> the xtables extension libraries to some other place, iptables will
>> report failing to load the "so" files.
>>
>> Because I'm doing cross compiling, and I will place the xtables
>> extension libraries in the target board, and the final path might be
>> different than the "configure" path. Do you know how to make iptables to
>> load the correct xtables extensions?
>>
>> Thanks.
>>
>>     
>
> Hi Xing,
> I'm having the same issue. I'm able to cross compile but when I install 
> to another file system the libraries always look at the absolute path which 
> is not valid anymore. How did you get around the issue?
>   
One possible solution to this (though not ideal by any means!) is to use 
modprobe and force the .so files to be loaded in advance as soon as the 
system is initialised (possibly through rc.sysinit). This is how I've 
got around the above problem as I also have a group of machines which 
use non-standard directories for xtables and ipset.

