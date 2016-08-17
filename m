From: Alfredo Rezinovsky <alfrenovsky@gmail.com>
Subject: Re: Problem with arp and brouting
Date: Wed, 17 Aug 2016 14:36:31 -0300
Message-ID: <CAMXC=WseKthCTbTBvm+APHRpMVj6VBkS8Lm+fJpGTVtF2yOaBQ@mail.gmail.com>
References: <CAMXC=WtL_ELrLTh5adh_HF9zu4_KogYGFiCkrEgWrbVZTuGKmA@mail.gmail.com>
 <6ec5c4f9-84c4-eb34-6206-8a5b1aab4fcd@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=jeZ96RgTtDt4KFyQALQ1Tm7G8aGoF01PiWFNNCF4xhc=;
        b=X+upHPK4ErB0Y3HwtHp2bPPAbBUc7TVPkdywORKFy/hazmjDNg6nwx3jTky0kYAQO7
         IZh72pKL/W1HH4q41YDDLQc3uh1l7De0u9dCzZthC67ZR8rbpzGJ63P1ON6m8uXhjALN
         xnygmQzX3Wk1OFZHYzgXm/Fij0XODohEIw8T4227Ogo970hklDiSQBLM8a+Ew2Ds+6Ff
         NmZZM6k3I0p6/RTlUy7BwU9M8bzwQA68RTNoj4y7CCM+P3o4zujagTiyvsnZzf/U/6Av
         LlxKfBBKv9goW55Fs5pw58EDd/M5scZ95MXPHQiU2+29Kz7pbXa4lPlMEPUopV6BgzBy
         5cgw==
In-Reply-To: <6ec5c4f9-84c4-eb34-6206-8a5b1aab4fcd@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Pascal Hambourg <pascal@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org

2016-08-17 14:22 GMT-03:00 Pascal Hambourg <pascal@plouf.fr.eu.org>:
> Le 17/08/2016 =C3=A0 18:13, Alfredo Rezinovsky a =C3=A9crit :
>>
>>
>> The other problem is that usually G has lots of IPs (G1, G2...) in
>> many networks, each one with one router (R1, R2...)
>
>
> Why is that so ?
>
>> Lets suppose the Bridge has and IP in the first network (B1).
>
> (...)
>>
>> Because B1 is in subnet 1 and R2 is in other subnet, some routers wont
>> answer the ARP request (CISCO for example)
>>
>> Any solution without the need to add a permanent neigh entry for R2?
>
>
> Configure all the routers in the same subnet.

I need to put the bridge in already existing networks, already
configured out of my control.
If it works without the bridge, should work with the bridge. I need it
to work also in brouter mode.
The whole idea is for the proxy if to be transparent, It should work
without changing anything in an existing network.


--=20
Alfrenovsky
