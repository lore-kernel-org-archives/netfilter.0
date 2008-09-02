From: Bernhard Bock <mailinglists@bock.nu>
Subject: Re: conntrackd failover works partially, was Re: conntrack performance
 test results in INVALID packets
Date: Tue, 02 Sep 2008 18:55:08 +0200
Message-ID: <48BD6FEC.5090100@bock.nu>
References: <488064DD.5080509@bock.nu> <alpine.LNX.1.10.0807181212331.12734@fbirervta.pbzchgretzou.qr> <488075F1.80901@bock.nu> <4880891C.4090004@netfilter.org> <4880A6BA.6030007@bock.nu> <489C0835.3090900@netfilter.org> <48BD09B6.5010905@bock.nu> <48BD0DD6.9000803@netfilter.org> <48BD32CC.5010203@bock.nu> <48BD362C.8020301@netfilter.org> <48BD5931.7050703@bock.nu> <48BD6846.9030006@netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <48BD6846.9030006@netfilter.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

Pablo,

Pablo Neira Ayuso wrote:
> Hm, the new script does exactly the same when the node becomes primary
> as it used to do script_master.sh, so I cannot find a reason why the new
> script does it worst.

It does worse than my own script (with the horrible workaround). It does
equally good as your original script.


> During the fail-over, keepalived recovers the virtual IPs and conntrackd
> commits the states into the kernel. The commit takes very short but you
> can still lose some packets if the state is not yet present in the
> kernel - thus, these packets are logged as invalid and dropped as we
> don't find any matching state (with a sane stateful rule-set, of
> course). *However*, the TCP sessions should recover as the peer or the
> server retransmits the packet in short, so I don't understand why you
> lose nearly all the sessions.

Agreed. My problem is, it doesn't recover. It keeps dropping packets as
long as the test runs (the test stops at some point in time with socket
timeouts).


> Is the firewall sending RST packets to the peer/server to close
> connections? If so, I remember a similar report with a RHEL kernel:

Will check tomorrow.


> conntrack -F should be enough, there's something wrong in the kernel.
> There were other issues related with nat.

This is happening entirely without NAT. And it is only appearing while
using conntrackd and doing a failover. With a standalone firewall, I
cannot reproduce this behavior. I haven't tested any other software
using netlink, like e.g. ULOG, though.

Best regards
Bernhard

