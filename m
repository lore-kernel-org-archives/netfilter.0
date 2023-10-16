Return-Path: <netfilter-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A5C4CDB465
	for <netfilter@archiver.kernel.org>; Mon, 16 Oct 2023 19:22:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232152AbjJPTWr (ORCPT <rfc822;netfilter@archiver.kernel.org>);
        Mon, 16 Oct 2023 15:22:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231478AbjJPTWq (ORCPT
        <rfc822;netfilter@vger.kernel.org>); Mon, 16 Oct 2023 15:22:46 -0400
Received: from mail.mutluit.com (mail.mutluit.com [195.201.130.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 045449F
        for <netfilter@vger.kernel.org>; Mon, 16 Oct 2023 12:22:42 -0700 (PDT)
Received: from [127.0.0.1] (mail.mutluit.com [195.201.130.20]:42524)
        by mail.mutluit.com (mail.mutluit.com [195.201.130.20]:50025) with ESMTP ([XMail 1.27 ESMTP Server])
        id <S1723095> for <netfilter@vger.kernel.org> from <um@mutluit.com>;
        Mon, 16 Oct 2023 21:22:41 +0200
To:     netfilter@vger.kernel.org
From:   "U.Mutlu" <um@mutluit.com>
Subject: [iptables/ipset] Bug? -m set --match-set myset src --packets-gt 2 -j
 ...
Organization: mutluit.com
Message-ID: <652D8D7C.4080803@mutluit.com>
Date:   Mon, 16 Oct 2023 21:22:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:40.0) Gecko/20100101
 Firefox/40.0 SeaMonkey/2.37a1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <netfilter.vger.kernel.org>
X-Mailing-List: netfilter@vger.kernel.org

Hi,
could a kind soul please check why the ipset "match-set" rule below isn't working.

It jumps to the chain MY2 only if "--packets-gt 0" or
"--packets-gt 1" is used, but not for any higher values! :-)

I'm new to ipset, but this very much looks like a bug in iptables or ipset, IMHO.


firewall.sh :
-------------
#...
ipset destroy blacklist
ipset create blacklist hash:ip hashsize 4096 timeout 300 counters
ipset destroy bl2
ipset create bl2 hash:ip hashsize 4096 timeout 600 counters
#...
iptables -N MY2
#...
iptables -A MY2 -j RETURN
#...
iptables -A INPUT -j SET --exist --add-set blacklist src
iptables -A INPUT -m set --match-set blacklist src --packets-gt 2 -j MY2
#...


Thx


OS is stock Debian 11 ("bullseye"):

# iptables --version
iptables v1.8.7 (nf_tables)

# ipset --version
ipset v7.10, protocol version: 7

# uname -a
Linux p21 6.1.0-0.deb11.11-amd64 #1 SMP PREEMPT_DYNAMIC Debian 
6.1.38-4~bpo11+1 (2023-08-08) x86_64 GNU/Linux

# cat /etc/os-release
PRETTY_NAME="Debian GNU/Linux 11 (bullseye)"
NAME="Debian GNU/Linux"
VERSION_ID="11"
VERSION="11 (bullseye)"
...
