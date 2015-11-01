From: Jakub Sztandera <k.sztandera@hotmail.com>
Subject: RE: nftables: NAT table not receiving any traffic
Date: Sun, 1 Nov 2015 07:21:23 +0100
Message-ID: <DUB122-W426404F37CFCF4F999BA3DEA2D0@phx.gbl>
References: <DUB122-W3470AB4A4B403D576C00A3EA2E0@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <DUB122-W3470AB4A4B403D576C00A3EA2E0@phx.gbl>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

It was issue with cgroups,
NAT table was handled exclusively by one container.
It was fixed by upgrading to kernel version 4.3-rc7 (possibly only to 4.3-rc1 but we went with the newest).

I would like to thank `nt` on #Netfilter@freenode who provided us with this information.

Jakub (Kubuxu) Sztandera
 		 	   		  