From: Alex Chapman <ajchapman88@hotmail.co.uk>
Subject: nftables multi-dimensional dictionaries
Date: Wed, 2 Sep 2015 10:17:12 +0100
Message-ID: <DUB109-W834148D76D2B04B8469D05E1690@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hi,

Are multi-dimensional dictionaries supported in nftables? For example:

nft add rule ip filter forward meta iifname . meta oifname { \ eth0 . eth1 : jump chain \ }

Thanks 		 	   		  