From: Richard Tollerton <rich.tollerton@ni.com>
Subject: Bug? EPERM on UDP send if packet is DROPped on OUTPUT
Date: Fri, 18 Jan 2013 12:56:45 -0600
Message-ID: <20130118185645.GA2059@weregild.amer.corp.natinst.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

This seems very wrong to me:

$ sudo iptables -A OUTPUT -p udp --dport 11111 -j DROP

$ socat UDP-DATAGRAM:192.168.0.1:11111 - <<< "FOO"
2013/01/18 12:46:04 socat[2356] E sendto(3, 0x761ac0, 4, 0, AF=2 192.168.0.1:11111, 16): Operation not permitted

$ strace socat UDP-DATAGRAM:192.168.0.1:11111 - <<< "FOO" |& grep '^\(sendto\|\+\)'
sendto(3, "FOO\n", 4, 0, {sa_family=AF_INET, sin_port=htons(11111), sin_addr=inet_addr("192.168.0.1")}, 16) = -1 EPERM (Operation not permitted)
+++ exited with 1 +++

DROPped packets are supposed to be dropped on the floor, right? If so,
no error ought to be reported to userspace.

This issue does not reproduce for TCP: if the rule and socat command
line are changed appropriately, the connection simply times out. This is
the behavior I would expect.

If this is a bug, would I be correct to intuit that it's probably a bug
in the UDP send code? (ie that it should be filtering out netfilter
error codes that the TCP code path is apparently doing?)

---
Richard Tollerton <rich.tollerton@ni.com>
