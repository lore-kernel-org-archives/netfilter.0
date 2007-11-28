From: "Jason Hawthorne" <jhawthorne@lexionmedical.com>
Subject: Forwarding traffic from public IP to public IP.
Date: Wed, 28 Nov 2007 10:09:21 -0600
Message-ID: <AFB1C16E164D73439741623EBFEA771C4DB039@lex-exch1.lexionmedical.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-class: urn:content-classes:message
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I need to temporarily forward all traffic from one public IP address
(a.b.c.d) to another public IP address (e.f.g.h). I have tried setting
up iptables with the following rule

-t nat -A PREROUTING -d a.b.c.d -j DNAT --to-destination e.f.g.h

but it doesn't seem to be working. As far as I can tell the traffic is
getting forwarded to the final ip (e.f.g.h) but when the return traffic
comes back it doesn't come back through the debian box, it goes straight
to the source and fails. Basically it skips the debian box on its return
like this

SOURCE ---> DEBIAN (iptables with nat) ---> DESTINATION ---> SOURCE

Is there a way to get this working with iptables?

-
Jason Hawthorne



