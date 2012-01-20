From: Amit Serper <aserper@gmail.com>
Subject: EBTables not forwarding frames to the correct interface
Date: Fri, 20 Jan 2012 14:44:03 +0200
Message-ID: <CAAmn5Ak2avBdFbo=WHL+uTa1KEwoQ0T8i-8EhCeUA_oY5YBm_g@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:from:date:message-id:subject:to:content-type;
        bh=TM+5umbzQG/Dzhhoiifj+Rj/sXKR+WLDhLmCpuBPVpg=;
        b=mXWvA2GzfQ7+TNHzTZgqmyhcPlF2lVw1plELAmj6GB6C1dDbjYEkyzeTMFA5bO/WH6
         mpdt2Q7ovi18h2BIKVuzGaz8NE3mHllVLRUitgYG0CYXILVHO9ZAwSToPclrq6IUBhUp
         8+U4tqCEpitLTgOga4rUfUUG9rP6D6EUIG7vQ=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello,
In the past week I've been fighting with EBTables over this issue, I
hope that the mistake is mine.

The situation is that I have a bridge with 3 ports (let's say eth0,
eth1 and eth2). The computer which holds the bridge interface works
solely in layer-2 so it does not have any IP addresses assigned to it
(both the bridge ports interfaces nor the bridge interface itself).
The problem I'm initiating a connection from within the bridge towards
the internet. The connection goes out - a SYN packet is being sent
from 192.168.1.2 to an IP somewhere in the internet, e.g 8.8.8.8.
After the SYN reaches 8.8.8.8, the latter replies with a SYN ACK and
then everything just states that way. The problem is with the bridge
not forwarding the final ACK packet to the correct bridge port. The
packet reaches the bridge port but isn't being forwarded on to the
correct bridge port which connects to the internet router. What am I
doing wrong?

I hope I've managed to make myself clear enough.

Thanks in Advance.

--
Amit Serper
