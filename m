From: =?UTF-8?B?UmVtemkgQUtZw5xa?= <linuxliste@gmail.com>
Subject: Re: limit module not working with drop policy
Date: Fri, 22 Jan 2010 10:03:36 +0200
Message-ID: <4B595BD8.4090009@gmail.com>
References: <4B591A79.2030600@infoservices.in>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=48LmM0BrhEV67pDmPthG8z0dZgEsqzyj5mIwW6PqSGE=;
        b=Mz4CmHxNQ29z8zawGJ+NBKYvuxLMCk40LcfcoIIZxESxe2Vvh93EL/WVSB1dcjgAW8
         BiB0J3QWaa6EpD2pl23tfyKU12ErTII2eLBqdxdvFt/3KJjSyDsqv/czMVURggph1qYf
         nYGsh6xe+H3P4OOQNY5c7EPmu8icXgc3s08HA=
In-Reply-To: <4B591A79.2030600@infoservices.in>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "J. Bakshi" <joydeep@infoservices.in>
Cc: netfilter@vger.kernel.org

Hello,
can you send
output of the iptables-save?

J. Bakshi wrote:
> Dear list,
>
> My firewall policy is default drop.  But the limit module is not working
> here. I have the following rules to defeat ping flood
>
> ``````````
> iptables -A INPUT  -p icmp -m limit --limit 3/minute -j ACCEPT
> iptables -A INPUT  -p icmp -j DROP
> ``````````````````
> and it is not working. The same rule set is working with default accept
> policy.  What modification should I need to make it working with drop
> policy firewall ?
>
> Thanks
>
>
>
>   

