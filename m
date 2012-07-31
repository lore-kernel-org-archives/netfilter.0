From: rajesh <rajesh.modhwadiya@elitecore.com>
Subject: replace nf_nat_seqofs_lock with spin_lock of nf_conn
Date: Tue, 31 Jul 2012 12:31:55 +0530
Message-ID: <501782E3.4010009@elitecore.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi,
     My kernel version is 2.6.32.
     I have verify that same lock is also used in 3.4.6.
     there is global spin lock at net/ipv4/netfilter/nf_nat_helper.c
     static DEFINE_SPINLOCK(nf_nat_seqofs_lock);

     this is used in following functions:
     adjust_tcp_sequence();
     nf_nat_get_offset();

     This lock will reduce performance in case of multicore machines.
     There is a spin_lock in nf_conn structure itself, which is used by
     tcp_packet() at
     net/netfilter/nf_conntrack_proto_tcp.c
     and other places.

     So can we replace
     spin_lock_bh(&nf_nat_seqofs_lock);
     with
     spin_lock_bh(&ct->lock);

     regards
     rajesh
