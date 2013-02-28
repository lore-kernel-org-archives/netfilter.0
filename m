From: Donghua Liu <liudonghua123@gmail.com>
Subject: how to discard a netfilter rule
Date: Thu, 28 Feb 2013 14:26:52 +0800
Message-ID: <CAJhv45jOTpijtRJrqV7TCE6Y469W1DY8d1NWBnSSz0NYw+6-Jg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:date:message-id:subject:from:to
         :content-type;
        bh=Tr9iJ6J8V9dqkoXIMp0j5SPzwxHFnkEvNVV7JKmtm3M=;
        b=Hh3nULY1pTWeindHvXTXaNBdA2fEhhm7+bFSmgxTgtC15KeE+y87e3lOxxsZMjPb2j
         J193fxwK8G83VvEM0QaRSZ4U62rMDE6UOi0ESOXr8XCe/NN4kpO89PoBDP5ZF5xcTkF1
         gu90si+lbGjnnE/F8bQBCQZR3+brUzO4HJjPuQOViAi5t2jeEiXyg4ow71Qj72RwsYSb
         HOtRRQFr5VqgCdAEXSScIbef6S40eIMqhcJpeAXEaLw2/mxweMUVscq9u9HOCitWOGLw
         En9ZaLNApfS/TU2btRt2jj/bC6Llm0qynmUG1KtjxApCpWi/sjxxlF8Cso0VbkVmH+WI
         ocMQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

Say if I set a netfilter rule by "iptables -t nat -A custom_chain -p
tcp -dport 80 -j DNAT --to-destination 127.0.0.1:1234" for some
requirement.

I also have a LKM which will check the availablity of service
"127.0.0.1:1234" and how can I cancel the rule's operation(Do NOT
delete this rule), let the packet go as usual ignore the nat.

Thanks!
