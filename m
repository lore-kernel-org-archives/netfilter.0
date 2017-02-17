From: Shaun Crampton <shaun@tigera.io>
Subject: ipset restore dropping updates?
Date: Fri, 17 Feb 2017 14:24:24 +0000
Message-ID: <CAMhR0U3LvRnKqa5W7VzdPoJPi-XMXRhMAT1T2Mkj2CX1o=CuXQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tigera.io; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=g4ZLjO5ILj+hQaiymM+mSWetQNEweODoiHBpJ2bZ5g8=;
        b=PanP8tW9qydzCAN1iqTiDPikskauL6iUn4z6itK7ptQ1qKjSWy7wSCcDBSYYjJR7TT
         qvXeXVFJOzxoi3MYLwZELE7mMXGyHwxdo130HCyTM2YsRLzKvnVzzFgyGDgmUUzV0EV1
         2w2JFzc+2IIpxHAhRxGgj1mFz9kHaS1p/BUaw=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

My application (Project Calico) makes heavy use of IP sets for
firewall configuration and, to update the IP sets quickly, we use
"ipset restore" for bulk operations.  After running a churn test on
Calico that adds and removes a lot of IPs from IP sets, it seems that
IP sets can become inconsistent.  We add an IP in one call to ipset,
then try to remove it later but ipset says it isn't in the set (or
vice versa). The ipset call that adds the IP returns a good status
code.

To remove some variables, I recorded a trace of every ipset call that
Calico ran as a shell script.  Sometimes the script [1] runs to
completion (so I think the script is consistent) but it typically
fails at a random point with something like "ipset v6.29: Error in
line 66: Element cannot be deleted from the set: it's not added".

I've tried to boil it down to a smaller repro but I haven't come up
with anything that hits the problem as reliably as the recorded
script.  (I tried a python script that adds ~1000 IPs to a set and
then churns them at random; I think I hit the issue once but haven't
been able to hit it again since.)

Any help to diagnose or work around or a fix would be appreciated.

Thanks,

-Shaun

[1] https://transfer.sh/13zUTe/repro.sh
