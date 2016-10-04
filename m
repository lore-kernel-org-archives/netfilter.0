From: Mathew Heard <mat999@gmail.com>
Subject: Per connection track TCP Window Tracking
Date: Wed, 5 Oct 2016 10:32:46 +1100
Message-ID: <CALFfGYbyoxet9nood07SAg1AyBshRvJxXN0F3ibB4X=5mszNqw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:from:date:message-id:subject:to;
        bh=Mgqou/457tRfzHKR0bZWGEXFrnKDV/2YwDCdOeZSTaU=;
        b=F3Nmv6JBixQunzen975IpB0TItNRql7ua+HndLtiuhPkvAYq22/MtD29THNmU1HWV8
         CAJ1WE1Cwops7JV8gEsj15X1MePwZ2AAsxp/TBxevhaiZwWcV+qPxByMYUXx994q111j
         NqIijzwZKYG1KfxwAwjGDU+9k5f/gZ7Ewn3DjbzXb19dQEVy4hboOWflRWIfhkjf8+T6
         t7sf9Gqpxcj2KwsdQj7LCWuGCR4HCvUSjkI2dbXz2ocKto5DbJ4HeBVjK9F9euLGSlC3
         F0lB1TKtlHVEftIPrImAsf80pkJBdgx/WL3pgtXhNAJ5Aj8f1KPc8gLVOag9fzsjiGP6
         TWkw==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter <netfilter@vger.kernel.org>

Hi All,

Long time reader, first time poster.

I am currently trying to track down a bug where conntrackd
(conntrack-tools) is not correctly setting IP_CT_TCP_FLAG_BE_LIBERAL
on the reply side of the TCP connection.

I believe this to be a bug in conntrackd or libnetfilter_conntrack,
however I am struggling to identify the cause of the issue.

I have been able to replicate the issue by building a piece of
software to dump the specific connection track and looking at the
values of the TCP flags.

Here is a link to the Bugzilla:
https://bugzilla.netfilter.org/show_bug.cgi?id=1087

Replicated with:

Kernel: 4.1.17
Version: v1.4.3


Any assistance as to places to look, or thoughts would be appreciated.

Regards,
Mathew
