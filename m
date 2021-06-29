From: Psyspy 22 <psyspy2020@gmail.com>
Subject: Re: libnetfilter_queue: Access conntrack info
Date: Mon, 28 Jun 2021 22:02:30 -0600
Message-ID: <CAFqmWq-kOQbjQ=tNWGuk=+yOtuoG98cvRueoT5oK_zNHy8Jfvw@mail.gmail.com>
References: <CAFqmWq_4_8ubgpfdEfhhQ=+7YbKCrPp=aTXsixAeYrK5VA+B2w@mail.gmail.com>
 <YNqDW5tRMVkjrXfC@slk1.local.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=0lJyDVSCa1DzSQa/MOaFISMl/jO5dRakdkqhalqtj8U=;
        b=MSK7J/E4nq7y/o6I+4tp9zRfzlaC1emmv1FpMvvNwjdrQaF8TiyXSYNGrhNxG8apVV
         3tdHYejb6CHyVWTjf29XJICzO7PhLLUBE1LVI7YCm5WO6FolZ0ciUwzZYL8q0ihma6ic
         da6FdnnsdeZzfvRyhsw1gB+IshSdqKAFiFtI1nd9roU9vpPASEjHUZfMlfhp8VTyt9Fe
         Qd3vu2qiK58EMZMQrjzitXSn7oHE9VEf3VGhPG10qK8nH4lJeej60q4E+dJLDaZuDcVn
         EAOJ6u8q6XyiiWFtOGT6QPRokcQj/HxFlN4wztGJ06+JcYTbZ0DxINmAiDwzN14oxWM+
         Nqig==
In-Reply-To: <YNqDW5tRMVkjrXfC@slk1.local.net>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello Duncan,

I actually need connmark and other conntrack fields like secmark etc.
I think attr[NFQA_CT] is the correct way to access it but it's empty
in my case.
The libnetfilter_queue example sets connmark but doesn't show a way to
get connmark from the packet.

Thanks!

On Mon, Jun 28, 2021 at 8:20 PM Duncan Roe <duncan_roe@optusnet.com.au> wrote:
>
> On Sun, Jun 27, 2021 at 10:07:18PM -0600, Psyspy 22 wrote:
> > Hello,
> >
> > Good morning! I am using the nf-queue.c example from
> > libnetfilter_queue repo. In the queue_cb() function, I am trying to
> > get the conntrack info but this condition is always false.
> >
> > if(attr[NFQA_CT])
> >
> > I can see the flow in conntrack -L output. Anyone know what I am
> > missing? Appreciate your help!
> >
> > Kind regards.
>
> attr[NFQA_CT] is for a connmark. Please try attr[NFQA_CT_INFO].
>
> Tell the list how that went,
>
> Cheers ... Duncan.
