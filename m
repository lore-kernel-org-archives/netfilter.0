From: Mario =?ISO-8859-1?Q?H=FClsegge?= <huelsegge@gmx.de>
Subject: Re: Port-based routing with OpenVPN
Date: Wed, 26 Sep 2007 14:49:57 +0200
Message-ID: <1190810998.6867.5.camel@laptop>
References: <20070915231545.224150@gmx.net>
	 <46ED0DE4.1040300@plouf.fr.eu.org> <1190758479.13546.8.camel@laptop>
	 <46FA3594.9050306@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <46FA3594.9050306@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org

Am Mittwoch, den 26.09.2007, 12:33 +0200 schrieb Pascal Hambourg:

> You may need to add an iptables SNAT or MASQUERADE rule for 
> packets leaving the tun0 interface. [...]
> 
> Finally, check that /proc/sys/net/ipv4/conf/tun0/rp_filter = 0, else 
> your workstation routing may drop the replies arriving at tun0 (although 
> tcpdump would see them).
> -

these 2 hints solved the problem, now all runs fine. i inserted a masq
rule before, but without setting rp_filter (who would ever thought of
THAT ;) ).

thank you very much for your help. 

