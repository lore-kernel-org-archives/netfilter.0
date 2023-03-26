From: Serg <seentr@at.encryp.ch>
Subject: nftables: Internal error when checking rules
Date: Sun, 26 Mar 2023 12:46:56 +0300
Message-ID: <9a42b3af-8451-8fc2-2565-a60b1c846358@at.encryp.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=at.encryp.ch;
        s=flopster; t=1679824019;
        bh=3IQAm75NsBFld1EDf/rZvCC3mSME+sTNNLeUi2Gev2M=;
        h=Date:From:To:Subject;
        b=o9k4X6oX01NG9fMMxr50yeAhQ3OH/6+2dIwM4LGdlSEf6g0FKbiko2pOOCj55yDU9
         X7FwfGCi3bTv92mJjObwzLlnIojDY/kP7HmKKUchRL0eazU7Q+zAY9TzBh+bv/T6uY
         o/ui2qXP7kdl1Yg1gJD1WppQgLtUFGMXkeWkVJQ8=
Content-Language: en-US, ru, uk-UA
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hello, netfilter community!

Today I have encountered strange behaviour of the `nft -cf` - I receive 
an error message with an exit code 1. The error message is 
"internal:0:0-0: Error: Could not process rule: File exists".

My configuration consist of several files and I have found one that 
causing this error - it is set with a list of networks in CIDR format. 
The file is pretty big - it takes 15K on its own (it does not contains 
any rules at all, just a single set).

A bit of information regarding my envirovment:
$ uname -sorv
Linux 6.1.19 #1 SMP PREEMPT_DYNAMIC Tue Mar 21 10:36:11 EET 2023 GNU/Linux
$ nft -V
nftables v1.0.6 (Lester Gooch #5)
   cli:		readline
   json:		no
   minigmp:	no
   libxtables:	no

Any suggestions are appreciated.
