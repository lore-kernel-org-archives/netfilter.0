From: Psyspy 22 <psyspy2020@gmail.com>
Subject: Re: libnetfilter_queue: Access conntrack info
Date: Tue, 29 Jun 2021 08:22:23 -0600
Message-ID: <CAFqmWq-J8zkO8_nHUh=eS_AyhHJ6kAgPiODXu5wKNQM-d7TRLQ@mail.gmail.com>
References: <CAFqmWq_4_8ubgpfdEfhhQ=+7YbKCrPp=aTXsixAeYrK5VA+B2w@mail.gmail.com>
 <YNqDW5tRMVkjrXfC@slk1.local.net> <CAFqmWq-kOQbjQ=tNWGuk=+yOtuoG98cvRueoT5oK_zNHy8Jfvw@mail.gmail.com>
 <20210629063802.GD24271@breakpoint.cc>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=V7UERpivZQ3ix087h3oQS3Djh5mZ0nojND+xtah4iI4=;
        b=WlmH0bL7MDjuqoi8Sy4rrthHcGq3z8a3zsKcGaqGK8TAMs1nE8cqJukzrBq8S9YUiF
         WG/vasTzcobIuum2zemusfoxWi6hiqVdEG2XVhfuT5dlePX77BwrX0VrSwkjpuQ5j4fI
         Sh73HgjGNm/HHJxkhuyYiXaEU8PiM+YDcBYkDL4kG2tkmPPGpnI6ZzUCjLkIwtTXMh67
         MQz40HPp+oeZoaL6uNdmKguB5lp4TctLFWzd3moxWT4/cpamjt5Oz4CATd++7Wqgvj3p
         caCqW4AU2Bumlj9EY9bJdkb004Xqb9WobfgHC1Dcv+D10buRFSyR67AAiNkkAspDlWpo
         KHLQ==
In-Reply-To: <20210629063802.GD24271@breakpoint.cc>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Florian Westphal <fw@strlen.de>
Cc: netfilter@vger.kernel.org

Thanks Florian. I added that flag, no dice.

If  I run the libmnl dump example, it successfully prints all
conntrack entries. I would assume all the conntrack related kernel
modules are loaded. I am on 4.1 kernel. I could be missing something.

On Tue, Jun 29, 2021 at 12:38 AM Florian Westphal <fw@strlen.de> wrote:
>
> Psyspy 22 <psyspy2020@gmail.com> wrote:
> > Hello Duncan,
> >
> > I actually need connmark and other conntrack fields like secmark etc.
> > I think attr[NFQA_CT] is the correct way to access it but it's empty
> > in my case.
> > The libnetfilter_queue example sets connmark but doesn't show a way to
> > get connmark from the packet.
>
> IIRC you need to set NFQA_CFG_F_CONNTRACK in NFQA_CFG_FLAGS when setting
> up the queue.  The example only sets F_GSO, so no conntrack info is
> added.
