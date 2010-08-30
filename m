From: Thomas Jacob <jacob@internet24.de>
Subject: Re: IPv6 routing
Date: Mon, 30 Aug 2010 14:54:00 +0200
Message-ID: <1283172840.16291.91.camel@enterprise.ims-firmen.de>
References: <4C7B8741.3030908@abpni.co.uk> <4C7B89EB.7090807@abpni.co.uk>
	 <alpine.LNX.2.01.1008301242380.15716@obet.zrqbmnf.qr>
	 <4C7B8BD2.1060009@abpni.co.uk>  <4C7B91A2.50707@abpni.co.uk>
	 <1283171041.16291.63.camel@enterprise.ims-firmen.de>
	 <4C7BA51D.8030004@abpni.co.uk>
	 <alpine.DEB.2.00.1008301438390.20055@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.00.1008301438390.20055@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: Jonathan Tripathy <jonnyt@abpni.co.uk>, netfilter@vger.kernel.org

On Mon, 2010-08-30 at 14:42 +0200, Jozsef Kadlecsik wrote:

> Please check out RFC 4890: Recommendations for Filtering ICMPv6 Messages 
> in Firewalls, which discusses ICMPv6 filtering in details. It even comes 
> with an example shell script for netfilter/ip6tables in the appendix.


Are you sure that this is still accurate for current kernels? 

For instance, I would have assumed that things like
destination-unreachable or packet-too-big  are handled
by the stateful inspection code (i.e. are matched by
--state RELATED, ESTABLISHED) same as for IPv4?

