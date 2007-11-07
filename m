From: Patrick McHardy <kaber@trash.net>
Subject: Re: Fw: Problems with nf_nat_ftp.ko and nf_conntrack_ftp.ko in 2.6.22.6
Date: Thu, 08 Nov 2007 00:19:18 +0100
Message-ID: <473247F6.8090204@trash.net>
References: <001601c81ccc$682bb4a0$bb0b10ac@FireEye.com> <47303E9D.2050909@trash.net> <001e01c82077$b4d67610$6500a8c0@ronPc> <47306B0E.7050401@trash.net> <001801c8207c$00307b70$6500a8c0@ronPc> <47307498.70104@trash.net> <005301c820fc$35c63a10$6400a8c0@ronPc> <47318A3C.5070701@trash.net> <005b01c82151$4acac750$6500a8c0@ronPc>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-devel-owner@vger.kernel.org>
In-Reply-To: <005b01c82151$4acac750$6500a8c0@ronPc>
Sender: netfilter-devel-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ron lai <ronlai@cs.stanford.edu>
Cc: netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org, Bart De Schuymer <bdschuym@pandora.be>

ron lai wrote:
> I am using a single bridge with one device.

In that case please post the full output of:

ip link list
ip addr show
ip route show
brctl show
