From: tom murphy <tommurphy105@gmail.com>
Subject: What category of Firewall does Netfilter fall under?
Date: Wed, 26 Aug 2009 09:47:45 +0100
Message-ID: <f66b95be0908260147k3676be79h10842cc9a49754ef@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type:content-transfer-encoding;
        bh=7b29AT1tEUH9VHBZ4DatY/yyu3ejMb6wwVdkcipXAWc=;
        b=JiogjNR189liOWLEnW1KrdhFmWJkOiE+FyEN0TuP127jDDMyuR/FJh//OXJdefadYS
         1HuY9XuwUbDHaSLvlQgBD/FFv/Jd0y4AB0u/5fwrGApwcPhSEjRp1UUiJPUkAOwkcVJv
         wWm/gDNPRdkNadd70bTlq0Y9hz0Fzfytfddy4=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Dear experts,

How would one classify netfilter?

Its seems there are at least 3 categories of firewall:
1) packet filter (stateless filtering)
2) stateful filter
3) appliaction-level filter (aka. proxy filter)


most literature, seems to refer to netfilter as a packet filter.

From the main netfilter website and the man pages it appears it can be
classified as a stateful packet filter.

However, I also see it can do deep packet inspection at the
application layer with the L7-Filter module and from what I can tell,
with the normal String match module.

So, can netfilter be classifed as a proxy firewall as a default classification.

I can clearly see (well at least for the first 2 classifications) that
netfilter can play various roles depending on your requirements. That
is it can be either of 1,2 or 3 defined above.

Any opinions or comments on helping me pigion hole Netfilter/iptables.
Perhaps stateful filter implies packet filter also.

regards,
Tom.
