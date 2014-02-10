From: "Theo Belder" <T.Belder@trends.nl>
Subject: PREROUTING in nat table isn't working as aspected
Date: Mon, 10 Feb 2014 13:52:42 +0100
Message-ID: <F57C6B5920056B48955ABFCF0A95493603BDAA42@mail-01.trends.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-class: urn:content-classes:message
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

We have sometimes a problem with SIP brute force attacks, and consumes
all the available bandwidth. The attacker keeps sending SIP REGISTER
messages, even they don't get a response.
What I'm trying to do is to redirect the traffic to an alternative port
which will respond with a message so the attack assumes they have a
valid registration and stops the attack. Redirecting is necessary
because the service on the original port should not be interrupted.

The following rule I've added to iptables:
iptables -t nat -A PREROUTING -s 222.186.29.98 -p udp --dport 5060 -j
REDIRECT --to-port 5050

But after inserting (and restarting iptables), the packets were not
redirected to port 5050.
My guess was it has something to do with the ip_conntrack module, so I
inserted the following rules in iptables:
iptables -t raw -A PREROUTING -s 222.186.29.98 -p udp --dport 5060 -j
NOTRACK
iptables -t raw -A OUTPUT -d 222.186.29.98 -p udp --sport 5060 -j
NOTRACK

after 180 secs the conntrack table didn't mentioned the IP address
anymore (cat /proc/net/ip_conntrack | grep 222.186.29.98), but the
traffic was still not redirected. Still the packets were accepted by the
rule for accepting port 5060 (checked it with iptables -L -v)

So, I inserted a prerouting rule in the NAT table for a different IP
address (one of my own) and generated a UDP packet for port 5060. That
packet was redirected immediately to port 5050. So the redirect table
works for new connections. But for continuous existing traffic the
PREROUTING rule isn't working...

Do you have tips for redirecting traffic for an active traffic flood??

Best regards,
Theo




