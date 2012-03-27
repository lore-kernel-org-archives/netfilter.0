From: Firstname Lastname <forbiddentransition@gmail.com>
Subject: iptables and the owner module
Date: Tue, 27 Mar 2012 19:45:21 -0400
Message-ID: <20120327194521.00a33d86@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=date:from:to:subject:message-id:x-mailer:mime-version:content-type
         :content-transfer-encoding;
        bh=V5p5L6+29uDg93i8UUPccwOLggwwvRvVw5Rse58YJf0=;
        b=UZcETrbA9YQdKadFzsCQSGaIhCKr0WueEarmuzXsZDil+QJLOqNNc5w7lUZmYxo1q7
         PtJ091VP7i9bZN4zBKr6LdOUbmQRfd5OFCMe/nKCRghZV24Fm7Ca+4odwZaC8lFzCXmp
         i2RtvU+Ns4OfAL9RM5zjW7ozdUDXzKMdlYKj3vagg7G9vElHC+o83jnLzjnRr99wOf7R
         PKpagZ7atYqAi3wKwG9/yn2G0rW58YP2y8MMWW5FvmhQZ8jlNtUCicJnE5F4Uvgib6ku
         d6SUzMrIlhNyQ7Xt4kWZ2xD2ds43c5+vFCgHRJA/J7RKvnW/FP6Yu+JiwxNjZGwDaFy5
         A5nw==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Iptables is dropping network connections to google.com (and bing.com) for a reason that is unclear.
Iptables is configured with the owner module and is set to ACCEPT outgoing packets matching '--uid-owner 1000'.
Subsequently, packets that do not match '--uid-owner 1000' and are associated with an open socket are logged then dropped.
The relevant lines in the iptables configuration are indicated below:

...
-A OUTPUT -o eth0 -p tcp -m tcp --sport 32768:61000 -m multiport --dports 80,443 -m conntrack --ctstate NEW,ESTABLISHED -m owner --uid-owner 1000 -j ACCEPT
-A OUTPUT -o eth0 -p tcp -m tcp --sport 32768:61000 -m multiport --dports 80,443 -m conntrack --ctstate NEW,ESTABLISHED -m owner --socket-exists -j LOG --log-tcp-options --log-ip-options --log-uid --log-level 7
-A OUTPUT -o eth0 -p tcp -m tcp --sport 32768:61000 -m multiport --dports 80,443 -m conntrack --ctstate NEW,ESTABLISHED -m owner --socket-exists -j DROP
...

The following log output is generated prior to being dropped:

IN= OUT=eth0 SRC=192.168.2.2 DST=173.194.73.103 LEN=60 TOS=0x00 PREC=0x00 TTL=40 ID=7363 DF PROTO=TCP SPT=58642 DPT=80 WINDOW=5840 RES=0x00 SYN URGP=0 OPT (020405B40402080A1D88900B0000000001030307) UID=1000 GID=1000

As indicated in the log output, the packet socket's file structure is owned by userid 1000 and thus should match the preceding configuration line with the ACCEPT target.

Any suggestions as to why iptables is dropping the packet and/or why it's specific to google.com (and bing.com)?

Running Debian Squeeze (kernel 2.6.32 or 3.2.9) with iptables (1.4.8-3).
I can provide additional info if necessary.

Thanks in advance.
