From: Vinayakam Murugan <vinayakm@theargoncompany.com>
Subject: Re: Packets missing state ?
Date: Wed, 24 Dec 2003 09:42:39 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200312240942.40069.vinayakm@theargoncompany.com>
References: <200312231828.59518.rajiv@theargoncompany.com> <200312231907.58135.vinayakm@theargoncompany.com> <1072187752.809.114.camel@elendil.intranet.cartel-securite.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1072187752.809.114.camel@elendil.intranet.cartel-securite.net>
Content-Disposition: inline
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

> These packets are delayed ones, probably due to high latency (heavy load
> on line ?). Most of the time, there's not much to worry about,
> especially on DSL line when upload goes up.

How can i uniquely identify such packets so that I don't log them and just 
drop them? Is this possible? 

> Seems that someone wants to ask some DNS stuff to your box :) Maybe this
> IP is declared somewhere as authoritative for a domain or someone use it
> as forwarder.

My primary objective is to log suspicious packets only. Any pointers on how I 
can do that?

-- 
Warm Regards
~~~~~~~~~~~~~~~~~~~~~~~
Vinayakam Murugan

Viruses getting you down?
Get your virus protected mailbox at http://www.tassm.com

Linux: The choice of a GNU generation


