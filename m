From: "megacrabogoahell ." <megakrabo@gmail.com>
Subject: TFTP conntrack research.
Date: Fri, 27 Jun 2014 13:05:56 +0400
Message-ID: <CALHVu_7PJtvZJxOEZKQSYFJth5zwizecHntiu2oT_ox0J5oUJQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=5CUNBUPqywEJfoSkWx95ebnfXtuqpxb2EI/NAKiw6ts=;
        b=MA4Tw0PWCG06W9ClipidhQt7Kpq9z08jfFGK8bOCKxQxkmyMYjrNLRsU1SY6lhVnH7
         L9owKNH+XS5ygmDi3jyxQCPvl1hESCLkYR0+OuW+58oqt9VfYegZIReVjTzoibVUKXrW
         DMdg/sG9UJ3cvpvYbb/rQ6eDw2dkS7Y4EZNJJ+UdjpVVXzt9akk3cUiyM85iVE6YlhBe
         7EGemJr+QMM3IKwbiKiU6z3g1h5S4++jWLtKp/cmEbpPTbywb1U3UB6sSTHNw7jZw8nJ
         v0JzigJSc2GKCi7YdfQ12GKSsY9Ifl/tvRxqCrAZDWlGfdM3s7Y0vpWw1L47YFcLg+sE
         R7Cg==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I'm researching the stateful FW. I've got an interesing situation of
how does the TFTP passes FW rules. It's clear to me how does
nf_conntrack_tftp works. But could you please answer me, how many
sessions does the TFTP transfer requiers?
I mean, when the client asks server for a transfer with WRQ or RRQ,
the src ip/port and dst ip/port are not same when tftp reply came back
to the client. Does this packet belongs to the session of 1st
packet(RQ creates NEW session, and then it goes as ESTABLISHED?), or
it belongs to the new session.

Thank you so much.
