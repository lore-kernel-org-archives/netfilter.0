From: Matt Zagrabelny <mzagrabe@d.umn.edu>
Subject: Re: counter target
Date: Thu, 31 Aug 2023 10:49:44 -0500
Message-ID: <CAOLfK3XEZLpR8GUnZNTg+0rdGsJHs+Lr2_Ze1FA243UhnWDHKw@mail.gmail.com>
References: <CAOLfK3WNwrokC54pspxSN89OHrfW2RTTyGsj2kBYaf-c1H-DPw@mail.gmail.com>
 <ZOu75rSEGwJOleQB@calendula> <CAOLfK3UMF7V2izJfdTUMymiR=To8=icytybWXP8Md6fM1rOgDg@mail.gmail.com>
 <ZPCye6qKuWeFAnCU@calendula>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p8.oit.umn.edu 4Rc5Fx5Ycgz9vKMJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=d.umn.edu; s=google; t=1693496996; x=1694101796; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cg43ATLYEb28JPjhsIla+ZUS/IMM8Jn9w51hJ8K1LHM=;
        b=KQ4JFP2LQ7u+l2J4yPKOyWmV72+2wyvlgvlYLNgIiX3Xfod2EngRa1O7IVFLv1gWAv
         FsMkBlj/+4H77ixEAMR8hG6pbpt9xIkpyTI8iXqH7IYRbkWZ+6N4VcDuCsDvRDK6TXlm
         w1h/hvQexn/IqJlcslDF6CT0zLhnadrFckNs+YGPwR9pfSJNFwU+fhabbiVDxX24nitF
         zE34p+W+qQc3QvzwmGiVlp+XYRbmgK0SMq47OQq872AuBDWdd6WvVjA2OWKrx8XyMqCX
         TXqMmurpk0zvHcvFS4QzjQYchn5YCt4U/tFNUIdQKzikZdSYCRGEAlBxqbkAoxj3vzMX
         +GCA==
In-Reply-To: <ZPCye6qKuWeFAnCU@calendula>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter <netfilter@vger.kernel.org>

On Thu, Aug 31, 2023 at 10:32=E2=80=AFAM Pablo Neira Ayuso <pablo@netfilter=
.org> wrote:
>
> On Thu, Aug 31, 2023 at 10:25:15AM -0500, Matt Zagrabelny wrote:

> > Is there a way to count the packets that get evaluated by the default
> > policy of a chain?
> >
> > I know I can put a counter after all my rules, but it seems like it
> > would be nicer to somehow integrate it into:
> >
> > chain IN {
> >         type filter hook input priority filter; policy drop;
> >
> > for example:
> >
> > chain IN {
> >         type filter hook input priority filter; policy counter drop;
>
> Perhaps you mean something like this syntax:
>
>          type filter hook input priority filter; counter; policy drop;
>
> to enable basechain counters.
>
> No, this is not supported.
>
> > ...but the above fails.
>
> You have to place a counter after all your rules to count those that
> reach the basechain as you suggest.

Would netfilter-dev consider a feature request for adding a "counter"
option to the policy of section of a chain? Or has it already been
suggested and rejected?

Thank you for the dialogue!

-m
