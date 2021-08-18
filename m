From: Daniel <tech@tootai.net>
Subject: Re: NAT - how external source port is selected
Date: Wed, 18 Aug 2021 18:43:07 +0200
Message-ID: <82442129-99d3-8add-cd6f-8882070eb000@tootai.net>
References: <9cc05668-b4fb-4ed8-1588-7a0f5c378b3a@tootai.net>
 <20210818144615.GQ607@breakpoint.cc>
 <771b005e-4127-7065-7bc8-8ca6b71eee64@tootai.net>
 <20210818161622.GS607@breakpoint.cc>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
        t=1629304987; bh=MYfNs/36du41Gwpo+D40beDGC1aAf46yTgzKTripRfs=;
        h=Subject:Cc:References:From:Date:In-Reply-To:From;
        b=PtN4n3fXG1XfloE8ERw25j9xuMBhLElSjCOvhHbEBSjK6viswNNGHfDitwj5h5UA/
         7WvZZh+DIzaOv8JufTY/AEPuU5W13JRYb9NcTmdUOivPbFa3OMzmmIvuHby0llRdtm
         mz4hV26bPUeebl5MiPYAi6JE/ASNzw4U8ApcqkIk=
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
        t=1629304987; bh=MYfNs/36du41Gwpo+D40beDGC1aAf46yTgzKTripRfs=;
        h=Subject:Cc:References:From:Date:In-Reply-To:From;
        b=PtN4n3fXG1XfloE8ERw25j9xuMBhLElSjCOvhHbEBSjK6viswNNGHfDitwj5h5UA/
         7WvZZh+DIzaOv8JufTY/AEPuU5W13JRYb9NcTmdUOivPbFa3OMzmmIvuHby0llRdtm
         mz4hV26bPUeebl5MiPYAi6JE/ASNzw4U8ApcqkIk=
In-Reply-To: <20210818161622.GS607@breakpoint.cc>
Content-Language: fr-FR
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: 
Cc: netfilter@vger.kernel.org

Le 18/08/2021 à 18:16, Florian Westphal a écrit :

> Daniel <tech@tootai.net> wrote:
>>>> Also, SNOM phones are systematically using port 2048 as source port of the
>>>> WAN ip. Is there a mechanism to allow such behavior ?
>>> What do you mean? The initiator is free to pick whatever source port they like.
>> Well, how he will know that the port is free ?
> bind() fails for listener socket, connect() fails for outgoing (if
> everything is full).
>
> On conntrack machine, connection tracking table gets queried after SNAT
> to see if the new tuple is still unique.
Thanks to all for the explanation.

-- 
Daniel
