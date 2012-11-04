From: Justin Piszcz <jpiszcz@lucidpixels.com>
Subject: iptables/iproute2 stops routing until ip route flush cache is run
Date: Sat, 3 Nov 2012 20:25:24 -0400
Message-ID: <CAO9zADxSAi-s9cY8XcNp64g34xHG0RvZhwozVJqiNEbqQkRWCg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: netfilter@vger.kernel.org

Hello,

I have a number of firewall rules/iproute2/rules/routes setup and was
curious, once and awhile, routing (behind the Linux host will stop
working (clients cannot get out past the Linux host after awhile), if
I run ip route flush cache it starts working again.

In my route script (after the firewall script) I run ip route flush
cache last, (presumably) after an /etc/init.d/network* restart it will
flush the cache again..

Was just curious was is the most common reason for that problem to
occur?  My guess is the order of the interface initialization
(eth0..eth6) and when I flush the cache, I flush it on eth2 regularly,
I had been running, e.g.

eth6 (definition)
post-up /sbin/ip route flush cache

Is there a =91best=92 time to flush the cache or how best do I determin=
e
what is causing this issue?

Justin.
