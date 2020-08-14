From: Daniel <tech@tootai.net>
Subject: Re: Is it possible to change a chains default policy when rules are
 already present?
Date: Fri, 14 Aug 2020 13:21:05 +0200
Message-ID: <c0afef4e-7276-a368-226a-cb315ea1ab69@tootai.net>
References: <AM0PR06MB4628C196EBABF0FD53AA8006C5430@AM0PR06MB4628.eurprd06.prod.outlook.com>
 <20200814110749.GA30331@salvia>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
        t=1597404067; bh=+GepIK/FY5h8k6/QT4FJmHUGiTQHwleh9VLG8Kz3n3I=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=OPbzh+MFQ4AVUIhzmpOynys79Mq5oBgvodYbHr0IK50C/tzUhXg6Ms7AQLX4FR6mg
         QH90McVF0yYRRQ/wN6JOnHju3WBT2Ya6Df7Z+93PgAzVgSl+xVZrco1WoFuaMoCDao
         EFWHKTRHVkc7LIy4UqeXClVy9hPQyNosP0qEbzBA=
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
        t=1597404067; bh=+GepIK/FY5h8k6/QT4FJmHUGiTQHwleh9VLG8Kz3n3I=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=OPbzh+MFQ4AVUIhzmpOynys79Mq5oBgvodYbHr0IK50C/tzUhXg6Ms7AQLX4FR6mg
         QH90McVF0yYRRQ/wN6JOnHju3WBT2Ya6Df7Z+93PgAzVgSl+xVZrco1WoFuaMoCDao
         EFWHKTRHVkc7LIy4UqeXClVy9hPQyNosP0qEbzBA=
In-Reply-To: <20200814110749.GA30331@salvia>
Content-Language: fr-FR
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Pablo Neira Ayuso <pablo@netfilter.org>, Andreas Hoefler <andreas.hoefler@hitachi-powergrids.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hello

Le 14/08/2020 à 13:07, Pablo Neira Ayuso a écrit :
> On Thu, Aug 13, 2020 at 12:28:34PM +0000, Andreas Hoefler wrote:
>> Hi
>>
>> I have a chain with default policy drop.
>> I would like to first have the default policy set to accept, then add rules and later change it to drop.
>> Is this possible?
> For the record:
>
>   nft add chain x y { policy accept\; }
>
> Assuming an existing basechain 'y'. The backlash (\) before the
> semicolon is there in case of invoking this from bash.

 From bash how to you set priority leaded by - like priority -150 \; We 
always get invalid option

dh@peech:~$ sudo nft add chain ip6 mangle output { type nat hook 
prerouting priority -350 \; policy accept \; }
nft: invalid option -- '3'

-- 
Daniel Huhardeaux
+33.368460088@tootai.net	      sip:820@sip.tootai.net
+41.445532125@swiss-itech.ch		    tootaiNET
