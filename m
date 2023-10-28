Return-Path: <netfilter-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6060C0032E
	for <netfilter@archiver.kernel.org>; Sat, 28 Oct 2023 08:25:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229500AbjJ1IZt (ORCPT <rfc822;netfilter@archiver.kernel.org>);
        Sat, 28 Oct 2023 04:25:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbjJ1IZs (ORCPT
        <rfc822;netfilter@vger.kernel.org>); Sat, 28 Oct 2023 04:25:48 -0400
X-Greylist: delayed 292 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 28 Oct 2023 01:25:46 PDT
Received: from filter.openoffice.nl (filter.openoffice.nl [144.76.204.185])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 46B54F4
        for <netfilter@vger.kernel.org>; Sat, 28 Oct 2023 01:25:46 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by filter.openoffice.nl (Postfix) with ESMTP id 4C9D4100842
        for <netfilter@vger.kernel.org>; Sat, 28 Oct 2023 10:20:52 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at filter.openoffice.nl
Received: from filter.openoffice.nl ([IPv6:::1])
        by localhost (filter.openoffice.nl [IPv6:::1]) (amavisd-new, port 10024)
        with ESMTP id UD_ulevcbYPb for <netfilter@vger.kernel.org>;
        Sat, 28 Oct 2023 10:20:52 +0200 (CEST)
Received: from blub.net (mail.blub.net [95.97.76.243])
        by filter.openoffice.nl (Postfix) with ESMTP id 205561006FA
        for <netfilter@vger.kernel.org>; Sat, 28 Oct 2023 10:20:52 +0200 (CEST)
Received: from [IPV6:2a02:a46d:bbe9:0:414e:1e72:5c46:1f10] (2a02-a46d-bbe9-0-414e-1e72-5c46-1f10.fixed6.kpn.net [IPv6:2a02:a46d:bbe9:0:414e:1e72:5c46:1f10])
        by blub.net (Postfix) with ESMTPSA id E53F3300026
        for <netfilter@vger.kernel.org>; Sat, 28 Oct 2023 10:20:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=sessink.nl; s=201802;
        t=1698481251; bh=xRfAeDJ3gxuwh9/8hmIFl0PsoWJAuYX9iS6J9ugtP5M=;
        h=Date:To:From:Subject:From;
        b=Nxf3JSKbPvt1x6SttXjpXXunNQibIOQv2+eFkdjVIGLJ962ZPbbIKNkeFII71HY9T
         6WI828FuE4G0m3Ic4aulo1vkchvFUlMIr7ZfWJD06OXW8o38WytFf4p3ZWZS8TC/En
         cb9OYnCsjNVNxM5uIf7yuM7tCeib67zXPdNmW7AM=
Message-ID: <8108fd99-25f2-49a9-8ef8-18c2de253163@sessink.nl>
Date:   Sat, 28 Oct 2023 10:20:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To:     netfilter@vger.kernel.org
Content-Language: nl-NL
From:   Valentijn Sessink <valentijn@sessink.nl>
Subject: arptables-nft and comments in nft output
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <netfilter.vger.kernel.org>
X-Mailing-List: netfilter@vger.kernel.org

Hi list,

I'm using arptables (nft iptables version 1.8.7) with
arptables -A OUTPUT -d 10.21.22.129 -j mangle --mangle-ip-s 10.21.22.161

Now I'm a bit confused by the nft output:

table arp filter {
	chain OUTPUT {
		type filter hook output priority filter; policy accept;
		arp htype 1 arp hlen 6 arp plen 4 arp daddr ip 10.21.22.129 counter 
packets 1288 bytes 54096 # --mangle-ip-s 10.21.22.161	}
}

The nft wiki only says "In the case of some missing translation, you 
will see a commented rule in nftables" - but it doesn't say what to do.

Now I'm confused. Does this mean that I cannot use "nft" to setup this 
very rule? Should I use "arptables-nft" to set this rule? Or is there 
another way?

Best regards,

Valentijn
