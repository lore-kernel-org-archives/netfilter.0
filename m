From: SplitIce <mat999@gmail.com>
Subject: Re: Default netfilter kernel buffer size?
Date: Wed, 25 Jun 2014 17:12:13 +1000
Message-ID: <CALFfGYbhKy-jTPJwbow_g67ykyq89dnZBmyjX-VJ9B-QMaxTrA@mail.gmail.com>
References: <007501cf8685$69b9a460$3d2ced20$@gmail.com> <20140616093502.GA8007@localhost>
 <01e601cf8966$ed0b6450$c7222cf0$@gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :content-type;
        bh=AcevNuIyaqIxQ77mifqHYdL6EX1gdxoU08q4ZyZvKKY=;
        b=b01/nogiym9X/fsL3txYMCQQ8z6gNustpG7Lr9KjXCKeI+9i2udZxhgQLQIr+0NkFm
         t6B7jX7R36pCexUz2Im83hM3ZAzMZnXKfgIq3Ux3q5FUWSCFvvs8f35AIeSs7wVBF3pp
         dFDKb5eklg9DUNUPqTRK0chEK0jpqkK+dyvIj8b06nCRWyx62MqRIDdbN655zHO6murp
         VZu08sn/uqOaVORRd7HeMHXOxZRWSeftyAhZnBatzdqIQpmbDaqnhLhR5JpgKw0AZuCe
         ThyzSbOUC+6uft9gLRB29AkUMPMzglLVTnfiojT69FGzKRXPEaMlnybwjfWj3S2Rsjfz
         iHTw==
In-Reply-To: <01e601cf8966$ed0b6450$c7222cf0$@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter <netfilter@vger.kernel.org>

I too have a question in regards to this,

Ive been facing the same problem with some code of my own. I am using
a nf netlink socket via libpcap (nflog:{ID}) and experiencing ENOBUFS
during peaks.

I attempted to use
setsockopt(pcap_fileno(p), SOL_NETLINK, NETLINK_NO_ENOBUFS, &(int){1},
sizeof(int));

before

pcap_activate(p);

without success. Suggestions? Cade, did you resolve the problem?

On Mon, Jun 16, 2014 at 11:28 PM, Cade Robinson <cade.robinson@gmail.com> wrote:
>> Please, have a look at the documentation:
>
>> http://www.netfilter.org/projects/libnetfilter_queue/doxygen/
>
>> It refers to this problem.
>
> Thanks - that gives me more ideas of what to do if my current fix doesn't
> work.
> What I have done is added code to set queue length using
> nfq_set_queue_maxlen.
> This seems to have worked as well so far.
>
> But what I am looking for and can't find is what is the default queue length
> and is there a /proc file that shows the current length?
>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
