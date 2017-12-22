From: paulo bruck <paulobruck1@gmail.com>
Subject: Re: limit + log + tcp not working ?
Date: Fri, 22 Dec 2017 18:52:32 -0200
Message-ID: <CANSGRxROfErREdSKv4ooheYPD-bT3r33h1LTkDqeHryvTOBBPQ@mail.gmail.com>
References: <CANSGRxTJHLttrZw6Oy+mfxN07ow_fq9yuO=X=JsJv6wuLDgSjg@mail.gmail.com>
 <64babe0d-7b38-1f6f-e192-1f4aa79a0fd6@pobox.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:cc;
        bh=Thk9SnBndztOc/CavUwf2eya0/gaTOzBkuTMuWON9qg=;
        b=OWAB63Vzlljg/KIIPZDgmXnz6+HSOK1sRgSqT59VXDHrUjGJiDqrfQpfK9lDSmh1TG
         udremb9BgKHlqbreIlv+YBNRSUf4OPkMsJhoSO/h13gFEG2DIS62npCSUIIecCIpYJWq
         kk02wRNM5vxgPHScDsnD9wKWcXPHi/5glgvJZ2zkfgC9u6HkVellF7xF6rOsG5l3nt8m
         1hCVF1pepPm7XGdnCA/qgGkZRUC9TkKz9ZtvXzMbk8EPPRYzaeTZc0NHU82nk/rbAXy8
         YP/aZvD0CqRzGm3hcO/rumQLlQFFSDjGgh1pxahjcvB/xNR6nZ9GvfAzxTLkbte1zyNm
         B8Mw==
In-Reply-To: <64babe0d-7b38-1f6f-e192-1f4aa79a0fd6@pobox.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: 
Cc: netfilter@vger.kernel.org, pauloric <pauloric@contatogs.com.br>

thanks Robert

My bad 8(  I choose a wrong example.

Changing to kbytes now I see traffic throw rule.
What I'm trying to understand is the sequence and meaning of limit
taking different positions inside a rule.


counter packets 7077 bytes 690164 limit rate 10 kbytes/minute counter
packets 0 bytes 0 tcp sport http counter packets 0 bytes 0 log prefix
"acesso a porta 80" flags all counter packets 0 bytes 0

If I use limit + tcp + log  as above means:

1) count all packages that enter rule.
2) limit to 10kbytes/minute
3) count again w/ another counter
4) if package is tcp sport 80 continue throw rule
5) count again w/ another counter
6) log package
7) count again with another counter

All packages that passes in this rule must pass throw all parts

. Limit in this rule means that I am limiting all packages that enter the rule

And  this rule below limit has another meaning. Am I wright? Is  it
going to limit logs or not?


counter packets 7077 bytes 690164 tcp sport http counter packets 54
bytes 15716 log prefix "acesso a porta 80" flags all counter packets
54 bytes 15716 limit rate 10 kbytes/minute counter packets 0 bytes 0


Thanks for your patient w/ me 80)

2017-12-22 17:45 GMT-02:00 Robert White <rwhite@pobox.com>:
> On 12/21/2017 02:03 PM, paulo bruck wrote:
>> counter packets 7077 bytes 690164 tcp sport http counter packets 54
>> bytes 15716 log prefix "acesso a porta 80" flags all counter packets
>> 54 bytes 15716 limit rate 10 bytes/minute counter packets 0 bytes 0
>>
>> counter packets 7077 bytes 690164 tcp sport http counter packets 54
>> bytes 15716 limit rate 10 bytes/minute counter packets 0 bytes 0 log
>> prefix "acesso a porta 80" flags all counter packets 0 bytes 0
>
> Read those limits again...
>
> limit rate 10 _bytes_ per _minute_.
>
> That rate limit will _always_ fail as it is too short to even admit a
> single HTTP request header. "GET / HTTP/1.1" is already 14 bytes before
> the CR/LF that ends the line.
>
> If you want ten _packets_ a minute you need to use "limit rate
> 10/minute" not "limit rate 10 bytes/minute"
>
> So the limit is a test expression, and it is failing as it should, and
> that ends the rule evaluation so none of the subsequent elements of the
> rule take effect.
>
> --Rob.



-- 
Paulo Ricardo Bruck consultor
tel 011 3596-4881/4882  011 98140-9184 (TIM)
http://www.contatogs.com.br
http://www.protejasuarede.com.br
gpg AAA59989 at wwwkeys.us.pgp.net
