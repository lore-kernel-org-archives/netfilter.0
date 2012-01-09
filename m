From: Anton Melser <melser.anton@gmail.com>
Subject: Simplest failover solution for iptables firewall (router)
Date: Mon, 9 Jan 2012 22:11:53 +0100
Message-ID: <CAKywjPpp3xsP=Rkvnfxo_7T-5xcZZuuzqSWy6M8u4bqX0C-KOA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:from:date:message-id:subject:to:content-type;
        bh=c8Enxr6bt6+ZeEWTZjzP0KsuIIrRVmzO8YM/gkIrxho=;
        b=KGgz2Wr6uGbBW3+IUxeT7vQGbmRuPQsbNgXH+y/6cFKqrQS/SpWCKEtZMpV2mOcsVT
         lnusg8ywkT5gxA3YBthoQjrkY9uBkWnFRF4A6Ya7Z/e6MzZnayUdhnKNnuBg63a7mD6f
         jf8HCAd+Og32kV4/4QN4orUP432zpn0lIv0OY=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,
Now that I have my policy-based routing NAT FW working as expected
(thanks for everyone's previous comments!), I would like it to be
resilient. The more I think about it the less I want to bother with
true HA (so keeping track of connections). My solution can handle
20-30 seconds of downtime with no real problems. And if on the odd
occasion it went up to 2-3 minutes it wouldn't actually be that much
of a biggie either. Basically, I just don't want to be woken up at
3:54am on a Tuesday morning because of a kernel panic :-). If it can
wait t'ill 7:30 then that is all the resilience I actually need.
The keys here are simplicity and resources. It should be as simple as
possible, and shouldn't require very much in terms of memory and
processor resources. I could possibly even get away with scripting
something up in bash but I would much rather not as I'm very lazy :-).
Does anyone have experience with such a setup? It looks as though at a
minimum there is keepalived and pacemaker+heartbeat. Is one
better/worse for a specialised firewal box?
Thanks
Anton
