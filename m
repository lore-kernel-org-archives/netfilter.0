From: =?UTF-8?B?TWFyY2luIE1pcm9zxYJhdw==?= <marcin@mejor.pl>
Subject: Re: [xtables-addons][solved] memory usage in module geoip (probably)
Date: Tue, 30 Oct 2012 10:56:37 +0100
Message-ID: <508FA455.9050106@mejor.pl>
References: <4F19928A.7050005@mejor.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mejor.pl; s=cokolwiek;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Subject:To:MIME-Version:From:Date:Message-ID; bh=udy4ZZCd7RIFIi+BdtecsN3UjIrRpKo8kdWYtLGbrho=;
	b=WWbfhifpErOTc32Z1NHU/pblGT1YXdVMTiayqKDK+wlSlvgUPfOLOCg8+SupBL1OWP61ZML9Adzig6Ed4HNyCTlAvD64U7EWntcS5of1OlZ4JQZ8PvxQk5jm/OWseozy;
In-Reply-To: <4F19928A.7050005@mejor.pl>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: netfilter@vger.kernel.org

W dniu 20.01.2012 17:12, Marcin Miros=C5=82aw pisze:
> Hello!
> I've noticed high size of kmalloc-512/2048 on my vps after a one, two
> weeks of work. Example:
>   OBJS ACTIVE  USE OBJ SIZE  SLABS OBJ/SLAB CACHE SIZE NAME
>  83440  83411  99%    0.57K   5960       14     47680K kmalloc-512
>  21615  21604  99%    2.07K   1441       15     46112K kmalloc-2048
> 103776 103765  99%    0.31K   8648       12     34592K skbuff_head_ca=
che
>=20
> I've done a little investigation (trial by error method) to discover
> which process keep data in kmalloc. It looks those kmalloc are used b=
y
> modules from xtables-addons-1.39. I'm using ipset6, geoip, sysrq,
> tarpit. I greped sources for string "kmalloc", kmalloc is used by sys=
rq
> and geoip (in some other modules too but i don't use them).
>=20
> I'd like to ask is such usage of memory ok? Which module could take s=
o
> much precious ram?:) (I suspect geoip). How much memory geoip can use=
 in
> worse case (db with ipv4 and ipv6)? Can i freed this cache without
> reboot? (I tried flush rules, rmmod but without succes).

With xtables-addons-1.46 I don't have such issue, probably commit
4ff5a8fbf62b75b17194a5cd324c08b8fa0f08bf in TARPIT resolves my problem.
Thanks:)



