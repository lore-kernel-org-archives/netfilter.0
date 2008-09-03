From: Bernhard Bock <mailinglists@bock.nu>
Subject: Re: conntrackd failover works partially, was Re: conntrack performance
 test results in INVALID packets
Date: Wed, 03 Sep 2008 13:26:53 +0200
Message-ID: <48BE747D.3010106@bock.nu>
References: <488064DD.5080509@bock.nu> <alpine.LNX.1.10.0807181212331.12734@fbirervta.pbzchgretzou.qr> <488075F1.80901@bock.nu> <4880891C.4090004@netfilter.org> <4880A6BA.6030007@bock.nu> <489C0835.3090900@netfilter.org> <48BD09B6.5010905@bock.nu> <48BD0DD6.9000803@netfilter.org> <48BD32CC.5010203@bock.nu> <48BD362C.8020301@netfilter.org> <48BD5931.7050703@bock.nu> <48BD6846.9030006@netfilter.org> <48BD6FEC.5090100@bock.nu> <48BE5547.8030505@netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <48BE5547.8030505@netfilter.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

Hi Pablo,

Pablo Neira Ayuso wrote:
>>> Is the firewall sending RST packets to the peer/server to close
>>> connections? If so, I remember a similar report with a RHEL kernel:

I do not see any RST packets, neither on server nor on client side.

I have done more tests this morning. Unfortunately, things are complicated:

I repeated a basic failover test lots of times while making 1.000.000
connections. This test with 1000 parallel connections breaks every time.
500 is OK every time.

The kernel only has problems with 1000 connections, and then only from
time to time. In most of the cases (I guess ca. 80% of all tests), I do
not need to unload/load the kernel modules, but only clear the conntrack
table to get it back up running. The other times I have to reload the
kernel modules in order to make the system work again. I cannot see any
pattern there.

Best regards
Bernhard
