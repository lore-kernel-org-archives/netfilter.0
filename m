Return-Path: <netfilter-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23443C54E76
	for <netfilter@archiver.kernel.org>; Thu, 16 Nov 2023 22:58:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345532AbjKPW65 (ORCPT <rfc822;netfilter@archiver.kernel.org>);
        Thu, 16 Nov 2023 17:58:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229813AbjKPW64 (ORCPT
        <rfc822;netfilter@vger.kernel.org>); Thu, 16 Nov 2023 17:58:56 -0500
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92C6A120
        for <netfilter@vger.kernel.org>; Thu, 16 Nov 2023 14:58:53 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-5409bc907edso1986862a12.0
        for <netfilter@vger.kernel.org>; Thu, 16 Nov 2023 14:58:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700175532; x=1700780332; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KjmBCYb2AHcSDnNKYtpC3kOa+bLx9Qsvbst/+y6f0RA=;
        b=mN1PeH4R1grPdBNX3WlifVWLBjOg+SZUlSwnyt8Lj7CKAMjxMntxU8ReZb91UZhaDN
         SNaaQ0pUAGZjBcDLV2XrUf8zuP3kaDkYuB7hRQUyKhITwUs+2/qaiAMA1gdFQzIlYHCV
         t7exoliw5lzkO77uASSwQgzMJ2ak11ypi7UvYWKmteVAXYeFL6ZHzhqAtKFmkdJRA0YI
         oHKXJNKvNsSNvW/igb421HsI4HhZDDrP1nCfpxBmwEG6KhqiWGVt4IlevByAA5DpOIuD
         JB3IItaqXmlsWFLSsNu2wMxKJsumenBIa/WKep1/NsK6HAsevE8m7+lRklUz0Rr07Smm
         bz7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700175532; x=1700780332;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KjmBCYb2AHcSDnNKYtpC3kOa+bLx9Qsvbst/+y6f0RA=;
        b=B47OCsTuYr2VWVcvN9MpkqlFUt9qBb6y06uhwp+shjLtTALd/M7Se7Q+3XPId7f+1e
         EgmbNbLWvZ5r7PyTjDD1mHyiiC5ecDvEy+9YzMMFIXRABPPLgzULzDTPqtLgKX0M4cYt
         fPUphiztX7OmLRDhchSei760YyBsPtM0C45EF1Etyy5pth+idbcUhFFRUamOb+6uFGbL
         U888LTEpqtK19xDbwXT6/23egEy6fkLmZHVJ/e9V8g7juC7HvwpBcSu/e8APbnlUIPup
         b6NXVKMQhc8WjVMqYdsNkuUW1u3/sq31pXFp7tNFhCWylfeeOZrSVVFLl7dWSK6hRUPc
         Utzg==
X-Gm-Message-State: AOJu0YzpNeDgZqGm+RaeIEdvwerm0q3DhfOwpfxY6HItkHE3WlatpFxG
        KMmhQliJfxkV2Qa5nbeJqrb8VTWlsP2rDCWc0Ds8Z09XK4k2lQ==
X-Google-Smtp-Source: AGHT+IH7tgHe6H0roncVh4Z8vytTURr77DdVU/uax1TbzGXdeSJQWowSqRX8MRNg3XaFoPJ/qLs0e2CsQEIAC4GN/D8=
X-Received: by 2002:a05:6402:657:b0:53e:323a:274f with SMTP id
 u23-20020a056402065700b0053e323a274fmr12096262edx.42.1700175531583; Thu, 16
 Nov 2023 14:58:51 -0800 (PST)
MIME-Version: 1.0
References: <CAOoaxdH25O+QYWkzGQ7uOU5NLqROHu-WfpY4AZtVwb4V80=F=g@mail.gmail.com>
 <20231116211417.6e4d438986bebed9b8cf3fb8@plushkava.net>
In-Reply-To: <20231116211417.6e4d438986bebed9b8cf3fb8@plushkava.net>
From:   Brian Davidson <davidson.brian@gmail.com>
Date:   Thu, 16 Nov 2023 17:58:40 -0500
Message-ID: <CAOoaxdFjedx6N5kVG_7SuQ20kg8MtiYqt8Sr_Vxg0X34pgdVrw@mail.gmail.com>
Subject: Re: meta time/hour questions
To:     Kerin Millar <kfm@plushkava.net>
Cc:     netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <netfilter.vger.kernel.org>
X-Mailing-List: netfilter@vger.kernel.org

On Thu, Nov 16, 2023 at 4:14=E2=80=AFPM Kerin Millar <kfm@plushkava.net> wr=
ote:
>
> On Wed, 15 Nov 2023 13:33:05 -0500
> Brian Davidson <davidson.brian@gmail.com> wrote:
>
> > The man page states that meta time and meta hour optionally accept
> > seconds, but I get errors on v1.0.6 or v1.0.8. meta time doesn't even
> > like the dash date separator.
> >
> > # nft -c add rule inet t c meta hour "17:00:01" drop
> > Error: syntax error, unexpected colon, expecting end of file or
> > newline or semicolon
> > add rule inet t c meta hour 17:00:01 drop
> >                                  ^
>
> 17:00:01 is only accepted if double quoted, implying that the parser othe=
rwise considers it to be something other than a string. This may or may not=
 be a defect.
>
> Note that the double quotes given to your shell accomplished nothing. Ins=
tead, compare the following two commands, the first of which is equivalent =
to the command that you attempted.
>
> # nft -c 'add rule inet t c meta hour 17:00:01 drop'
> # nft -c 'add rule inet t c meta hour "17:00:01" drop'
>
> > # nft -c add rule inet t c meta time "2023-12-24 17:00:01" drop
> > Error: syntax error, unexpected -, expecting end of file or newline or =
semicolon
> > add rule inet t c meta time 2023-12-24 17:00:01 drop
> >                                    ^

Ah, of course! I usually only think of single quoting the rule when
braces or semi-colons are involved. Escaping the quotes also works for
me:

# nft -c add rule inet t c meta hour \"17:00:01\" drop

> Similarly, the timestamp needs to be double quoted at the point that nft =
encounters it.
>
> # nft -c 'add rule inet t c meta time "2023-12-24 17:00:01" drop'
>
> In this instance, such a requirement is easier to fathom. Presumably, 202=
3-12-24 and 17:00:01 are otherwise considered as two tokens that are not co=
nnected with one another.
>
> In both cases, I would describe the error reporting as being poor.
>
> --
> Kerin Millar
