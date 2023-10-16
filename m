Return-Path: <netfilter-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF58DCDB465
	for <netfilter@archiver.kernel.org>; Mon, 16 Oct 2023 19:54:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233724AbjJPTy0 (ORCPT <rfc822;netfilter@archiver.kernel.org>);
        Mon, 16 Oct 2023 15:54:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233333AbjJPTyZ (ORCPT
        <rfc822;netfilter@vger.kernel.org>); Mon, 16 Oct 2023 15:54:25 -0400
Received: from smtp-out.kfki.hu (smtp-out.kfki.hu [IPv6:2001:738:5001::48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2239B92
        for <netfilter@vger.kernel.org>; Mon, 16 Oct 2023 12:54:23 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by smtp2.kfki.hu (Postfix) with ESMTP id 0C7ACCC02B7;
        Mon, 16 Oct 2023 21:54:20 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at smtp2.kfki.hu
Received: from smtp2.kfki.hu ([127.0.0.1])
        by localhost (smtp2.kfki.hu [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP; Mon, 16 Oct 2023 21:54:17 +0200 (CEST)
Received: from blackhole.kfki.hu (blackhole.szhk.kfki.hu [148.6.240.2])
        by smtp2.kfki.hu (Postfix) with ESMTP id C6624CC011F;
        Mon, 16 Oct 2023 21:54:17 +0200 (CEST)
Received: by blackhole.kfki.hu (Postfix, from userid 1000)
        id B51973431A8; Mon, 16 Oct 2023 21:54:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by blackhole.kfki.hu (Postfix) with ESMTP id B26ED340D74;
        Mon, 16 Oct 2023 21:54:17 +0200 (CEST)
Date:   Mon, 16 Oct 2023 21:54:17 +0200 (CEST)
From:   Jozsef Kadlecsik <kadlec@netfilter.org>
To:     "U.Mutlu" <um@mutluit.com>
cc:     netfilter@vger.kernel.org
Subject: Re: [iptables/ipset] Bug? -m set --match-set myset src --packets-gt
 2 -j ...
In-Reply-To: <652D8D7C.4080803@mutluit.com>
Message-ID: <c256ace-de63-e18-3386-132ee8a8d6c3@netfilter.org>
References: <652D8D7C.4080803@mutluit.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <netfilter.vger.kernel.org>
X-Mailing-List: netfilter@vger.kernel.org

Hi,

On Mon, 16 Oct 2023, U.Mutlu wrote:

> could a kind soul please check why the ipset "match-set" rule below isn't
> working.
> 
> It jumps to the chain MY2 only if "--packets-gt 0" or
> "--packets-gt 1" is used, but not for any higher values! :-)
> 
> I'm new to ipset, but this very much looks like a bug in iptables or ipset,
> IMHO.
> 
> 
> firewall.sh :
> -------------
> #...
> ipset destroy blacklist
> ipset create blacklist hash:ip hashsize 4096 timeout 300 counters
> ipset destroy bl2
> ipset create bl2 hash:ip hashsize 4096 timeout 600 counters
> #...
> iptables -N MY2
> #...
> iptables -A MY2 -j RETURN
> #...
> iptables -A INPUT -j SET --exist --add-set blacklist src
> iptables -A INPUT -m set --match-set blacklist src --packets-gt 2 -j MY2

Reverse the order of the rules above. With the first one you continuously 
(re)add the elements to the set with packet number 1.

Best regards,
Jozsef

> OS is stock Debian 11 ("bullseye"):
> 
> # iptables --version
> iptables v1.8.7 (nf_tables)
> 
> # ipset --version
> ipset v7.10, protocol version: 7
> 
> # uname -a
> Linux p21 6.1.0-0.deb11.11-amd64 #1 SMP PREEMPT_DYNAMIC Debian
> 6.1.38-4~bpo11+1 (2023-08-08) x86_64 GNU/Linux
> 
> # cat /etc/os-release
> PRETTY_NAME="Debian GNU/Linux 11 (bullseye)"
> NAME="Debian GNU/Linux"
> VERSION_ID="11"
> VERSION="11 (bullseye)"
> ...
> 

-- 
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.hu
PGP key : https://wigner.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics
          H-1525 Budapest 114, POB. 49, Hungary
