From: Wojciech Kromer <wojciech.kromer@dgt.com.pl>
Subject: NFS root + iptables in 2.6.25
Date: Wed, 17 Sep 2008 10:49:59 +0200
Message-ID: <48D0C4B7.3070005@dgt.com.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi.

I'm using nfs root filesystem for developing.
On 2.6.23 everything works fine, but on 2.6.25 loading any iptables
module causes problems:


# modprobe iptable_nat
nf_conntrack version 0.5.0 (1024 buckets, 4096 max)
nfs: RPC call returned error 1
nfs: RPC call returned error 1
nfs: RPC call returned error 1
nfs: RPC call returned error 1
nfs: RPC call returned error 1
nfs: RPC call returned error 1


Probably iptables changed it's default behavior from "allow all" to
"deny all" at startup.
Is there any way to change it back?
I can't change anything after loading any iptable module, because all
programs on filesystem are not accessible after loading...


Regards.

