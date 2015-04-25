From: Jose Miguel Sanchez Ales <josem+netfilter@iescyedra.es>
Subject: IP SNAT only for a bridge port, =?UTF-8?Q?=C2=BFis=20it=20possibl?=
 =?UTF-8?Q?e=3F?=
Date: Sat, 25 Apr 2015 19:02:17 +0200
Message-ID: <90ba4ebbeb4ab8f03cf5db4ebd5d6063@iescyedra.es>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi subscribers,

In this case:


                   +-------+      eth1
              eth0 |       |br0  +-----    NETWORK 2
  NETWORK 1 -------+ HOST  +-----+
                   |       |     +-----    NETWORK 2
                   +-------+      eth2

when a packet arrives from eth0, I'd like to change its source IP
*only* if it leaves the host through bridge port eth1.

I've take a look at "packet flow scheme":

http://inai.de/images/nf-packet-flow.png

but the packet pass the ebtables output chain *after* passing
iptables nat postrouting chain. Passing ebtables output chain is
the first time that I can check the output bridge port, so I think
it's impossible, is it?

Thanks in advance.
