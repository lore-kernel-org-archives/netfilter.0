From: Simon Tennant <simon@imaginator.com>
Subject: corrupted netfilter logging using ulogd
Date: Mon, 28 Sep 2009 10:29:26 +0200
Message-ID: <4AC073E6.7060009@imaginator.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I've been trying to debug the reason for my netfilter  (kernel version
2.6.24-19)  using:

    " -j ULOG --ulog-prefix drop-inbound:"

logs being corrupted.  By corrupted, I mean they look like:
> Jan  1 00:00:00 cave IN=<87><9B> OUT= MAC= SRC=0.0.0.0 DST=0.0.0.0
> LEN=0 TOS=00 PREC=0x00 TTL=0 ID=0 PROTO=0
> Jan  1 00:00:00 cave IN=]<99> OUT= MAC= SRC=0.0.0.0 DST=0.0.0.0 LEN=0
> TOS=00 PREC=0x00 TTL=0 ID=0 PROTO=0
> Jan  1 00:00:00 cave IN=<D0>_^F OUT= MAC= SRC=0.0.0.0 DST=0.0.0.0
> LEN=0 TOS=00 PREC=0x00 TTL=0 ID=0 PROTO=0
> Jan  1 00:00:00 cave IN=/^A^G OUT= MAC= SRC=0.0.0.0 DST=0.0.0.0 LEN=0
> TOS=00 PREC=0x00 TTL=0 ID=0 PROTO=0
> Jan  1 00:00:00 cave IN=<E0><99> OUT= MAC= SRC=0.0.0.0 DST=0.0.0.0
> LEN=0 TOS=00 PREC=0x00 TTL=0 ID=0 PROTO=0

    * Times are always the start of the unix epoch,
    * the interface is always non-ascii characters. (actual interface is
      eth0).
    * "drop-inbound" prefix is missing

I'm currently logging with ulogd (ulogd Version 1.23):

modprobe ipt_ULOG nlbufsiz=65535 flushtimeout=100

and ulogd.conf contains:

bufsize=150000
rmem=131071
file="/var/log/firewall.log"
plugin="/usr/lib/ulogd/ulogd_BASE.so"
plugin="/usr/lib/ulogd/ulogd_LOGEMU.so"

Other information is that this box is an Ubuntu Intrepid Xen virtual
machine.  The other virtual machines have no problem with logging
packets,  just this one.

I'm now somewhat at a loss for how to debug this further so any pointers
would really help.

S.

-- 
Simon Tennant _____________________________________________

fixed: .uk +44 20 7043 6756          .de +49 89 420 955 854  
  mob: .uk +44 78 5335 6047          .de +49 17 8545 0880
 xmpp: simon@buddycloud.com

