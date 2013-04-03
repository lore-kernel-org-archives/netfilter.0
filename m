From: Daniele Iamartino <danieleiamartino@gmail.com>
Subject: Source process (PID) of a packet
Date: Wed, 03 Apr 2013 18:09:10 +0200
Message-ID: <515C5426.3050909@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:message-id:date:from:user-agent:mime-version:to:subject
         :x-enigmail-version:content-type:content-transfer-encoding;
        bh=MB6c/m30OnHeebhNELKMZzTDG4j1kbCXcwlcBXmthGo=;
        b=TgvmnvU4a3q5oQg61cIhpLi0RhzqVIOGaEF0lWD3zaL71fLO6fxTTrtrRPd+LYd9cU
         dcgHQYbh7pHWyfW400ez3vqX5Ya6ALZUcpzHV3Ph1JL9Tpfo/Kth7Xefizi7SlDGX4QJ
         LbNSJHO6PlR4H7Vh8H2f0SrRbiervcCm2y9bOqNLweopzvmBvi4RIpsf3jod7PpKl3Jm
         RQzLCYLi0O+pwsb6F0AR9Lhv1mE49XP1s00/EuFor08uX3QGhKX30GN8DnPC0rr2BB7r
         ijKZ8IALOjHveedPmukMoATPfhv6nrEKRzlKK/Guex6p++Ev1SBK2QS4D1fH0wlSM3O+
         G7Dg==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello,

I've got a problem on my server and I had to find out which process was
sending UDP packets to a specified host opening and closing the socket
fastly.
I can see the UDP requests using

$ netstat -unap
or
$ ss -uap

I was finally able to catch the request running netstat in a fast loop
and catching it.

I was now wandering if it was possibile to do that in another way.
Something like log the source PID using -j LOG.
But I saw that LOG target just support the uid/gid.
Reading the sources of netfilter I saw that's not possibile and I think
that's because one socket could be used by several processes (I think
about the case of a process with a socket using a fork).
So is it not technically possible?

Is it the only way writing an xtables target doing somethin like this:
# for any fd on the system:
#   if fd == skb->sk->..->file
#      match...
#      ...
Is this the only way?
That's looks a bit heavy for the system to process.

I wander also about the outgoing traffic:
Is it not possible to match any packet coming from a certain PID using a
match module? I saw the xt_owner and how was the old --pid-owner match
(I've also fixed it for the new kernel to try it)
Is it the only way to check for every fd open by that PID and than match
against the socket related to the packet coming?

Thanks!

-- 
Daniele Iamartino
Computer engineering student at Politecnico di Milano, Italy

