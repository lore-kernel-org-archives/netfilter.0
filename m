From: Ken-ichirou MATSUZAWA <chamaken@gmail.com>
Subject: Python bindings for libmnl and libnetfilter_conntrack
Date: Fri, 7 Mar 2014 15:45:00 +0900
Message-ID: <CAGCkEt0wynDgeydhT=PSFuLq2Km8QnmfSPY9Rx8gN8fvtCGx3A@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=qcN+rTx5LwoaH3uYKXwKRKm/ySl/n9gLoaz9oLrK+tM=;
        b=lm8V1qqlk/Wu/ACNSEPg6l+iYFxISdkxs3F0oaZ58izIRKNTc0dGJ7KQOqZiW3jZL+
         aScbh8db8eWBTTAhXB5GFFy9w6VjyJBOes2IzISaQZLgY+qP1V6RHWRsm+YmPAdmJPBb
         uWCyZ9AQeniJLwq2BCMPkyF+2imnoSiI2bUYIz6xvZGiLaqNNPzM02YNUUnVJD6YkKJ0
         vqYW3O+EmMa0y6B3pT9iGeXpg72ocsPcI00ND1vAVjnO96Gkr+yFVQLwjMNlKPDNWQSg
         RybqSY0igDm69sLIm7S1Hl0wC9TX7uV5MWTtq+E/w1eBje7U0tHp7ZwWX2UT9ICZ+dRA
         9onA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

  Hello,

I've started python bindings to handle nf_conntrack.

    https://github.com/chamaken/cpylmnl
    https://github.com/chamaken/cpylmnfct

I'm glad if someone advice me on these. There is graphite examples
in examples/nfct-mnl-graphite.py, seems working fine for me. I wrote
comments to set up iptables, iproute and ebtables to work in it, but I'm
afraid that is wrong or there are more efficient way.

I've started go bindings too, but have written nothing about it.

    https://github.com/chamaken/cgolmnl
    https://github.com/chamaken/cgolmnfct

If there is someone who is interested in these, please advice me too.

Thanks.
