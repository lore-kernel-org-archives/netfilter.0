From: Mauj Lele <mauj.mailers@gmail.com>
Subject: Re: LOG_ACCEPT does not result in matching packet being accepted
 (ACCEPT works)
Date: Sat, 19 Mar 2011 10:01:53 -0700
Message-ID: <AANLkTimHKzvyO94_-X5up-792F0Q6c5RKb4Vfx-xfzi+@mail.gmail.com>
References: <AANLkTin0ZoJ7MfonStpL_Ez=m=tre_w5WvRRXWLrswke@mail.gmail.com>
	<8A7E792DB93B42C5B2C33004FFDBF9C6@Dell>
	<3B9D650FA47F4012ACBD15C9FA7E5DC7@Dell>
	<AANLkTikW9zRCnOtePDQXEShNai5G4b1UTfit6_hhO9bc@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:date
         :message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=9pvXw6fwCnriVhxo6R2afnvItkaLMH7fgjzIynVl6cI=;
        b=MswXF9MsuHKDUq+3SavMsdxMbt9+eR6SwZHMYLSHZKW3yXn4nmwbY8YtqBrA+CgYON
         2dYmYwi/mI/7Kg9JlUnYitooeH0UTu6sWRBsA8cvAM/0G5aWNZxuzZCYqrdjm0pJ1/4Z
         C/U9qbk9hhG5N4R6Cptyhqo8HzbZ8lmKTcKII=
In-Reply-To: <AANLkTikW9zRCnOtePDQXEShNai5G4b1UTfit6_hhO9bc@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Pandu Poluan <pandu@poluan.info>
Cc: "Rob (lists)" <lists@sterenborg.info>, netfilter@vger.kernel.org

Ooouuuchh..my bad. I mistook LOG_ACCEPT for a target similar to
ACCEPT. Looks like rules on LOG_ACCEPT chain got removed incorrectly
during some iptables-save/iptables-restore operations

Thanks a a lot Rob and Pandu

Regards
Ajay

On Sat, Mar 19, 2011 at 1:06 AM, Pandu Poluan <pandu@poluan.info> wrote=
:
> Which is why I always use all-lowercase for userchains. No chance of =
a
> mixup with TARGETs (they are always all-uppercase).
>
> Rgds,
>
>
> On 2011-03-19, Rob (lists) <lists@sterenborg.info> wrote:
>>> > If I change the LOG_ACCEPT to ACCEPT, strangely SSH starts workin=
g.
>>>
>>> Not so strange to me. Using the ACCEPT target, you're
>>> actually ACCEPTing the packet(s) whereas LOG_ACCEPT doesn't
>>> (do anything).
>>
>> Maybe this isn't clear.
>> ACCEPT is a final target: the packet will be accepted and that's tha=
t.
>> LOG_ACCEPT is a userdefined chain, not a target, but you can send
>> packets matching a rule to such chain for further processing. You sh=
ould
>> add rules to this chain that tell Netfilter what to do with a packet=
; if
>> the chain is empty, nothing will be done. The packet will not be
>> accepted, simply because the chain is called 'LOG_ACCEPT'.
>>
>>
>> -- Rob
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe netfilter"=
 in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>>
>
>
> --
> --
> Pandu E Poluan - IT Optimizer
> My website: http://pandu.poluan.info/
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
