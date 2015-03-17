From: Peter Chen <peter.feifan.chen@gmail.com>
Subject: transparent proxy with iptable redirect
Date: Mon, 16 Mar 2015 23:37:57 -0700
Message-ID: <CAMGYKAewXqwykFeHWSxLeW-MJP9xqujuRMT6pwOEsjUDtGQFtA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:from:date:message-id:subject:to:content-type;
        bh=OZcrMAhpUpaGHgiZcJ2j8Qv4Nj3Roz3iQcuZu83jALA=;
        b=eXpusHvQcfCE1Xq5KMT6W7a5RVEX1JQNUIcaW5hRUG+go3PIJDQEq+5eBnyyD5ZlW7
         96KimWBt0sIDidQX2KVVdfLe0I9UtzbfdGu7VcN03hTE1Bt9vFY3gu6iebf4HifJFtJC
         kfk9ptUadcKTAQPSvoPaLEZkQkksXBAXJvSuHM0Gi0F0B3SPZ7AtCOF/V7UK94cJUDqu
         O3DBytlbn0RL2/1BZmvh1HyiPJBfamCQoZLymO7Z6crpOcSlZYgBjWGUx+ZKOvEvKknZ
         X7XgnEfMhH+84CZKo2ETzVGfn7G1sR8Tdqhs31cu1rtjjnhrpZo0+cPYx7JLQW/BlBhF
         4OiQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I have a pretty straightforward question that I've been wondering. If
I add an iptable redirect rule (e.g. dst tcp port 80 to tcp port
8080), it would change every tcp packet with port 80 as its
destination to a tcp packet with destination 8080. Now if my
application listening on 8080 were to reply to the source, it would
transmit a tcp packet with src port 8080, but the source side is
expecting a tcp packet with src port 80.

So my question is, how does the reverse path from dest back to the
src, at what point does the port number get rewritten from 8080 back
to 80, making the redirect transparent? Is this done by iptable
automatically on a redirect target?

Thanks,

Peter
