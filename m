From: Bernhard Bock <mailinglists@bock.nu>
Subject: Re: Iptables find invalid packets
Date: Mon, 21 Jul 2008 16:39:51 +0200
Message-ID: <48849FB7.7070607@bock.nu>
References: <48847F16.8040604@itool.com> <488487E3.2020906@bock.nu> <48849E47.30901@itool.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <48849E47.30901@itool.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Dimitri GOURDON <dgourdon@itool.com>
Cc: netfilter@vger.kernel.org

Dimitri GOURDON wrote:
> There are 2 parameters that can perhaps help me :
> 
> cat /proc/sys/net/ipv4/netfilter/ip_conntrack_max
> 65520
> cat /proc/sys/net/ipv4/netfilter/ip_conntrack_buckets
> 8190
> 
> I can modify the first on the fly (the problem is the same : no change)
> But not the second...

Depending on your kernel version, you may have to set the value when 
loading the module. Try to insert the following line in 
/etc/modprobe.conf (or similar, depending on your linux distribution):

options nf_conntrack hashsize=16384

best regards
Bernhard
