From: Nikolaos Kakouros <nkak@kth.se>
Subject: Questions around the use of timestamps
Date: Mon, 27 Apr 2020 23:41:08 +0000
Message-ID: <1588030868100.98244@kth.se>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kth.se; s=default;
        t=1588030870; bh=SZz35o7xDgMxYtskGvJC6nfHbawCecCga/aK80QiSoY=;
        h=From:To:Subject:Date;
        b=dG1dZ/vF4wWZDT+rVNBFV9wZDRTwjSZksnAu/L2ncrbVQUH2jmj8Av+2tAZm77l3Z
         nE4gtRQpvJUAezYKhiqgC7yozflSpUsst+aWWEQj0eGVmzTsYOl9afdoy6MS2G7Bgg
         sZMMsSwk0dAPIVNYDS3srxHSx4M7r5ksI6fRhB2U=
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

I have two questions that I would like to ask.=0A=
=0A=
1. I run conntrack with "-o ktimestamp". The timestamp produced contains up=
 until the seconds. Is there a way to add milliseconds to this timestamp?=
=0A=
=0A=
2. I have tried "-o timestamp", as well, but this has no effect on the outp=
ut. How is this supposed to be used?=0A=
=0A=
Thank you.=
