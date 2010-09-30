From: Shihwei Li <lishihwei@gmail.com>
Subject: nfqnl_test exits abnormally while monitoring some TCP packets.
Date: Thu, 30 Sep 2010 16:03:49 -0400
Message-ID: <AANLkTikz1tOWnvTYXZ1Z3cBh+mZLZ_qz2sgmFS94fT3g@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:mime-version:received:from:date
         :message-id:subject:to:content-type;
        bh=MfzVUxK7vxZLp9GKD661TE0R4zN37Fg5BTYBzr234f4=;
        b=rh7MHkp1TsUkRy9pMi4MVf5EdKsVnpD0RlcGljwSHxpA4EKLtQjYcFmcpT+w0uEjFG
         bQm5K5IpqEuHu54VjiVTAILC/CMTTfNVOhao1m6odLf3GDuMvZBEwTE7wWoAND5MX36y
         z+rzPUvhOhWzwuZhx0P6B0sX74UGVVk/JQN74=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

I am new to libnetfilter_queue and I need some helps. In short, I used
the distributed nfqnl_test.c to monitor some HTTP/TCP packets and the
nfqnl_test exits abnormally.

I will try to describe my situation as accurately as possible.

I plan to develop a program upon libnetfilter_queue to filter/inspect
some HTTP/TCP packets.
As a starter, I tried to run the test program, nfqnl_test.c from the
libnetfilter_queue distribution.

Here is what I did:
* Set up a simple python http server on port 50007.
(http://docs.python.org/library/basehttpserver.html)

* Running iptables rules to pipe outgoing tcp packets from port 50007
to the queue 0:
** The rule is " /sbin/iptables -A OUTPUT -p tcp --sport 50007 -j
NFQUEUE --queue-num 0"
** The iptables output is

     Chain OUTPUT (policy ACCEPT)
     target     prot opt source               destination
     NFQUEUE    tcp  --  anywhere             anywhere            tcp
spt:50007 NFQUEUE num 0

* Running the nfqnl_test program on the web server side.

* On another machine, open a web browser, and connect to the python web server.

Everything went well, the browser could browse normally, and
nfqnl_test on the server side could print the outgoing TCP packets
info and reinject the packet into the queue ( verdict= NF_ACCEPT).

UNTIL (see below) when the browser started to try to download (or
open) a (big) zip file on the server side. The nfqnl_test program
always exited from the callback loop during the middle of file
downloading. I repeated five or so times (even trying open different
file), the behavior is quite persistent.

Is it possible a bug in the system? Or did I use the nfqnl_test
wrongly? Or something else? Any suggestion?
Thanks a lot.

--peter

Here are the details of my system:

* OS:  Linux .. 2.6.21-2950.fc8xen #1 SMP Tue Oct 23 12:24:34 EDT 2007
i686 i686 i386 GNU/Linux
* libnfnetlink-1.0.0
* libnetfilter_queue-1.0.0
* iptables v1.3.8


Here is the output of the nfqnl_test:

[root@ar21-222 utils]# ./nfqnl_test
opening library handle
unbinding existing nf_queue handler for AF_INET (if any)
binding nfnetlink_queue as nf_queue handler for AF_INET
binding this socket to queue '0'
setting copy_packet mode
pkt received
hw_protocol=0x0000 hook=3 id=1 outdev=2 payload_len=60
entering callback
pkt received
hw_protocol=0x0000 hook=3 id=2 outdev=2 payload_len=52
entering callback
pkt received
hw_protocol=0x0000 hook=3 id=3 outdev=2 payload_len=52
entering callback
pkt received
hw_protocol=0x0000 hook=3 id=4 outdev=2 payload_len=1500
entering callback
pkt received
hw_protocol=0x0000 hook=3 id=5 outdev=2 payload_len=69
entering callback
pkt received
hw_protocol=0x0000 hook=3 id=6 outdev=2 payload_len=1500
entering callback
pkt received
hw_protocol=0x0000 hook=3 id=7 outdev=2 payload_len=60
entering callback
pkt received
hw_protocol=0x0000 hook=3 id=8 outdev=2 payload_len=52
....
hw_protocol=0x0800 hook=3 id=366 outdev=2 payload_len=1500
entering callback
pkt received
hw_protocol=0x0800 hook=3 id=367 outdev=2 payload_len=1500
entering callback
pkt received
hw_protocol=0x0800 hook=3 id=368 outdev=2 payload_len=1500
entering callback
pkt received
hw_protocol=0x0800 hook=3 id=369 outdev=2 payload_len=1500
entering callback
pkt received
hw_protocol=0x0800 hook=3 id=370 outdev=2 payload_len=1500
entering callback
pkt received
hw_protocol=0x0800 hook=3 id=371 outdev=2 payload_len=1500
entering callback
unbinding from queue 0   <---------------------------------out from the loop
hw_protocol=0x0800 hook=3 id=372 outdev=2 payload_len=1500
entering callback
hw_protocol=0x0800 hook=3 id=373 outdev=2 payload_len=1500
entering callback
hw_protocol=0x0800 hook=3 id=374 outdev=2 payload_len=1500
entering callback
hw_protocol=0x0800 hook=3 id=375 outdev=2 payload_len=1500
entering callback
hw_protocol=0x0800 hook=3 id=376 outdev=2 payload_len=1500
entering callback
hw_protocol=0x0800 hook=3 id=377 outdev=2 payload_len=1500
entering callback
hw_protocol=0x0800 hook=3 id=378 outdev=2 payload_len=1500
entering callback
...
hw_protocol=0x0800 hook=3 id=426 outdev=2 payload_len=1500
entering callback
hw_protocol=0x0800 hook=3 id=427 outdev=2 payload_len=1500
entering callback
hw_protocol=0x0800 hook=3 id=428 outdev=2 payload_len=1500
entering callback
hw_protocol=0x0800 hook=3 id=429 outdev=2 payload_len=1500
entering callback
hw_protocol=0x0800 hook=3 id=430 outdev=2 payload_len=1500
entering callback
hw_protocol=0x0800 hook=3 id=431 outdev=2 payload_len=1500
entering callback
hw_protocol=0x0800 hook=3 id=432 outdev=2 payload_len=1500
entering callback
closing library handle  <---- finish close the library
