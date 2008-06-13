From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: iptables 1.4.1 + iprange fails for me
Date: Fri, 13 Jun 2008 08:37:21 +0200
Message-ID: <1F393B3797D94F30B6D3A7C823AC4BCD@dcyb.net>
References: <20080613090236.417411cd@maxim.office.modum.by>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20080613090236.417411cd@maxim.office.modum.by>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

> I updated yesterday kernel + iptables on my router (into Internet)
> box. Kernel from kernel.org 2.6.25.6 + iptables 1.4.1-1 from
> fedora rawhide.
> I'm use kernel without modules on that box.
> 
> I found troubles with iprange:
> # iptables -A INPUT -m iprange --src-range 1.1.1.1-2.2.2.2 -j DROP
> # iptables-save |fgrep range -A INPUT -m iprange -j DROP
> 
> iptables -L -n show it as:
> DROP       all  --  0.0.0.0/0            0.0.0.0/0

And what does "iptables -nvL" say?


Grts,
Rob


