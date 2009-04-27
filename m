From: "Jorge Bastos" <mysql.jorge@decimal.pt>
Subject: Re: Dynamic IP address in a rule?
Date: Mon, 27 Apr 2009 09:56:27 +0100 (WEST)
Message-ID: <1970.192.168.1.3.1240822587.squirrel@webmail.decimal.pt>
References: <3e67fcb10904250512s67c79f70ref8af8655d33c8da@mail.gmail.com>
    <3678.87.196.49.84.1240774988.squirrel@webmail.decimal.pt>
    <3fdd6ce00904261538m20468fedudf11ffd6448c8473@mail.gmail.com>
    <1822.192.168.1.3.1240821057.squirrel@webmail.decimal.pt>
    <49F5724A.80509@tootai.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <49F5724A.80509@tootai.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Daniel Huhardeaux <daniel.huhardeaux@tootai.com>
Cc: netfilter@vger.kernel.org

>> That is no solution. it may be for your cenario but not for the most of
>> people. Just think, if who makes the connection is a modem, and you have
>> your *unix machine on nat, that won't work
> It works. You can:
>
> a) run a script to connect to your modem via http (eg wget), extract
> your IP and reload iptables rules
> b) if you can't connect to your modem, run a script to go to
> http://www.whatismyip.com/tools/ip-address-lookup.asp and do the same
> that above
>

It's pretty much what i said, a script to do the job.

