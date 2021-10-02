From: Matt Zagrabelny <mzagrabe@d.umn.edu>
Subject: testing if a named set exists?
Date: Fri, 1 Oct 2021 20:16:17 -0500
Message-ID: <CAOLfK3UBEvRg8AQbLibVo9xp6tZjaE7_S1+uDyhhbR7Nj_eYhA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p6.oit.umn.edu 4HLpwD6ymNz9vJy4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=d.umn.edu; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=EfQDGxLOEvHqieuEumAxhHbOP2594fstOjWMa1rmGrk=;
        b=D0aFVearLGP/EB85GeogIFnXxf7/vTCTAlB0UqbTkXeMk8BNWvCQIJFwXUXaveTl70
         2nB+931aAD0bzDntD/c7Kh1QLsyoncWWTpdiQCCU+gwyPLG8UfN3R2/FhwW0JAK7Hk/M
         AJS+BwuhBjUVJGKuNxQkVkEuAvyImqOs8K24B5DF2ZLkneWcVSF0+vQni8v6BSiFOj1A
         w5zxUKe6+KNCuV/NVnh5yQfLk/d4PmHgIoCoWbmzmZ8bGF3rqHxwb5ubBn1ByJ5edLaF
         YOyc3ZhXK6MROXlwOyhp00tnmEGlqNGnhmDtg/lpWqrp5DgaRypv1Ak4MCq3DKalwRoH
         FtRA==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter <netfilter@vger.kernel.org>

Hello,

I'd like to do something like the following:

if exists $named_set
    nft add rule ip filter output ip daddr $named_set accept
else
    nft add rule ip filter output ip daddr $default_set accept

Does anyone know if I can accomplish this with nftables?

Thanks,

-m
