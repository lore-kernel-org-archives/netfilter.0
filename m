From: Nicolas Boullis <nicolas.boullis@ecp.fr>
Subject: Why are some packets INVALID?
Date: Tue, 10 Feb 2009 10:34:19 +0100
Message-ID: <49914A1B.40401@ecp.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello,

I've been using a netfilter-based border firewall for month, with full
satisfaction.
And a few days ago, some users started complaining about difficulites
accessing an external https service...

After some investigation, I found that some packets were dropped by the
firewall. The local client sends SYN packets that go nicely through the
firewall; the remote server sends SYN+ACK packets that get dropped.
After a few resends (both ways), le local client sends a RST packet, and
then a new SYN packets (same source port), the server replies and the
reply goes through the firewall.

The first input rule is "-m state --state INVALID -j DROP". I added an
exception to accept packets from the remote server port 443, even when
they are INVALID, and now things work fine.

Now, I see that many packets get accepted by this workaround. Some
packets have SYN+ACK, but there are also some with ACK, ACK+PSH or
ACK+FIN...

Is there a way I can investigate why netfilter considers those packets
INVALID?

I tried to set /proc/sys/net/ipv4/netfilter/ip_conntrack_tcp_be_liberal
and then only some SYN+ACK packets get accepted by the workaround, but I
have not really understood what this ip_conntrack_tcp_be_liberal option
does. Moreover, it is not sufficient, since there are still some SYN+ACK
packets that are considered INVALID.

I also tried to set
/proc/sys/net/ipv4/netfilter/ip_conntrack_log_invalid but I only got 1
packet logged every few seconds, but nothing related to the remote
service I have problems with.


Regards,

Nicolas
