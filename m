From: Hendrik Visage <hvjunk@gmail.com>
Subject: Re: Parsing conntrack entries
Date: Sat, 3 Jan 2015 09:51:28 +0200
Message-ID: <CADtGFvk5T6x=KAwqdv=rD0dKV_p7wSVfM4gmM42Hxun00aOFMg@mail.gmail.com>
References: <54A5C6CE.6090409@conversis.de>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=zLMTfAZisVcdDtJ8SDvcWYhtwWMs/8Je3e42UQrAmbY=;
        b=NxsmS4NUmtCEKQHPRqC6r5JrHs3DXGcp3up5oNThIZaW4GBO6qLyRvZsUjw+eCshog
         +xCrLj5rl3grP27RRYGwsoogGJCbblj6nfFdAjXdvi+vnotOkQZS5G1Eqis5Wq/uAU7d
         w5zTYimZWbMKXuCm0Ixaij/3DM7A8+dfe7oF3ma/vmi2jrd9+y3qh2MSgbMmp12cY+7h
         mPsJCpTHBVnN708XotacY60WAC+sY3C9DZV+XGz/EjDIt9Iluu8MsRmdkQv6MGi30rJ4
         CeG5DJ6jA9Qnprspb3JOgWo49G/mX91Lmdxu+tEL5k+cVQepYVuDavEjnYSlZcLk4tsz
         6MhA==
In-Reply-To: <54A5C6CE.6090409@conversis.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dennis Jacobfeuerborn <dennisml@conversis.de>
Cc: netfilter <netfilter@vger.kernel.org>

On Fri, Jan 2, 2015 at 12:14 AM, Dennis Jacobfeuerborn
<dennisml@conversis.de> wrote:
> Hi,
> I'm trying to write a small python script that creates some statistics
> from the current conntrack entries of a system. The problem I've run
> into is that I cannot find a good description of the output format of
> the conntrack tool and while I initially though the format is reasonably
> straightforward to deduce I ran into some snags.
>
> The format of a line not only changes with protocol and entry state but
> even entries with the same protocol and state seem to have different
> formats:
>
> tcp      6 3 CLOSE src=<IP1> dst=<IP2> sport=X dport=Y src=<IP2>
> dst=<IP1> sport=Y dport=X mark=0 use=1
>
> vs
>
> tcp      6 3 CLOSE src=<IP1> dst=<IP2> sport=X dport=Y src=<IP2>
> dst=<IP1> sport=Y dport=X [ASSURED] mark=0 use=1
>
> Why does one entry contain the [ASSURED] but the other does not?
>
> Also for some connections I see the [ASSURED] near the end of the line
> but for others I see an [UNREPLIED] in the *middle* of the line and no
> flag near the end of the line.

You have had a look at conntrack -E's output to see those transitions
happening in the [UPDATES]s?

>
> What is the meaning of the "use" field?
>
> What is the best way to parse this information in a reliable way?
>
> Regards,
>   Dennis
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
