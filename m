From: Akshat Kakkar <akshat.1984@gmail.com>
Subject: byte counters counts 14 bytes less?
Date: Thu, 27 Aug 2015 13:18:38 +0530
Message-ID: <CAA5aLPh9OhQOD73K0ABATh-118pB+CmeY9jn9Zn6pVMOiyauQA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=IUp3QhJoAtbLDEyTGqVhyqUE75824LShmWUpppYWDhw=;
        b=k4Wh4iDCcrzFx340W3oNxQMg51+x0VAQZfZhnEiG1krCY+5rOvw/7U8YVwmB70SAUr
         gxkQJaMwwuxN2IckpGkDUTYac1J4mPVC6Dq4mDxEcyWd/V1+KslnNLdx/cjtZda1eK31
         RPhLuHo13AlRctvvqgZno0lYXn4jCMiSSOMipz9Pm36rWEsBlPcjflJEVae31E3RIpBm
         EUEwHJKnckovUQOUUchk/Oc0Q8GK1HGvPULHIxZJ6eOhwgEwkf+Y4mL6NoO44+PKHLhd
         fXKX0d5VIoGIceDvBiJ9uIwQ64mCuLam/DQGtr/nDjO3tQr7B6a1UHK/PaNydNrfjIgl
         pacw==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

I am trying to use byte counters to know how much total data is
transferred from an IP. However, simple test with ping shows that it
counts 14 bytes less, probably ignoring later 2 header.

Is my understanding correct
or
am I missing something in this?
