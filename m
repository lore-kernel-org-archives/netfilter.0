From: Psyspy 22 <psyspy2020@gmail.com>
Subject: Re: libnetfilter_conntrack: ABI breakage error
Date: Sat, 22 May 2021 12:04:31 -0600
Message-ID: <CAFqmWq_dFMOaUz6sK1hmd_jc38SRd6WqBArqjfKu+wULxDcx=Q@mail.gmail.com>
References: <CAFqmWq9r95YtvNc+eYwHcL+oDutgL+g++tPZBsr9yh2KrNveNw@mail.gmail.com>
 <20210521215632.GA3619@salvia> <CAFqmWq_rRH8_XydrUdFgmG0kYe1+xXJucp7XZbEows5DE=qxbg@mail.gmail.com>
 <20210522111451.GE3559@breakpoint.cc>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pKCGIqf7wrYtMC3afx/XINxVjusLkdjXIEL1A8Z3r+c=;
        b=M2w0h157C3POlqofFwJIOiVBKtt+kV40M3dzN6SeZw9F6/jW6b+JFPVx936i/jUwDL
         pwGtsd5/v8dmXvKyWW6mOHcqkugwPS60C5sNbVA4oRGheobzepK/eqxOxtxNVlCPLXon
         xyMflokXSJeeku0RhkNo8+X+NtrT4VogJLvq5WisAn7JB+8I1eVEkstQvYrhzhaAYfCW
         hUqAwrLybWF/LjvAZPJL602X2horOBNLdFxyi4GNNjNd4BPWPqOK4tpRe6eRPm/C0WpV
         2jU3UX5wB7rMh/owGettcAjO+P6NYSUVLQ/dZaKtp4ib4DBGwJaT+0OX+p0XSCf6nEnA
         i9qg==
In-Reply-To: <20210522111451.GE3559@breakpoint.cc>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Florian Westphal <fw@strlen.de>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>, netfilter@vger.kernel.org

Hello Florian,

I found the issue. You are right, there is no synproxy in 4.1. Yet, it
still hits that switch case and tries to validate it as u32 type and
then fails. Good thing that the vendor distributes kernel sources in
their forum.  They have modified ctattr_type and appended a new
attribute: CTA_MARK2_64. This clashes with CTA_SYNPROXY. Never
imagined something like this would ever happen.

I used the libmnl example and parsed the netlink message myself. It works.

Thank you! I was able to find the issue based on your clue. Have a
great weekend.

On Sat, May 22, 2021 at 5:14 AM Florian Westphal <fw@strlen.de> wrote:
>
> Psyspy 22 <psyspy2020@gmail.com> wrote:
> > Hello Pablo,
> >
> > I cross compiled the application. Host/Build: Ubuntu 20,10, x86_64.
> > Target machine: aarch64, Linux kernel: 4.1.
>
> 4.1?  There is no synproxy support in that version.
>
> Are you passing unitialised garbage data to the library by mistake?
