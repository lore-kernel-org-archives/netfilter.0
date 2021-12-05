From: Duncan Roe <duncan_roe@optusnet.com.au>
Subject: Re: Meaning of "." (dot) in netfilter
Date: Sun, 5 Dec 2021 12:34:04 +1100
Message-ID: <YawXDEt0yjUQadKC@slk1.local.net>
References: <CAK3NTRAQE7UD9_0EuzyS0UGQ_s++Dg_hbZPXscHBrStnGJHGjw@mail.gmail.com>
 <YascpztWuzJgKRgq@slk1.local.net>
 <9d66247c-51c5-b2d9-584b-0422c99d08bd@average.org>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:date:to:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=HSu5QIKy/jOkeLrHT2aR9NRCh5+6hFGsAB+C91G37kQ=;
        b=KMFRaG5eoacMOg6+WbBWa5z4WivDNCCCVei5nhKjl+7JD/2+5JXlSyr4iCNQqV9vA8
         QVUBmVilKXVYlHD6C0oFjE0y5L5BbKhkS7aLPSprvH0Z//Wyi78tq817W+g85vIUJL6t
         LNc+W5e8bj85uFlWw/Qcloptj3fEO4xWnnvcl+Bw4v1ijQnToqXKoEwzLg7GLatpfeVM
         zdlKz1x4zYB+xIsViP14Q2EVJ5aDFZmywvq9toNcPAAFvS/Ts1uztUqM5+9E/y2nRaH2
         RlpS/SDqtTmBedZzOnrtGp8PproCO6MsM9A2NuRL/Us+YF+V8W8mRtuRXUpIDB0EkQZ1
         YuHg==
Sender: Duncan Roe <duncan.roe2@gmail.com>
Content-Disposition: inline
In-Reply-To: <9d66247c-51c5-b2d9-584b-0422c99d08bd@average.org>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org, Netfilter Development <netfilter-devel@vger.kernel.org>

On Sat, Dec 04, 2021 at 01:05:21PM +0100, Eugene Crosser wrote:
> Hi Duncan,
>
> On 04/12/2021 08:45, Duncan Roe wrote:
>
> > "." is the symbol for concatenation. It's been missing from the man page
> > forever.
> >
> > I was going to submit a patch to add "." but wasn't really sure when you could
> > use it so I never did.
>
> It is my understanding that the only use for concatenation is to define
> composite value for the key in a `map` / `vmap` or the element in a `set`. Maybe
> someone more knowledgeable can correct me.
>
> Regards,
>
> Eugene

I thought it was set definition in general. Again, someone more knowledgeable
can correct me.

Cheers ... Duncan.
