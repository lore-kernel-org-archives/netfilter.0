From: Ken-ichirou MATSUZAWA <chamaken@gmail.com>
Subject: sampling conntrack account data
Date: Mon, 2 Jun 2014 18:12:18 +0900
Message-ID: <CAGCkEt119ecQQXev0CbNdkW8UzTCxuFs84ozO4Ao_hmWAYDiZA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=N9FKg6og8M7KLInOxtzaZ9EtxNZZTzmP/y0Ie7zix3g=;
        b=BGxN13fW1ytHbe6BhM24AVwo2aOunofWarfsnetv59yYsA4fgqJFUjpqWniUxAKBDK
         wR5AopxeoLrXt4DhACMcXcHxm1yhD7sCgmol0JxFBLFpnkzphFqBjZuM2kxR5x+gIqbV
         p406q7uEathPPZfJse3bhelizrXQN0HBFDUfjzM74wV2zGu6nAPun0ECIh7xuDIvu0VL
         Xov2OZwl2udpGBK8Ax4/pNtHmvf0obee4xDL8SamaS7F3gebqmg1Y6GGg4gl+X/bS4qt
         9yaZjUQ8fDbCkoyciK/O/6Bqyzk9CraBiX1JR9w7QPtn76H+tSDx1wts+XplO6dRDYaf
         XT0w==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

 Hello,

I am trying to create and export IPFIX or NetFlow data from conntrack.
And a collector which I will send the data to requires sampling. That's say the
reason why sampling is needed does not stem from linux, exporter side, but loads
of the collector, server side.

I know it breaks xt_connbytes but at worst I think I can do it for
private use by
creating new sysctl integer writable entry, compare it with prandom_u32() like
xt_statistic then operate the accounting counters.

Before do so, would you tell me better way to get sampled conntrack
account data?
Or is there a plan for sampling account data?

Thanks,
