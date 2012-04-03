From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: ip a a /32 or used netmask
Date: Wed, 4 Apr 2012 00:01:28 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1204032338140.425@frira.zrqbmnf.qr>
References: <20120402230510.8b17b5dbc6d1f421fe9476aa@lucassen.org> <alpine.LNX.2.01.1204031421590.15235@frira.zrqbmnf.qr> <20120403233239.13aac474bb84047ff90efec7@lucassen.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20120403233239.13aac474bb84047ff90efec7@lucassen.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org


On Tuesday 2012-04-03 23:32, richard lucassen wrote:
>
>> >Just a question:
>> >I have a NIC eth0 with address 10.0.0.1/24
>> >I want to add an ip address to that NIC. Both ways work:
>> >ip a a 10.0.0.2/32 dev eth0
>> >ip a a 10.0.0.2/24 dev eth0
>> >Is there anyhow some or other difference between the two? And is one
>> >of the two ways preferred?
>> 
>> The difference lies in the route that is implicitly added.
>
>AFAIUI this is valid if it's another subnet, e.g.:
>
>ip a a 10.0.255.2/24 dev eth0

Anything is valid (save perhaps for 0.0.0.0/::) for addition.
Don't think up artificial limitations where there are none.

>But as long as the added ip is in the existing range of the NIC, then
>there is no difference between adding a 10.0.0.2/32 or a 10.0.0.2/24.
>
>Right or wrong? Or am I still missing something crucial?
>
>R.
>
>-- 
>___________________________________________________________________
>It is better to remain silent and be thought a fool, than to speak
>aloud and remove all doubt.
>
>+------------------------------------------------------------------+
>| Richard Lucassen, Utrecht                                        |
>| Public key and email address:                                    |
>| http://www.lucassen.org/mail-pubkey.html                         |
>+------------------------------------------------------------------+
>--
>To unsubscribe from this list: send the line "unsubscribe netfilter" in
>the body of a message to majordomo@vger.kernel.org
>More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

