From: gopi bhimavarapu <gopimallikharjun@yahoo.com>
Subject: Recompile iptables
Date: Thu, 29 Mar 2012 00:01:14 -0700 (PDT)
Message-ID: <1333004474.86926.YahooMailNeo@web125606.mail.ne1.yahoo.com>
Reply-To: gopi bhimavarapu <gopimallikharjun@yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024; t=1333004474; bh=7xU/6HN7jqROOrz5uIz9H74xDUydFju50c6fzPL8lTI=; h=X-YMail-OSG:Received:X-Mailer:Message-ID:Date:From:Reply-To:Subject:To:MIME-Version:Content-Type; b=psjmd1IdBgnye/z22QQPxBVyFcOl7m5fTJeBoRTyaF3arHDJrcXxd3QDmy4k0wI6RkqWOpchMt460IZg1W57xOq6dSJZcMg5ZWU43ztoYUhx3TmkL1LYCLfI5ol7qBGLlsY2NMyNLebs+YPwoAQ09gumCKTZu79eXTHGzcnvZFU=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hi

I need to recompile the iptables userspace program using the include
files of my kernel. (which has specific improvements in ipt_entry structure).
I am using iptables-1.4.12.2 and ussing --with-ksource option and giving my
kernels include directory.
Even then, ipt_entry sturcture of iptables-1.4.12.2/include is getting precedence.
How can I force it to take my include files.


RegardsGopi
