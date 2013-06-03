From: Dan Osawa <dkosawa@gmail.com>
Subject: Filtering Broadcasted UDP Packets on a Specific Bridged Interface
Date: Sun, 2 Jun 2013 17:29:59 -0700
Message-ID: <CAO9Kb4BjaV-C0OzPJmifhVZ5p6MTX8=4o2BN7yMthzy+Q89TjA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=p/Vk0CpBOP6ocs4tKZsvTNdItgcqGYIp+w4eyzwA1lg=;
        b=Ktlz3sz42NjU7BatLTuVfgne4NK/IrxeTzhy81nnQ+nJUQt+5jROgNZdGADZcGvbOG
         3Ypw/EQ99bLQuwBuowSJFOCCfkDbQNAhS6+8BpGtkRb6RJ23G25zCNXitWiyAgwH8UMC
         mEuqHTZEvNEN1ThdrhPGETN4sfI8Jnx1t3Vs+Af5ZB146b/aL6OkNWlBzSXaMR/eyPT9
         LGBq3cV8MVo0RuKMz05O6s42O0659tNlz03ByLUodrj2kvcsJ1coibCn4GJaklgZ8eoA
         0FjViY0B/Qv7QjdyFgv5CrJTGgPmtVyhg523FFKlAlMEuGhXYTZMPHVqQbqGHdt9iKaD
         3QhA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

My PC has two network interfaces (eth0 & usb0) that are bridged. There
is a service on my PC that broadcasts UDP packets on a specific port
(7000). I would like to prevent these UDP packets from leaving my PC
via the eth0 interface, only allowing packets to exit via the usb0
interface.

I tried to do this by adding an iptable rule to the filter table's
OUTPUT chain (see below).

iptables -F

iptables -A OUTPUT -p udp --dport 7000 -m physdev --physdev-out eth0 -j DROP

Doing the above results in an error: *xt_physdev: using --physdev-out
in the OUTPUT, FORWARD and POSTROUTING chains for non-bridged traffic
is not supported anymore.*

So i tried the following:

iptables -F

iptables -A OUTPUT -p udp --dport 7000 -m physdev --physdev-out eth0
--physdev-is-bridged -j DROP

The above doesn't fail, but also doesn't suppress the packets.

Any suggestions?  Am I way off in thinking that IP tables can do this?
 Do I need to use etables instead?


thanks in advance,

Dan
