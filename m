From: Daniel <tech@tootai.net>
Subject: Re: Is it possible to change a chains default policy when rules are
 already present?
Date: Fri, 14 Aug 2020 14:54:51 +0200
Message-ID: <2b96d288-50d9-b64b-f5ac-3343d3b9f631@tootai.net>
References: <AM0PR06MB4628C196EBABF0FD53AA8006C5430@AM0PR06MB4628.eurprd06.prod.outlook.com>
 <20200814110749.GA30331@salvia>
 <c0afef4e-7276-a368-226a-cb315ea1ab69@tootai.net>
 <1ed447f1-da05-38c7-e86e-4451f8040c88@thelounge.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
        t=1597409692; bh=RSzsaM3ekwcPGRabZLu4maU1MThmOMJ+rqIo9B/YoaA=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=F1fhtE95FoEoXc6QdniXU2I1m7uZ760cOzRcXq1eisYl6TEdSEn9BrG8kZ59h1WWg
         tRiooScsGWkhRMavgerCqbm26jOgnGEG1UX451S8YR5EMCM7se5Wk6/T9434p3OJCS
         Valdcp3t+8Sze7OEialnDmdzov1xWEsbfOcZdolg=
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
        t=1597409691; bh=RSzsaM3ekwcPGRabZLu4maU1MThmOMJ+rqIo9B/YoaA=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=A0bq9MwtrMt//qPMl01tM0sHyWdaNuSJN/+jpb9QNtNXLXmqypFPIB4DenBp+CcGf
         gnqjau4TdqykwpasTbmdCQ7lGK065OpoSe0FtFmpLJ3DgqawLzFjFgLZ3YpZ8zuKeD
         dSXbU4QCW/Fdjy6Xg4xHOchwgohI5k7GUIfNrVnw=
In-Reply-To: <1ed447f1-da05-38c7-e86e-4451f8040c88@thelounge.net>
Content-Language: fr-FR
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Reindl Harald <h.reindl@thelounge.net>, Pablo Neira Ayuso <pablo@netfilter.org>, Andreas Hoefler <andreas.hoefler@hitachi-powergrids.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>


Le 14/08/2020 à 13:36, Reindl Harald a écrit :
>
> Am 14.08.20 um 13:21 schrieb Daniel:
>> Le 14/08/2020 à 13:07, Pablo Neira Ayuso a écrit :
>>> On Thu, Aug 13, 2020 at 12:28:34PM +0000, Andreas Hoefler wrote:
>>>> Hi
>>>>
>>>> I have a chain with default policy drop.
>>>> I would like to first have the default policy set to accept, then add
>>>> rules and later change it to drop.
>>>> Is this possible?
>>> For the record:
>>>
>>>    nft add chain x y { policy accept\; }
>>>
>>> Assuming an existing basechain 'y'. The backlash (\) before the
>>> semicolon is there in case of invoking this from bash.
>>  From bash how to you set priority leaded by - like priority -150 \; We
>> always get invalid option
>>
>> dh@peech:~$ sudo nft add chain ip6 mangle output { type nat hook
>> prerouting priority -350 \; policy accept \; }
>> nft: invalid option -- '3'
> because you don't escape - with \-
I already tested by escaping - sign, same error
> don't nft understand quoted params?
>
> nft add chain ip6 mangle output "{ type nat hook prerouting priority
> -350 ; policy accept ; }"
Not working either

dh@peech:~$ sudo nft add chain ip6 mangle prerouting "{ type nat hook 
prerouting priority -350 ; policy accept ; }"
Error: Could not process rule: Operation not supported
add chain ip6 mangle prerouting { type nat hook prerouting priority 
-350; policy accept; }
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

-- 
Daniel Huhardeaux
+33.368460088@tootai.net	      sip:820@sip.tootai.net
+41.445532125@swiss-itech.ch		    tootaiNET
