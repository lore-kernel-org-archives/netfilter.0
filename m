From: Daniel <tech@tootai.net>
Subject: Re: NAT - how external source port is selected
Date: Wed, 18 Aug 2021 16:50:03 +0200
Message-ID: <30dceaf1-7087-2f80-800d-129d6e0dcb59@tootai.net>
References: <9cc05668-b4fb-4ed8-1588-7a0f5c378b3a@tootai.net>
 <53d27ba0-56ed-9683-0e19-0c946888e781@thelounge.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
        t=1629298204; bh=6KrvfI6E3kqd1W62xnAYGpXTcrifwaN6loFIfG38J30=;
        h=Subject:To:References:From:Date:In-Reply-To:From;
        b=pggJj7Egd+9WEgWVtzfiXEW9lG//94cOLCMAtvcy0DFj7jL3pi6fsFekSrftMKMtW
         vvqdSAsFnrRIfHqwXFd8TVO1O9y6DjVqoLZ90IgP2gjX/tWUuX5pX+iCRKQzHr72LK
         tschUv/U/PprRZRYLvSU+UY6Ci7cYeGlKLOEFSGw=
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
        t=1629298203; bh=6KrvfI6E3kqd1W62xnAYGpXTcrifwaN6loFIfG38J30=;
        h=Subject:To:References:From:Date:In-Reply-To:From;
        b=LK9NAR/iTu5RU6aDX2GeYdeAB6WJLBxTYTH0utPr9laydJmCrQYhIe1xox2Ro48hH
         sYG3Jl4YPVHKEcYVj36guFAndSKLJYtypo/MgRN+SEBpL65yM8prccBpynh2EJwu+4
         gJOl3zntJX8PSf3wpUk+3B1KzPrNKOeGasgYk7Ic=
In-Reply-To: <53d27ba0-56ed-9683-0e19-0c946888e781@thelounge.net>
Content-Language: fr-FR
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Reindl Harald <h.reindl@thelounge.net>, netfilter@vger.kernel.org

How is the magic done then ?

Le 18/08/2021 à 16:22, Reindl Harald a écrit :
>
>
> Am 18.08.21 um 15:53 schrieb Daniel:
>> how on a NAT firewall server using iptables or nftables, are the 
>> external source ports choosen?
> NAT don't chose any ports at all

-- 
Daniel Huhardeaux
+33.368460088@tootai.net	      sip:820@sip.tootai.net
+41.445532125@swiss-itech.ch		    tootaiNET
