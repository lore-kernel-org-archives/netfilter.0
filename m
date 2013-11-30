From: ilic_68@yopmail.com
Subject: iptables redirects packets to local proxy
Date: Sat, 30 Nov 2013 09:46:06 -0700
Message-ID: <201311301646.rAUGk6rg005227@p3slhssl14.shr.phx3.secureserver.net>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------37644e13935173f9d80cd76ab0c6d80e"
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org

This is a multi-part message in MIME format.
--------------37644e13935173f9d80cd76ab0c6d80e
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello,

consider this scenario:

PC1 wants to telnet to SRV1 tcp 40000.

I would like to put a proxy in the middle that receives the
connection, rewrites the destination, sends packet to a local socks proxy (redsocks).

So the scenario would be:

PC1 --> PROXY tcp 20000 [iptables rewrites destination to SRV tcp 40000 --> redsocks 127.0.0.1 tcp 12345] --> SRV1 tcp 40000

I tried:
iptables -t nat -A PREROUTING -p tcp -s $MYSOURCEIP --dport 20000 -j DNAT --to $SRV1:40000

It works, but I know it doesn't go through redsocks.
I just changed the destination for the packets but how can I force them to flow into redsocks?

Thank you for any help, Ilic


--------------37644e13935173f9d80cd76ab0c6d80e--
