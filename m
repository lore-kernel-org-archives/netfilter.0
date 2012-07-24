From: rahul shrivastava <shrivastavaone@gmail.com>
Subject: installation issue when cross cpmpiling xtable addons for power pc
Date: Tue, 24 Jul 2012 21:01:02 +0530
Message-ID: <CAE1WnGfp46qMmfB5v9yYOU4OGNwJYmQY4p9W2A2iQJJC7tHh2g@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=8BZCzHWSIfdsLgK8bEa/uYuMgyV5XW1ihyFIsmyvmKQ=;
        b=WGFKqcqxCfFMQErGuAizJouSyQzCQyHm5HCOOmK8wG/jObwrxjmAQMsHN0txBiMTBH
         elpPsOd2WK2hGMQa7CXLBef+jnn5Bwt2e6cv5zasA19WSo6Smi+CD6sgBA2bALxZXgCP
         QsP19iAzMrcZJPo0GvHEE6vFY+AdX48jI/vtRTBsMpZH+ZfO8af3HH9gPsEKuzToGo7P
         ECG9HM8tuS6TfgolpQLDcWZ4/mWgNGtn53VsELlatuqLCdcgOLzvx6xXpfC1i+g1qSCP
         vn7oJ0k4nDz3XJcjOWXmIBfwWQNDJyCMZAGv8BVX1FEQdtngnMi5gy7Wp6jepwcqMDdB
         7/pA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter <netfilter@vger.kernel.org>

Hi,
i am using linux fedora system (kernel version 2.6.35.6) with i686
archetecture, have to cross compile xtables addons for powerpc platform

1) iptable devel files are needed for compilation of xtables, so i should
have iptable devel files compiled for powerpc or x86. in this case i used
powerpc compiled files
2)  ./configure target=powerpc
3) make
4) on doing make i get following error /usr/bin/ld: cannot find -lxtables
collect2: ld returned 1 exit status
make[3]: *** [libxt_CHAOS.so] Error 1

5) is there something wrong with this procedure, if yes please tell me
correct procedure to cross compile xtables addons  for powerpc

Thanks in advance
