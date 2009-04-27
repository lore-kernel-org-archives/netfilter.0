From: samsonpablo@yahoo.com
Subject: Limiting outbound connections and using the QUEUE target
Date: Mon, 27 Apr 2009 16:00:46 -0700 (PDT)
Message-ID: <625965.25951.qm@web45309.mail.sp1.yahoo.com>
Reply-To: samsonpablo@yahoo.com
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024; t=1240873246; bh=n2//EJfLYLbO0aA7vIvO6dt1a2quUrunY6DsYwXOu3o=; h=Message-ID:X-YMail-OSG:Received:X-Mailer:Date:From:Reply-To:Subject:To:MIME-Version:Content-Type:Content-Transfer-Encoding; b=EH5WyKMlRBBO5yG4en4Xrx+Z9/vbPaXM8uumTfkqEKERnRd7+/5IwmfoR2zWtyotNm+AGEVlfn6s9BMHjRJRWKopmUL/kmZXV6kWbaMfwr4AilV5hlYCAsGZlSGl2GSExxzwvqjTBl4NdF0zOzaS6O/2Wx41AwFiOV5Sskd6VIQ=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org


i'm using a linux host as a router to perform some security testing. Th=
e testing is typically towards tcp based services. Currently the router=
 is setup like this, with my test traffic coming into the box on eth0, =
exiting on eth1:

eth0 192.168.1.1/30
eth1 10.1.0.1/23

Due to policy from a networking group, I need to ensure that the number=
 of established connections during my testing never exceeds 20 connecti=
ons thru other devices that i may traverse beyond my linux router. I'm =
not as concerned with bandwidth as i am with state tables on downstream=
 devices i have no control over. It seems to me that this could be acco=
mplished if i can ensure that established connections from eth1 do not =
exceed 20 connections.

So, after a really quick peek at iptables(8) i came up with:

iptables -A OUTPUT -o eth1 -p tcp -m connlimit --connlimit-above 20 -j =
LOG --log-prefix "rl-queue: "
iptables -A OUTPUT -o eth1 -p tcp -m connlimit --connlimit-above 20 -j =
QUEUE

and maybe better using --syn:

iptables -A OUTPUT -o eth1 -p tcp --syn -m connlimit --connlimit-above =
20=A0 -j LOG --log-prefix "rl-queue: "
iptables -A OUTPUT -o eth1 -p tcp --syn -m connlimit --connlimit-above =
20 -j QUEUE

This definitely seems to be limiting traffic, but i'm not really sure i=
f it's what i'm after and if the QUEUE target is working like i think i=
t is (probably not). I guess my questions are:

- does anyone have any suggestions on rules that will help me limit the=
 number of connections outbound

- can the QUEUE target act as a fifo queue, or is it entirely dependent=
 on something in userspace to queue the packets up and send them back t=
o iptables when the rate limiting numbers have dropped below the thresh=
old?

I'm really concerned with the queuing aspect because i don't want poten=
tially important packets from a portscan to get dropped on my side and =
an open port go undetected.


thanks for any suggestions!

-samson



     =20
