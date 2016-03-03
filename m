From: Sebastian Damm <damm@sipgate.de>
Subject: "Operation not permitted" from nf_conntrack under high UDP load
Date: Thu, 3 Mar 2016 15:31:23 +0100
Message-ID: <CABkWSFxpuoGST0CuSrYKb15dOixPvJ0aCzQof2A7aXqY_06_PA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sipgate-de.20150623.gappssmtp.com; s=20150623;
        h=mime-version:from:date:message-id:subject:to;
        bh=sopyBUQWJx3TvsCYNeilSLaMw6HiyfFYZM7L8OJZ7kY=;
        b=S3cqzFV6Rj7liLa1M2NMUHqyb9MK2hYnBxsn8Yy9FTU8uQUNU9zRVEuvt1TeOjhNtx
         SrLuV6wpTGN2BIo+qcxoc1Y/ri48YV90hrF92VBcvPVXpd8XjmvBup6Od+LGFC1b+buz
         vt+3KHKdahaWOzZ3IKERS0R8tUh+oUGWVOpEdTfUKojuZe3UPivtQKIXbFO8GqeO+AYz
         3Ryb8pGhLGS+6tDAuDINcCox/8pkG+E6YhIxfQ+NkOepQK6XsolbAFPeX+NIzDYkXtCH
         GwphbbfI3a/Zya/7OT2PhzvnkQj6Krf8grTlr6MYSJXcCBoGvgF+1jt4L0siVmzXyJ9W
         5bTQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

we have a SIP signalling server, which communicates with hundreds of
thousands of clients all over the world. There are basically just two
services on this host - SIP and STUN. Both services are UDP only.

This server is running with a permanent bandwidth of 20-40 Mbit of UDP
traffic. We have a stateful firewall on it with quite a few rules, the
conntrack table is filled with more than 300k entries, max is at 800k.

In the SIP server log we see about 10k times per day the following messages:

Mar  3 06:25:31 dalke /usr/sbin/kamailio[30372]: ERROR: <core>
[udp_server.c:550]: udp_send():
sendto(sock,0x7f28fe924000,459,0,89.204.130.xxx:34246,16): Operation
not permitted(1)
Mar  3 06:25:56 dalke /usr/sbin/kamailio[30369]: ERROR: <core>
[udp_server.c:550]: udp_send():
sendto(sock,0x7f28fe933218,411,0,213.47.42.xxx:5060,16): Operation not
permitted(1)
Mar  3 06:25:57 dalke /usr/sbin/kamailio[30588]: ERROR: <core>
[udp_server.c:550]: udp_send():
sendto(sock,0x7f82abe4ef28,420,0,217.116.117.xxx:5060,16): Operation
not permitted(1)
Mar  3 06:26:07 dalke /usr/sbin/kamailio[30330]: ERROR: <core>
[udp_server.c:550]: udp_send():
sendto(sock,0x7f28fe996f70,373,0,178.21.0.xxx:5060,16): Operation not
permitted(1)
Mar  3 06:26:37 dalke /usr/sbin/kamailio[30357]: ERROR: <core>
[udp_server.c:550]: udp_send():
sendto(sock,0x7f28fe997178,422,0,37.47.161.xxx:5669,16): Operation not
permitted(1)
Mar  3 06:26:56 dalke /usr/sbin/kamailio[31025]: ERROR: <core>
[udp_server.c:550]: udp_send():
sendto(sock,0x7fbee39627c8,477,0,178.27.35.xxx:57454,16): Operation
not permitted(1)

Since every hint in the internet points to iptables for this error, we
cleared all rules. But the messages don't stop.

So we rebooted the machine to have a clear state without firewall.
After that the problem was gone.

Now we just executed "iptables -nvL" and then inserted the modules
nf_conntrack and nf_conntrack_ipv4. After that those messages appeared
again. We can reproduce it by removing and adding those two modules,
causing the errors to disappear and reappear.

We are using Debian Wheezy, and tried it with the standard 3.2.0
kernel and 3.16.0 backports kernel, both show the same behaviour.

Has anybody seen this before? And is there any solution (besides using
a non-stateful firewall)? We tried tweaking the hashsize option when
loading the module, raised the conntrack_max and conntrack_expect_max
values, without any change. Are there other options which might help
in our scenario?

Thanks,
Sebastian
