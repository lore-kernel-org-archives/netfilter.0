Return-Path: <netfilter-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E15BC4332F
	for <netfilter@archiver.kernel.org>; Mon,  6 Nov 2023 15:28:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232033AbjKFP2j (ORCPT <rfc822;netfilter@archiver.kernel.org>);
        Mon, 6 Nov 2023 10:28:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231516AbjKFP2i (ORCPT
        <rfc822;netfilter@vger.kernel.org>); Mon, 6 Nov 2023 10:28:38 -0500
Received: from mail-0301.mail-europe.com (mail-0301.mail-europe.com [188.165.51.139])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53E0D107
        for <netfilter@vger.kernel.org>; Mon,  6 Nov 2023 07:28:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
        s=protonmail; t=1699284511; x=1699543711;
        bh=W+suJ2hqZzMBn2qnPxlPV3YKZa+k19fmLw8Jbm0zYV4=;
        h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
         Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
         Message-ID:BIMI-Selector;
        b=ccsj0Eo+yARpopN9MCNdgZPbj7UEn6u/K1BREVNdomyEP+BOV0HiNGelPsx2wr94C
         Ok+oUsBgEDK2qQZIQyNXSJEKxu2vFQuEWPZLHlhMl+WfFO9os6+mNvGpldcgrJSYD7
         gg8LOc9/psRt/S2xfllKhjJTgLokgu7mHwmEEG7PJcULhvGpToQWfG5NYiGJd4CGg1
         uJiNf8VHLQuDnT2NNWUarh2qjKqdL3VsnirMajcxYoYudbUrhuErfMVJDaSkR48nvN
         jEoe5EExY2hYtU/HWXvR1FTPgR13xQaeTxO7VlmHG2mYyHzZ9jKL/9iTlz16JBFQWj
         +TodyfDKAJbEw==
Date:   Mon, 06 Nov 2023 15:28:09 +0000
To:     Aurel Wisse <nf@awisse.ca>
From:   Eric <evil.function@proton.me>
Cc:     netfilter@vger.kernel.org
Subject: Re: nftables expressions and operators
Message-ID: <X2O35_4Q47kM5H3VjpNF-lwnTiykyG7DN7EUFegqHKDH-OW-eHGVhsHOyH1F6hQ35mjsN56xJSJSOTIoFFqz0dHZIsy4CCoHSoqEtanfgn4=@proton.me>
In-Reply-To: <cf193b51-1794-4405-b6ce-05712ac4b836@app.fastmail.com>
References: <74e3c950-e623-4b46-9186-8fe2230c9f9a@app.fastmail.com> <ZUjp9jAAPYgOAIDq@calendula> <cf193b51-1794-4405-b6ce-05712ac4b836@app.fastmail.com>
Feedback-ID: 48716100:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <netfilter.vger.kernel.org>
X-Mailing-List: netfilter@vger.kernel.org

On Monday, November 6th, 2023 at 06:24, Aurel Wisse <nf@awisse.ca> wrote:
> Thank you for the quick answer. That explains part of it. Still,
>
> `tcp flags & (fin|syn|rst|ack) !=3D syn` becomes
> `tcp !=3D syn / fin,syn,rst,ack`
>
> and both expressions are interpreted as equal after parsing. Can you plea=
se point me to any documentation of operator expression syntax/precedence ?

This is not the answer you're looking for, but it may help...

When I was first learning nft expressions I found it most helpful to dump v=
arious rules in json format, where it's really easy to see the expressions =
in the abstract syntax tree, and compare that with both the input and outpu=
t forms.  Also, you can clearly see the statements after the "match" entrie=
s, like "counter", "set", "jump" and so on nicely separated.

(Oh, and in your OP, the "*logical* or/and" should be "*bitwise* or/and", a=
s the "flags" are a bit mask.)

Input - if you don't have this form, then the json is far more enlightening=
:
    tcp flags & (fin | syn | rst | ack) =3D=3D syn   jump syn_flood   comme=
nt "Rate limit TCP syn packets"

Output (i.e., 'nft list ruleset | grep 'Rate limit TCP')
    tcp flags syn / fin,syn,rst,ack jump syn_flood comment "Rate limit TCP =
syn packets"

$ nft -j list chain inet filter input | json_pp
...
      {
         "rule" : {
            "chain" : "input",
            "comment" : "Rate limit TCP syn packets",
            "expr" : [
               {
                  "match" : {
                     "left" : {
                        "&" : [
                           {
                              "payload" : {
                                 "field" : "flags",
                                 "protocol" : "tcp"
                              }
                           },
                           [
                              "fin",
                              "syn",
                              "rst",
                              "ack"
                           ]
                        ]
                     },
                     "op" : "=3D=3D",
                     "right" : "syn"
                  }
               },
               {
                  "jump" : {
                     "target" : "syn_flood"
                  }
               }
            ],
            "family" : "inet",
            "handle" : 210,
            "table" : "filter"
         }
      },
...
