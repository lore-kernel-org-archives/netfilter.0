From: Daniel Wagner <wagi@monom.org>
Subject: autoload of nft modules
Date: Wed, 27 Apr 2016 10:52:13 +0200
Message-ID: <67e90927-885f-e860-a1dd-9f61ea95b53e@monom.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org
Cc: connman@lists.01.org, Dragos Tatulea <dragos@endocode.com>

Hi,

Dragos and I are working on getting nft support into ConnMan [1]. Now we
face a small problem with the rule we load, which are essentially:

 nft add table connman
 nft add chain connman nat-prerouting			\
	{ type nat hook prerouting priortiy 0 ; }
 nft add chain connman nat-postrouting			\
	{ type nat hook postrouting priortiy 0 ; }
 nft add chain connman filter-output			\
	{ type filter hook output priority 0 ; }

These work nicely using the nft CLI but when we run those commands
via libnftnl after a fresh reboot of the system, there is a ENOENT at
the third rule.

If though all related modules are loaded (e.g. via running the nft cli
first) there is no problem.

So my question is, do we need to load the modules our self first or
should the kernel load the modules by itself?

That is observed with libnftnl 1.0.5 and kernel 4.4.6.

cheers,
daniel

[1] https://lists.01.org/pipermail/connman/2016-April/000643.html
