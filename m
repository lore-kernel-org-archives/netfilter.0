From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: Re: [ANNOUNCE] ipset 6.5 released
Date: Sat, 21 May 2011 22:51:29 +0100
Message-ID: <4DD833E1.8050507@googlemail.com>
References: <alpine.DEB.2.00.1105151540340.25248@blackhole.kfki.hu> <4DD145C0.4060705@googlemail.com> <alpine.DEB.2.00.1105170941590.31848@blackhole.kfki.hu> <4DD8158D.4040306@googlemail.com> <alpine.DEB.2.00.1105212323230.23769@blackhole.kfki.hu> <alpine.LNX.2.01.1105212331570.16146@frira.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:message-id:disposition-notification-to:date
         :from:user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=nfesk5Vg9ehkGEAB5PZ2yh6ZusRGsQhOqZ7HijIirRo=;
        b=jvLOMTFaiDjwaincRGV0deM2jRGQUZw9mMKoUp1BqpLyPI3RHTkqrvsBEH3S9FhKmj
         eftHCFdMPse6f9C9SaVmeZCC5QRGyt5fqzBZ8AnwCrYFEbZ6ULfzi8cJHUIivLuGrEfX
         iyI37zZ6EnOU3acK8HUj//pRoboSCfQigYsAw=
In-Reply-To: <alpine.LNX.2.01.1105212331570.16146@frira.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>, netfilter@vger.kernel.org


> Nevertheless, I would recommend to mr-4 to have a ipset and libmnl 
> compiled with debug info, point to it via LD_LIBRARY_PATH, and then feed 
> it through valgrind with the same input. That may give some more 
> insight.
>   
Oh, by the way, forgot to add this - there is a bug in xtables-addon I 
ran into while I was dealing with all this - if I have ipv6 compiled as 
a *module* when I try to install xtables-addons (via kickstart) I get 
these errors:

WARNING: 
/lib/modules/2.6.35.13-91.fc13.i686/extra/xtables-addons/xt_RAWNAT.ko 
needs unknown symbol ipv6_find_hdr
WARNING: 
/lib/modules/2.6.35.13-91.fc13.i686/extra/xtables-addons/xt_SYSRQ.ko 
needs unknown symbol ipv6_find_hdr
WARNING: 
/lib/modules/2.6.35.13-91.fc13.i686/extra/xtables-addons/ip6table_rawpost.ko 
needs unknown symbol ip6t_unregister_table

I managed to fix the "ip6table_rawpost.ko" error - the problem was with 
the extensions/Kbuild file - it needed another "ifneq 
(${CONFIG_IPV6_MODULE},)" "endif" block after "ifneq (${CONFIG_IPV6},)".

I saw in xt_RAWNAT.c that there is preprocessor directive which was like 
"#if defined(CONFIG_IPV6) || defined(CONFIG_IPV6_MODULE)" to separate 
the ipv6 code from the "normal" one, but it didn't work properly for 
some reason. When I forcefully removed the ipv6 code blocks from both 
xt_RAWNAT.c and xt_SYSRQ.c everything was fine, so I think you need to 
look at this!
