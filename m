From: Alexander Meinhardt <alexander.meinhardt@gmail.com>
Subject: Re: nftables: response of nft is rising
Date: Wed, 17 May 2017 15:28:21 +0200
Message-ID: <CAB_+ZOs_5wdconhTRTbeCjPeuYJHiCywLM4X4_v1a=amit=xgA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=Rg9tkFzw/55w94EPeCT82MYTZzJAeJd/JeIPaPYJ2sI=;
        b=Ns3lxFhlSn8R0uadTw10C2G4kzVWkSXUeQqQmIJuGZvV8SyeZ7EOgnmhnUqdtqzoDr
         kesRVdBFJJQaIg/HtqTN/cBGgkFHgnaorM9SthqCpUiStUUbsUBL8gikdwt3dYNB4AFm
         xyO+gbYNKDgq0w02EGRz8jGCBhyRo6+s40Z/aCzwa1TJQKfe8V3d0PJVhnDSZv6u4T67
         JdtBXPweopsStR0SwrulygKoQv5Mj2nRkWznseyfXgtbWodxN0xbv9rPNc8RJpwrIb7W
         QU639nxjNc3d1I0AlZd2JLsnhOL19yB6P97LrJvPPqVpTWw/GMwYqphVzQRW6FaySfyw
         Ugqw==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Found the issue right now.

While i was using a flow table without creating with timeout flag, the
content increases dynamically and would never be flushed.

Now, i set a timeout of 1s and the flow table flush older content.

Execution time is stable again:
>real 0m0.015s
>user 0m0.001s
>sys 0m0.002s

--
Regards
Alex
