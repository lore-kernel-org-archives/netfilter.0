From: Bernhard Bock <mailinglists@bock.nu>
Subject: Re: Iptables find invalid packets
Date: Mon, 21 Jul 2008 14:58:11 +0200
Message-ID: <488487E3.2020906@bock.nu>
References: <48847F16.8040604@itool.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <48847F16.8040604@itool.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Dimitri GOURDON <dgourdon@itool.com>
Cc: netfilter@vger.kernel.org

Hi Dimitri,

Dimitri GOURDON wrote:
> A lot of TCP packets with FIN or RST flags (all I think) from clients 
> are dropped by Iptables as state INVALID. The consequence is that I have 
> a lot of connection in FIN_WAIT state (shown by netstat) on the 2 web 
> servers...
[...]
> Is someone can help me ???

Sounds a bit like the problem I've asked about a few days ago. Try to 
increase the hashsize of nf_conntrack. My INVALID packets vanished after 
this (at least as long as I wasn't using conntrackd for stateful failover).

best regards
Bernhard
