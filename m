From: Kiernan George <kbg98@vt.edu>
Subject: Re: ABI Breakage - nftnl_rule_parse_attr_cb
Date: Wed, 22 Jun 2022 09:24:25 -0400
Message-ID: <CAOg40qjdS1VA9tOOVitryo7eB4HFk5x0Gzp4JX8e5=LSa6RDEw@mail.gmail.com>
References: <fb274774-b42e-fce8-7018-2c21a93a4d38@vt.edu> <YrLGi2k9+PvMJepi@salvia>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vt-edu.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=IjKiil8dfdKujY5hCvLE3b6f6q0CMcR2f7kptv/cAXE=;
        b=lYeQhRCz57Ci/NbWhUpxd7palCOsGF928ZRU6hoDprZvhJ3naw64p+RCSuztRu9UH1
         FA1rbCZQY6Smir4FFpJ8EmPK/4dJ7bnICQ8MfZ08PW4n/ImkInK/h7xu0VuckWdBq+09
         L/SqES7JllFY21CL56yLFEGn9fyhQeiH9Z34O6JSbfDRX2XmrqosFBA0FPbaRdQXrInU
         UMF/MU8E/AELDlv3feTx3szdLREVqCZdxbsY2ew0O1i/uWdOh8Rf9kjpA9FCbMmgo15c
         DqGiz9XbScfD66ngKFdsmZUrCFqSLkdnoP9tADEjGMGG6ZSmAOZCiq9EuDU3n7mNURYK
         fSkA==
In-Reply-To: <YrLGi2k9+PvMJepi@salvia>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

This is the relevant line where I build my header:
nlh = nftnl_rule_nlmsg_build_hdr(mnl_nlmsg_batch_current(batch),
NFT_MSG_NEWRULE, family, NLM_F_APPEND | NLM_F_EXCL | NLM_F_CREATE |
NLM_F_ECHO | NLM_F_ACK, seq++);

If I remove NLM_F_ECHO, it fixes my issue, but I would prefer to keep
this unless there is a better way to get the created rule's handle. I
also set the handle directly:
mnl_attr_put_u64(nlh, NFTNL_RULE_POSITION, htobe64(handle));


On Wed, Jun 22, 2022 at 3:36 AM Pablo Neira Ayuso <pablo@netfilter.org> wrote:
>
> On Tue, Jun 21, 2022 at 08:07:24PM +0000, Kiernan George wrote:
> > Hi,
> >
> > I am getting an ABI breakage error at these lines in rule.c:
> >
> > case NFTA_RULE_HANDLE:
> >         if (mnl_attr_validate(attr, MNL_TYPE_U64) < 0)
> >             abi_breakage();
> >         break;
> >
> > It only seems to happen when I set the flag NLM_F_ECHO in
> > nftnl_rule_nlmsg_build_hdr. I want to hold onto the rule handle of the
> > returned rule, which is why I set it to echo. This error was not affecting
> > me in Ubuntu 20.04, but started as soon as I upgraded to 22.04. I am running
> > Linux kernel version 5.15.0-39-generic with libnftnl-dev version
> > 1.2.1-1build1.
>
> That's very strange. Could you post a sample code?
