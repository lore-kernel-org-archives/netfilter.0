From: Carsten Aulbert <carsten@welcomes-you.com>
Subject: iptables performance  good enough for 10 GBit link?
Date: Wed, 07 Nov 2007 21:03:55 +0100
Message-ID: <47321A2B.10801@welcomes-you.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

sorry that my first posting here will be a vague one. We are currently
estimating the possibility for a computer to act as a packet filter
between 2 10Gbit links. Since we have no experience beyond 1 Gbit I
would like to ask a few questions:

(1) Has anyone tried how much data can be pumped through available 10
Gbit cards on a recent Linux kernel?

(2) How much CPU power/memory is needed by netfilter for a simple set-up
where packages on the incoming port need to be evaluated based on their
IP-range. Imaging simply allowing only ssh and NFS connections (TCP,
limited port range) from a certain /24 network and reject/drop all other
incoming packages on the external interface. So far no NAT is planned.

(3) Is this the right place to ask these questions ;)

Thanks a lot for a few hints, if this is possible or needs testing or ...

Cheers

Carsten
