From: Curby <curby@cur.by>
Subject: Playing nice with incoming traceroutes
Date: Fri, 14 May 2010 15:17:50 -0600
Message-ID: <AANLkTimnTBPl5oayp3tprDmROD4bNpIXyAodkZuF_JlS@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello, I'm considering allowing inbound traceroutes to find me, in the
interest of being a good Internet citizen.  I could simply open the
right udp ports, but i'd rather more tightly control what's allowed
than simply opening them up entirely.  Thus I'm considering something
like the following.  Should it meet my expectations of responding
appropriately to traceroutes but otherwise not letting traffic
through?

-A INPUT -p udp --dport 33434:33534 -m ttl --ttl-eq 1 -j REJECT
--reject-with icmp-port-unreachable

I'm using ttl-eq 1 because that's the lowest TTL that showed up in my
netfilter logs when I tried to traceroute my machine earlier.  In
other words, I don't think I should use 0, but am willing to be
convinced otherwise.

Also, I'm a little unsure if I should be using another ICMP code when
I send the REJECT packet.  But port unreachable seemed reasonable. =)

Thanks!

--Mike
