From: Alessandro Vesely <vesely@tana.it>
Subject: nfnetlink: This library is not meant as a public API for application
 developers.
Date: Thu, 13 Feb 2020 12:27:41 +0100
Message-ID: <bcff17cd-1457-7454-e00f-22d798afd7e5@tana.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tana.it; s=delta;
        t=1581593261; bh=ghJJh5IaONuNe83BcUcpd3NvbBDWtJHKtjZ8aHoE2e4=;
        l=617; h=To:From:Date;
        b=DKjJP6WoWmFn52I+HZ0xeqt9ul2caDnWMBHt+nSx1sxE+g5baj3faXYhEVDIziT4v
         xZTwGeLb6RCvcPdzqCFTSNZLdfH2iH9KdzZOpYSl9USTUUJ4FKmilOXtF0AFdbfjUG
         v+OuRWxvVr1EitnSWfir4trKrcqpNcguFaMmUo2Mv99IKI96Zy/4s8j5z/45n
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

Has that disclaimer always been in libnfnetlink home page[*]?

It is the first time I see it.

I have a userspace filter[†] working with it, and it currently works well.

If I remove -lnfnetlink from the link command, I get just one undefined
reference to symbol 'nfnl_rcvbufsiz'.  It is used only if there is a command
line option to set the buffer size to a given size, to avoid enobufs.  For the
rest, the daemon uses libnetfilter_queue.

Should I rewrite that?  How?


Best
Ale
-- 

[*] https://netfilter.org/projects/libnfnetlink/index.html

[†] https://savannah.nongnu.org/projects/ipqbdb/










