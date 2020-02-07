From: =?UTF-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Subject: Re: Metering is not working with dynamic sets on nft v0.9.2
Date: Fri, 7 Feb 2020 09:48:42 +0000
Message-ID: <4d26b387-5466-d57d-6191-dcbe8926ec01@gmx.net>
References: <8665bae3-ba91-2699-15ea-27d256d9bcd2@mailbox.org>
Reply-To: vtol@gmx.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1581068923;
        bh=C9GnErUNqMJHJ+xdQxFOMN6CYj7N3Al0ABzR7WcDxa0=;
        h=X-UI-Sender-Class:Reply-To:Subject:To:References:From:Date:
         In-Reply-To;
        b=G5uzoZicwwyyvdxih/L+OmuAHX9KrXWqLejWfdHtYgRkryzpoIKk4UoX13m6BC7gv
         dmnqXLUHo65VsWbZv2KTANrf0r7Tr+CYln3FuhSSIHhY+78WpFeKqPJXARRDRyPpvh
         bsGQ+ASHyyDgdzB3azXA3pmbsxJWZIuHPU+dy5VQ=
In-Reply-To: <8665bae3-ba91-2699-15ea-27d256d9bcd2@mailbox.org>
Content-Language: en-GB
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: darius <dram@mailbox.org>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On 06/02/2020 22:42, darius wrote:
> Hello,
> I was using meters by using 'meter' keyword, but apparently it is now
> obsolete.

If not mistaken the intention is to replace meter with native set / map=20
syntax but meter not yet being depreciated/retired.


> So, I have decided to update rules and use dynamic sets
> instead. For some reason I'm getting an error stating that rule is not
> supported. Here is what was working before and still works:
>
> ct state new meter mymeter { ip saddr timeout 30s limit rate over
> 50/second burst 50 packets } counter drop
>
> Then I have tried to update this rule to the following:
>
> ...
> set mymeter{
>      type ipv4_addr; flags timeout, dynamic;
> }
> ...
> ct state new add @mymeter { ip saddr timeout 30s limit rate over
> 50/second burst 50 packets } counter drop
>
> In this case nft throws fault message:
>
> root@HOMEROUTER:/etc/config# /etc/init.d/firewall reload
> /etc/config/ruleset.nft:416:9-187: Error: Could not process rule: Not
> supported
>          ct state new add @mymeter { ip saddr timeout 30s limit rate ov=
er
> 50/second burst 50 packets } counter drop
>
> I'm running OpenWRT, kernel v4.14.167, nft v.0.9.2
> Could anyone help to find out what I'm doing wrong? It seems that I did=

> it according to wiki.
>
> Regards
>

Are NFT SETS otherwise working? If so then probably it is due to the=20
inhabitation of the kernel version 4.14.x, least my understanding is=20
that some SETS related features are only available as of kernel 4.15 | 4.=
18.

If SETS however generally printing the error then it likely would be=20
caused by an unset kernel build configuration flag.



