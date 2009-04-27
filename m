From: Ivan Petrushev <ivanatora@gmail.com>
Subject: Re: Dynamic IP address in a rule?
Date: Mon, 27 Apr 2009 10:08:22 +0300
Message-ID: <d39744a20904270008h380ccf26q990c13b56ac8daf6@mail.gmail.com>
References: <3e67fcb10904250512s67c79f70ref8af8655d33c8da@mail.gmail.com> 
	<3678.87.196.49.84.1240774988.squirrel@webmail.decimal.pt> 
	<000001c9c703$2d3cabf0$87b603d0$@info> <d39744a20904262346p41c1b5fcy2f754a9263d09df3@mail.gmail.com> 
	<000a01c9c705$5c4c2db0$14e48910$@info>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :from:date:message-id:subject:to:cc:content-type
         :content-transfer-encoding;
        bh=CMiTJWcjm9NrHNp49ZT3oxO4tiD3qUi8KTGRZGAO7Gw=;
        b=afIOcOtDQSbgwDnsCR7sboJSYNXw2BVrc9KmEnp8ej1OVkwruZ6fs7nM+WfN9Lps6j
         NxON8hTrE+UdNmBU0f5ikPEEqMnNIADsFOBtS1i6/0ZyXjEM1xlIu0B1t3qD7NzQqdJS
         IXrguZ7gdFI3NKsVI3L6NgQcm/7d9jbI/Bt3U=
In-Reply-To: <000a01c9c705$5c4c2db0$14e48910$@info>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: lists@sterenborg.info
Cc: Netfilter <netfilter@vger.kernel.org>

Yes, ofcourse it won't work in that way :)
I can't think of a solution that does not include ruleset reloading
after X time... It would be best if you can bypass the changeable
"address" part of the rules with something else - like in/out
interface. It would work if your station doesn't have aliases and the
rules are not targetting specific host if the machine is a router.

On Mon, Apr 27, 2009 at 9:56 AM,  <lists@sterenborg.info> wrote:
>> > If iptables would have to perform a DNS lookup everytime a packet
>> > passes, I think it would be terribly slow and probably not usable
>> > for packetfiltering.
>>
>> Actually the DNS lookup is performed only once - in the time the
>> ruleis inserted/appended. If the DNS returns more than one IP per
>> name, a number of rules is inserted with each IP returned.
>
> Yes, that's more or less what Jorge described. My point was that if t=
he
> Netfilter framework had to perform a DNS lookup for each (new?) packe=
t
> that it has to check, I think it would be quite slow (think about DNS
> query timeouts, etc) and not so usable as it is now.
>
>
> Grts,
> Rob
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
