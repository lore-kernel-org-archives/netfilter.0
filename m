From: Andrew Kraslavsky <andykras@hotmail.com>
Subject: Locking needed for iptables target vs ioctl?
Date: Wed, 23 Jan 2008 18:55:42 -0800
Message-ID: <BAY119-W3037296726753B702E3B55D6380@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org


All,

My question relates to locking requirements in an iptables target module on a single CPU system.

If, in addition to the regular netfilter target inteface, a module also implements support for interaction via ioctl, does the module need to worry about the locking of data structures to ensure that the target invocation and the ioctl do not collide over access to the data structures?

I have seen where ipt_recent.c, which includes a /proc file system interface in addition to the regular iptables match interface, uses such locking and am wondering if that is solely out of concern for the SMP case or whether it also applies to a single processor system.

Thanks,

- Andrew Kraslavsky
_________________________________________________________________
Connect and share in new ways with Windows Live.
http://www.windowslive.com/share.html?ocid=TXT_TAGHM_Wave2_sharelife_012008