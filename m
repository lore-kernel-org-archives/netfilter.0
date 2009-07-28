From: "Alec Matusis" <matusis@yahoo.com>
Subject: now to increase ip_conntrack_max in 2.6.28?
Date: Mon, 27 Jul 2009 23:26:16 -0700
Message-ID: <010b01ca0f4c$50596f10$f10c4d30$@com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-us
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I need to increase the number of connections that netfilter can track on a
production server, to avoid "ip_conntrack: table full, dropping packet"
messages.
On 2.6.24 (ubuntu 8.04) it was:
echo 524288 > /proc/sys/net/ipv4/netfilter/ip_conntrack_max

On 2.6.28 (ubuntu 9.04) the entire /proc/sys/net/ipv4/netfilter directory is
missing. Moreover, 

find / -name ip_conntrack_max 

returns NOTHING.

How do I increase this?

