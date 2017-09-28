From: Will Sewell <me@willsewell.com>
Subject: Re: Why are two hash tuples stored for each connection in the
 connection tracking system?
Date: Thu, 28 Sep 2017 16:09:08 +0100
Message-ID: <CAKMCqELnZLifhdEmbYEnPOX7SWAS4Y1L5KGBJ4YS_qT3QwkK=A@mail.gmail.com>
References: <CAKMCqEL=UCUUn2=Ke7-4uJo-fij80k7u13zEOsHNh_AP_p2EKQ@mail.gmail.com>
 <0cc1bff1-b709-06ff-1dfa-5d4214397277@plouf.fr.eu.org> <6f1b85b3-4982-d14c-a7d0-9abca40489aa@plouf.fr.eu.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=willsewell-name.20150623.gappssmtp.com; s=20150623;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=rTY/8x38ptUWLW0jpE94E3EDtH5OB8T0tOxkUKu9VDo=;
        b=1OTuQ8eaM3YwNrklQ0yCn4YD3xjsMnQKEw0do5qWsP3aZuV6WW4qDDCqBA5HfIT5uR
         UYRt5ZFr+XgCdqnygYsn43Gr3yO3DWALQUWsFkDzi+ZsJxwAHiy6BqpkDZsrvbmq9CtS
         6LdZcvNvj5xO8UjtkeBy06LBWmUukSmTgVmCwRngVVcZ+2PQV26ikRV8v/LmZyBk7b5F
         Lrx1JCBVN/0yUcvCk4Db7Hp2gEzKvZP7bp+s4/Al6EzMq5mPm2gIUwOtqXXMLaqGFL4C
         vHJaLLIs0rw1zJ82DNf4EK4quOIjKGbvscPuZhsZMNprXV93zwevBqY99oUtJ+5esTev
         J8Og==
In-Reply-To: <6f1b85b3-4982-d14c-a7d0-9abca40489aa@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pascal Hambourg <pascal@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org

> Because conntrack has to process packets in both directions, and the
> packet header fields in the reply direction may not be obtained just by
> swapping the fields in the original direction.

Thanks. That makes sense. I still have some confusion however: in the
case where the original/reply connection information is not equal, how
does the connection tracking system ensure that both hash tuples are
embedded in the same conntrack struct (nf_conn)? Let's say an original
packet arrives with some new original direction connection
information. I'm assuming conntrack will allocate a new nf_conn struct
with just the original hash tuple embedded. When a packet arrives from
the reply direction, how does conntrack find the correct nf_conn to
embed it in? From what I can tell the orifginal connection information
is required to look this up.
