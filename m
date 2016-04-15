From: "Deep Preet Singh (desingh)" <desingh@cisco.com>
Subject: DNAT module name & Kernel flag
Date: Fri, 15 Apr 2016 21:31:23 +0000
Message-ID: <D336ABB9.193096%desingh@cisco.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=546; q=dns/txt; s=iport;
  t=1460756612; x=1461966212;
  h=from:to:subject:date:message-id:content-id:
   content-transfer-encoding:mime-version;
  bh=esV9LTmocjOeGLYZYWc1JHrqY1PGVvMqThVFjJzX+wM=;
  b=Wg0gF42Q29ReIoEu4bJbdZZMe2ZA8tv5pZyT9aqwwdlT+DGNoksorCkh
   dQ+ZpizZFEaoucOkUikv7SX6dlPNhqtkQYv9t3C4/9XnvLr2SpZcNWtTW
   XLrXzWIsXThTrNl8V+0lRTGLwjhZjN7UENqSpDjMxDnM6QERGL2XLK8S2
   w=;
Content-Language: en-US
Content-ID: <6EB020B7D1980F4982CC482124D28C01@emea.cisco.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

I am on 3.10.90-rt97+ on mips64. Using DNAT/SNAT with iptables for nat
gives an error :

iptables -t nat -A PREROUTING -i mgmtbr -p icmp -j DNAT --to-destinatio=
n
123.123.123.123
iptables: No chain/target/match by that name.

What are the kernel config flags that will enable DNAT & SNAT modules t=
o
be built in kernel? And what are the module names that I need to instal=
l?

Also, want to confirm if MASQUERADE takes care of reverse Natting too
(changes destination address on packets) =AD it appears to do so, but w=
ant
to confirm.=20

