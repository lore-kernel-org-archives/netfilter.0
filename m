From: Federico Di Sante <federico.disante@duet.it>
Subject: How to limit the number of connection of a "certain type"?
Date: Thu, 3 Oct 2013 17:13:58 +0200
Message-ID: <CANQgTc+TyjvpdYdRy4Y=BBoO_XFavSFFdooRukB=RWC1cEPn_g@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello,

I would like to configure the Netfilter to limit the number of
connections of a "certain type".

The connlimit match does not seem to meet my needs. From the man page,

"... Allows you to restrict the number of parallel connections to a
server per client IP address (or client address block). ..."

the connlimit match counts the connection to a server (a single
destination IP, I suppose) from an IP address (client IP) or client
address block.

I would rather count (and limit) the number of connections based on my
own classification. For example, I would like to limit the number of
connection from IPs in a given subnet and directed to IPs in another
given subnet.

I guess I can reach the goal using the quota2 match, which give me the
ability to increase and decrease a counter: essentially I'll increase
the counter with a SYN packet and decrease the counter with a FIN
packet. But this solution is incomplete: it can not count the
connections not closed with a FIN packet (time outed connections) and
It can't manage the UDP connections (already properly managed by the
conntrack module).

I hope my explanation is clear.

Thank you.

Federico
