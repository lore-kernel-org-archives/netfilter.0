From: md@Linux.IT (Marco d'Itri)
Subject: Re: conntrackd and CacheWriteThrough
Date: Tue, 4 Nov 2008 17:09:20 +0100
Message-ID: <20081104160920.GA18489@bongo.bofh.it>
References: <20081029155332.GA20850@bongo.bofh.it> <49102044.8090400@netfilter.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <49102044.8090400@netfilter.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

On Nov 04, Pablo Neira Ayuso <pablo@netfilter.org> wrote:

> Sorry, this setup is no longer supported. At least until we find a sane
> way to do it. See http://conntrack-tools.netfilter.org/manual.html.
> Also see: http://marc.info/?l=netfilter&m=122164806109759&w=2
Indeed I wondered about races between the traffic and state updates.

Load sharing with a multicast MAC address and sources hashing would not
help me because each one of my firewalls is connected to two core
routers with no shared L2 domain between them (i.e. each router is
connected to both firewalls).

My real goal is not sharing load but supporting asymmetrical routing,
because the firewalls announce the customer network to the core using
an IGP. If I am not missing anything I could use OSPF and give a lower
cost to the port with the higher VRRP priority.
This way I would be able to use normal active/passive conntrack
replication.

-- 
ciao,
Marco
