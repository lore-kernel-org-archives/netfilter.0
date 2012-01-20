From: =?UTF-8?B?TWFyY2luIE1pcm9zxYJhdw==?= <marcin@mejor.pl>
Subject: [xtables-addons] memory usage in module geoip (probably)
Date: Fri, 20 Jan 2012 17:12:58 +0100
Message-ID: <4F19928A.7050005@mejor.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mejor.pl; s=cokolwiek;
	h=Content-Transfer-Encoding:Content-Type:Subject:To:MIME-Version:From:Date:Message-ID; bh=VesoBDGJuVwyT+7ctLivzPx98D2t+HYJZU6EvYm6o9I=;
	b=j9Uw1xLWWTwcRAJUViQeFF+zuX+4zsqTFQFoeWs9iOG7mAcwRU72oBRHnEmZuUK0EvoDu2QXaSqQ8G/fwdBOjGtpJ8ABPjXKO7uy2rEx8mNUVoAb1kMfWCft1kQYhAYf;
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello!
I've noticed high size of kmalloc-512/2048 on my vps after a one, two
weeks of work. Example:
  OBJS ACTIVE  USE OBJ SIZE  SLABS OBJ/SLAB CACHE SIZE NAME
 83440  83411  99%    0.57K   5960       14     47680K kmalloc-512
 21615  21604  99%    2.07K   1441       15     46112K kmalloc-2048
103776 103765  99%    0.31K   8648       12     34592K skbuff_head_cache

I've done a little investigation (trial by error method) to discover
which process keep data in kmalloc. It looks those kmalloc are used by
modules from xtables-addons-1.39. I'm using ipset6, geoip, sysrq,
tarpit. I greped sources for string "kmalloc", kmalloc is used by sysrq
and geoip (in some other modules too but i don't use them).

I'd like to ask is such usage of memory ok? Which module could take so
much precious ram?:) (I suspect geoip). How much memory geoip can use in
worse case (db with ipv4 and ipv6)? Can i freed this cache without
reboot? (I tried flush rules, rmmod but without succes).

Thank you for any answers!
Marcin

P.S. Is any other method to check which process/module/etc uses kmallocs?
