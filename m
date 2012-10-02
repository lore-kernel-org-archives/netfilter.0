From: Net Warrior <netwarrior863@gmail.com>
Subject: Re: More that one not ! condition in a single rule.
Date: Tue, 2 Oct 2012 08:13:11 -0300
Message-ID: <CAP7y58M2yL5QC=umTFqFVS7XzU-FzeEYN1YKGoT2CsrKrWG61Q@mail.gmail.com>
References: <CAP7y58PK9++n7ueLtQd8okKpqhhAeSBFYnO+JLeK60M-_Fqsbg@mail.gmail.com>
	<20121001213202.GN3672@harrier.slackbuilds.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type;
        bh=2+d3aCMyAF2UCh3j1lcgmMlEzI6SW1bQbyeyCViSJNY=;
        b=nDlZosyxWHUBfSbYcq+K+nqeDJFNoQaEyhJp8O5rGO1kT8Dku8RYGjrBg2m+JUB/dv
         9f2qqRddSwRQFNdR29iPF94p7sq4/F0hqEkrepvV4LQoj2IFXnrkFsvEiBMCObuwz8Kx
         uSAewzSj2XaevJ44FCx29m+jjLaZtN8EP91kYZI2YhfGzEV1+LL+6pKY9XFw4BUSpg6S
         3bHc9FTTOcmxD8kQKodDLrp4yaoqBy54wIuBsKtbGkeb52R7ACusrQJk82DL+HxFvdhk
         d5H6wMvZEd4qn5JUcYYEspbKPfOu6yE67FXSYQB6GH+Pb85Tv2Z0AgLElzXy1lP+/BAy
         2SBg==
In-Reply-To: <20121001213202.GN3672@harrier.slackbuilds.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Ok, that's what I want to do , I'll have to user separate rules for
the IP's that I do not want to be logged.

> -A AUDIT-RULE -d $D_INT ! -s x.x.x.x -j RETURN
> -A AUDIT-RULE -d $D_INT ! -s y.y.y.y -j RETURN
> -A AUDIT-RULE -d $D_INT -m limit --limit 10/s -j LOG

Thank you very much.
Regards.

2012/10/1 /dev/rob0 <rob0@gmx.co.uk>:
> On Mon, Oct 01, 2012 at 03:14:10PM -0300, Net Warrior wrote:
>> Does anyone know if it's possible to include more than one ! not
>> clause in a single rule ?
>> I' have the following
>>
>> IPTABLES -A AUDIT-RULE  -d $D_INT  ! -s x.x.x.x \
>>          -m limit --limit 10/s -j LOG \
>>
>> I'd like to include other IP's, do I have to duplicate the sentence ?
>
> In addition to Andy's good suggestion, you should think about what
> the second negated rule would mean.
>
> "If the destination is not $D_INT and the source is not x.x.x.x, log
> this packet not exceeding 10 per second." The source is y.y.y.y, so
> your rule matches, and it's logged. The next packet is from x.x.x.x,
> so the rule does NOT match and is not logged. *Both* packets then
> proceed to the next rule.
>
> So then your next rule might be:
> -A AUDIT-RULE -d $D_INT ! -s y.y.y.y -m limit --limit 10/s -j LOG
>
> The packet from source y.y.y.y does not match and is not logged. But
> the following packet from x.x.x.x DOES match, and IS logged. Was that
> what you wanted? I bet not.
>
> You probably want something like another user chain, or maybe some
> RETURN rules before a blanket LOG rule at the end of this one, e.g.:
>
> -A AUDIT-RULE -d $D_INT ! -s x.x.x.x -j RETURN
> -A AUDIT-RULE -d $D_INT ! -s y.y.y.y -j RETURN
> -A AUDIT-RULE -d $D_INT -m limit --limit 10/s -j LOG
> --
>   http://rob0.nodns4.us/ -- system administration and consulting
>   Offlist GMX mail is seen only if "/dev/rob0" is in the Subject:
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
