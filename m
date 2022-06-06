From: Gio <gioflux@gmail.com>
Subject: Validating this is the right conntrack ruleset
Date: Mon, 6 Jun 2022 09:48:23 -0400
Message-ID: <CADhidkpx+3=1aZj5OF11JR6y_g16xqV=tyx5Bn=dG_kisJwP2w@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=9k48IKpSFz8+dEmuWKu4K8Sc+HjOdkb2jt6lYz4K+tA=;
        b=cdgWrCGJQBv9PkyZnizWKk6TBQJ1LqQe76an41zSTP+tqLO5mRNA54isllvUTg3wVt
         cUe8/GjwJnuoAZ6U+kdkH3DKQfUPUTMsFA2fAMU4lI18ha8vwC4fXPnVvGbpJoCRPeNP
         FF5Pxz/9Dbamsbqjf3t/uWSp4DE5PaG1w5VWURQH9L1TnUe/0J1Q6ZUAv2uBf/ECh6nC
         Yt//P2ivXyKzxCLOVv7OtSS4qXAvky/Bd7alCn38hpB7ZcWepAlY6/U98lQmshTgcQD7
         jzFgs1a/bVoTC64IMBwPT0kYqvNAuhhTVmlTfMuZ+xnFKPpR8HG6lMX8whJsYTVvYlnb
         QWMg==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I need some help understanding the proper way to do conntrack
bidirectionally in a secure way. Could someone help validate my
understanding and indicate if the below ruleset and approach is
correct?

My goal is to allow incoming connections to tcp/80 (input hook) and
all response traffic (output hook) without blindly allowing more ports
than intended for this one service running on tcp/80.

table ip legacy {
        chain root_out {
                type filter hook output priority filter; policy drop;
                tcp sport 80 ct state established,related accept
        }

        chain root_in {
                type filter hook input priority filter; policy drop;
                tcp dport 80 accept
        }
}

I have seen other firewall examples where the input chain just blindly
allows all reply packets via 'ct state established,related accept'
like so :

        chain root_in {
                type filter hook input priority filter; policy drop;
                ct state established,related
                tcp dport 80 accept
        }

I am not sure if my first example is correct and secure; should 'ct
state established,related accept' always be in the input hook for
response packets or only needs to be in the output hook?

Thanks in advance.
