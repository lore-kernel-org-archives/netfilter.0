From: Shanthosh Krishna Moorthy <shanthosh.rk@gmail.com>
Subject: IPTables Time zone match to local time
Date: Sat, 6 Apr 2013 16:13:20 +0530
Message-ID: <CAO8=0scNVKXPAozsLnvaqNpOo1YwjpVoRauzM1TTRhP2-hcMpQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:date:message-id:subject:from:to
         :content-type;
        bh=TmQAY1CQqfVz9suo6jrKC6qDP5CwxQ3SsMFFBQw6oyo=;
        b=akWQCcxh+fLrNaqE0Cmjxpa7WK3TPh3K48e72+sRyR6mJjmaSXtqMo1YWE4qkqJ3b7
         DvjdVlhts2M0L5fDwiLo2C8/Bp+pSWHppeiQQEDOqXyF24svULgY1AGbK7uiLlaMO7lV
         X1pGwPuk1lfTDtJzk1KagqdMkJAjBp46cbJxgYb85mPshzan0AYeO0+DhM28N0w8hMJX
         NDSg3FBPk7eX6ev/Ne2N+W8D7Dg6DPiYshr1CwJuD7BKTbc4hhwmFmM/p5/Yeu+i7OUA
         unsg6udj0uH6t7eyfyC1T5lcLeHnkyHKifeZLQaCsQL6BvDi5qqfZy+sAyk23FBfhS/X
         bpnw==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi All,

The IPTABLE time based rules seem to match the time specifications
only in UTC irrespective of the --localtz configuration. The kernel
local timezone is not matched.

Has any one experienced this before? The behavior does not change even
if the hardware clock is updated to the local timezone. Suggestions /
comments would be greatly appreciated.


-
Regards,
Shanthosh
