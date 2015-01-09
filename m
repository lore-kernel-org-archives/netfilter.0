From: Glen Miner <shaggie76@hotmail.com>
Subject: RE: Stateless NAT with iptables
Date: Fri, 9 Jan 2015 15:32:33 -0500
Message-ID: <SNT152-W8102200148E4B5EE0CE5B8B8440@phx.gbl>
References: <SNT152-W84CAD14ACDD2F149C65D88B8440@phx.gbl>,<CAKfDRXgQJ8zkyBjdyhLFCgpV7z7yiR497G7XOTubM5y2rYxDMg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAKfDRXgQJ8zkyBjdyhLFCgpV7z7yiR497G7XOTubM5y2rYxDMg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

> I was recently working on something similar. My solution was to
> combine NOTRACK with RAWDNAT/RAWSNAT in the raw/rawpost-tables.

I've fiddled around with RAWDNAT but from what I can tell it doesn't support --to addr:port (just addr) like regular DNAT. Thank you for pointing it out the xtables-addons package to me, though.

-g 		 	   		  