From: Jens Taprogge <jlt_kernel@shamrock.dyndns.org>
Subject: 2.6.16-rc3 panic related to IP Forwarding and/or Netfilter
Date: Tue, 14 Feb 2006 18:34:56 +0100
Message-ID: <20060214173455.GA19355@ranger.taprogge.wh>
Mime-Version: 1.0
Return-path: <linux-net-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-net-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, linux-net@vger.kernel.org, netfilter@lists.netfilter.org

Hello.

After upgrading from 2.6.13 an IP Masquerading router panics as soon as
soon as packages are forwarder (or rather should be).  As long as IP
Masquerading is disabled (and thus no forwarding occurs) the box runs
stable.

A picture of the panic ouput can be found at:
http://shamrock.dyndns.org/~ln/kernel/2.6.16rc3_panic/panic.jpg
The config is at:
http://shamrock.dyndns.org/~ln/kernel/2.6.16rc3_panic/config-2.6.16-rc3-g51d6aa16-dirty

The kernel was patched to support SIP-contrack however the extra files
have not been compiled and should thus have no influence.

Please cc me on replies as I am not subscribed to the lists.

Best Regards
Jens Taprogge
