From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: Re: [ANNOUNCE] ipset 6.13 released
Date: Sun, 01 Jul 2012 13:44:55 +0100
Message-ID: <4FF04647.7060807@googlemail.com>
References: <alpine.DEB.2.00.1206292201340.29738@blackhole.kfki.hu> <4FF02A93.8080603@googlemail.com> <alpine.DEB.2.00.1207011405160.2289@blackhole.kfki.hu> <4FF04038.4080306@googlemail.com> <alpine.DEB.2.00.1207011434010.2486@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=pb3TqhB2Y61OR2NpY233SoQabNj0mm3qFDs0PC/4Q60=;
        b=mF4OCf7JdV5733rQtxID55AeBdJCdeRKpkQEULQ/gT9GGPZVXZEJDnXsb2LTtBCxJu
         Bb5L7kAahkLX/Hc13twfG8nB2LCXASfYprbgvSonjROtoMh8vIpRaHb+ljhOXgGqeMX4
         /mUWYwBHj8NUFLvti4PHXRyzntAjsRKjEQqNys2kQQuQsNOmGGIOv4egHsVYI0F9HSjt
         rxLbBDgEsAvnz6fblBAjiZaQpJKbgWAonghf0dvh7ycEQGzFhnuJUcKoSGya4An/1XDq
         ReRkI7NaJa/GcbCpfCd2lfE0evhY4R53s9uB744xQybXJj5YD4E5qTI2tViRyUgVZTDj
         HqqA==
In-Reply-To: <alpine.DEB.2.00.1207011434010.2486@blackhole.kfki.hu>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org


> Call it a bug, whatever. I won't change the meaning of src/dst for 
> hash:net,iface which then will break someone's working firewall after an 
> upgrade.
>   
In other words, you are not only intent on keeping this bug in the 
netfilter/kernel code, but willing to document it in a man page simply 
because of the remote possibility that someone somewhere may have been 
using hash:net,iface and decided to upgrade while not willing to change 
its configuration to put right something which was wrong in the first place?
