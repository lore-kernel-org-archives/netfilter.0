From: "Jorge Bastos" <mysql.jorge@decimal.pt>
Subject: How to do nat filtering in 1.4.3.2
Date: Wed, 22 Apr 2009 22:48:07 +0100 (WEST)
Message-ID: <3276.87.196.144.12.1240436887.squirrel@webmail.decimal.pt>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi people,

Before in 1.4.2 and older, I used to do some filtering in the nat table,
and I saw a warning about that feature going to be disabled, and saw that
in 1.4.3.2 already is.

In 1.4.2:
--
The "nat" table is not intended for filtering, hence the use of DROP is
deprecated and will permanently be disabled in the next iptables release.
Please adjust your scripts.
--

In 1.4.3.2:
--
iptables -t nat -A PREROUTING -p tcp --dport 1863 -j ACCEPT # msn iptables
-t nat -A PREROUTING -p tcp --dport 5900 -j ACCEPT # vnc iptables -t nat
-I PREROUTING -d 193.164.158.105 -j DROP iptables -t nat -A PREROUTING -j
DROP iptables v1.4.3.2:
The "nat" table is not intended for filtering, the use of DROP is
therefore inhibited.
--

I use this, to allow the users that are using my linux machine, action as
a router, to connect to the outside world only to the ports I want, and
block some stuff.
How to do this now on?

Thanks,
Jorge,


