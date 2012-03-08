From: Abhi Devireddy <abhi@devireddy.com>
Subject: Re: Run a userspace script upon rule matching?
Date: Thu, 8 Mar 2012 12:00:19 -0600
Message-ID: <CA+tq5hwxmCGNCSRcka9Rp_k2rM+ZvetHtA6ufb3y8kQkUDZEVQ@mail.gmail.com>
References: <4F58AA04.4010805@brain-force.ch> <1331227169.30413.432.camel@andrew-desktop>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:from:date
         :x-google-sender-auth:message-id:subject:to:cc:content-type
         :content-transfer-encoding;
        bh=/BgqDzdBt4iz8+2hfisttQqg8pdBmt+wROArciS8InM=;
        b=WYk9QDoi6OeC9PjWQGjQPi2FHP+zJLscovHH8tqi/doR1O2dALUHtJkWZ7jBBqaqF0
         YQEUsdPHjHwZx/ubmSfzfEtwbdjMCYBFR852rrlmY0YuvsnJXi/Sof+uPQO5R0I1cbqq
         8VpdjPLJhewa539QEk7CDv+DBofVYIjtaquNfRE7Fl7LJM71/nMrCMlpYd0RCeWGN5XP
         gUOc1XYrq0U58FkCpfico8k/4drg3u65WqzjHJD1pBKEeq2tlCLNQhqlq8ljIkTSmdSH
         agYsojm5itk0Y/pmnvyyWcIMakoIEJ6RMCEpkigOTgj7JwdcHMuGeaOSfnz4uwxfrZS4
         cFug==
In-Reply-To: <1331227169.30413.432.camel@andrew-desktop>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Andrew Beverley <andy@andybev.com>
Cc: tobster@brain-force.ch, netfilter@vger.kernel.org

I'm fairly new to netfilter as well and this might or might not be help=
ful.

The netfilter hacking document available here:
http://www.netfilter.org/documentation/HOWTO//netfilter-hacking-HOWTO.t=
xt

Talks about the various hooks that a program can register for. Maybe
that would be a feasible way of calling a script.
The flow might look something like this: Call hook on packet receive
>> Check against filters >> [Perform your operations] >> Send out one
of the 5 status for what to do next. (NF_ACCEPT, NF_DROP, ...)

I was in the same boat trying to find something that would call a
remote API endpoint for all packets that matched a filter.

Hope that helps,
Abhi

On Thu, Mar 8, 2012 at 11:19 AM, Andrew Beverley <andy@andybev.com> wro=
te:
> On Thu, 2012-03-08 at 13:45 +0100, tobi wrote:
>> As mentioned in subject I want to run an external script upon matchi=
ng
>> of a certain rule.
>
> I'm not aware of any way to do that. What exactly do you want to
> achieve? It may be that there is another way of doing what you want.
>
> Andy
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =C2=A0http://vger.kernel.org/majordomo-info.ht=
ml
