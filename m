From: Duncan Roe <duncan_roe@optusnet.com.au>
Subject: Re: libnetfilter_queue: Access conntrack info
Date: Tue, 29 Jun 2021 12:20:11 +1000
Message-ID: <YNqDW5tRMVkjrXfC@slk1.local.net>
References: <CAFqmWq_4_8ubgpfdEfhhQ=+7YbKCrPp=aTXsixAeYrK5VA+B2w@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:date:to:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=8Qnetr/a2lZSad8KllzdmHp1QCwLakcjQVl67jonOmA=;
        b=TFowBV6Ro1EiWqwmQyPBSMQLgdJ/6K7kVqd7z6RrTuQ/3rpvwSNeLGGNsuecJSss0e
         OKqjhRlHp7vn/IG+w9ET/OeQ3v9ZqFSNOYExDBdUfhe5MtWmfeVI+uj2SMUZfv88k0ht
         hz1MSNswxc9WuxV+ETaGUSBxhP1Na7OVrAV+CziavJdbGJCzwwvQ2ZLetcwzrWLpkjzm
         MK91X4OHSK2PkgCT8yf8QG1U0PTMAwrNd7Y54KXYZEj6rlRtmGZQag0Vc/lFp0m5V+FT
         883sRg2MZZzE3VYtwmckh1J0qe6XoGfc+vnXXSF/4x6Mil5ix+39feoAdrTdF2iYG6rW
         To8A==
Sender: Duncan Roe <duncan.roe2@gmail.com>
Content-Disposition: inline
In-Reply-To: <CAFqmWq_4_8ubgpfdEfhhQ=+7YbKCrPp=aTXsixAeYrK5VA+B2w@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

On Sun, Jun 27, 2021 at 10:07:18PM -0600, Psyspy 22 wrote:
> Hello,
>
> Good morning! I am using the nf-queue.c example from
> libnetfilter_queue repo. In the queue_cb() function, I am trying to
> get the conntrack info but this condition is always false.
>
> if(attr[NFQA_CT])
>
> I can see the flow in conntrack -L output. Anyone know what I am
> missing? Appreciate your help!
>
> Kind regards.

attr[NFQA_CT] is for a connmark. Please try attr[NFQA_CT_INFO].

Tell the list how that went,

Cheers ... Duncan.
