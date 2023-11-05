Return-Path: <netfilter-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D94AC4332F
	for <netfilter@archiver.kernel.org>; Sun,  5 Nov 2023 14:58:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230048AbjKEO6f (ORCPT <rfc822;netfilter@archiver.kernel.org>);
        Sun, 5 Nov 2023 09:58:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229608AbjKEO6e (ORCPT
        <rfc822;netfilter@vger.kernel.org>); Sun, 5 Nov 2023 09:58:34 -0500
Received: from tootai.net (mail1.tootai.net [IPv6:2a01:4f8:a0:821b::58:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A317CC
        for <netfilter@vger.kernel.org>; Sun,  5 Nov 2023 06:58:31 -0800 (PST)
Received: from tootai.net (localhost [127.0.0.1])
        by mail1.tootai.net (Postfix) with ESMTP id 40802608142E
        for <netfilter@vger.kernel.org>; Sun,  5 Nov 2023 15:58:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
        t=1699196309; bh=vl5gRtErl5fl6dOWSdmaPtZvf9XPzp3vc5UPn15sPxo=;
        h=Date:To:From:Subject:From;
        b=NL3SCWwPgxTuui+lDP1NqAcIeK0dgt7eXBfsI4mWVmQ1bahppvaDfUxSBm9d9rr/X
         hdg6Y3U6aTORIzOc6GXoqxXDZa2MFNPfB9AE+yjHRet3vJrEGc0Tm0xv7bmNsM0uVb
         3zY8t4wjtrQNeYjPpkB28sekxbX9gcB9bgDPHrIo=
Received: from [IPV6:fd99:1234:beef:cafe::14] (unknown [IPv6:fd99:1234:beef:cafe::14])
        by mail1.tootai.net (Postfix) with ESMTPSA id 104606081A3F
        for <netfilter@vger.kernel.org>; Sun,  5 Nov 2023 15:58:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
        t=1699196309; bh=vl5gRtErl5fl6dOWSdmaPtZvf9XPzp3vc5UPn15sPxo=;
        h=Date:To:From:Subject:From;
        b=NL3SCWwPgxTuui+lDP1NqAcIeK0dgt7eXBfsI4mWVmQ1bahppvaDfUxSBm9d9rr/X
         hdg6Y3U6aTORIzOc6GXoqxXDZa2MFNPfB9AE+yjHRet3vJrEGc0Tm0xv7bmNsM0uVb
         3zY8t4wjtrQNeYjPpkB28sekxbX9gcB9bgDPHrIo=
Message-ID: <71be06b8-6aa0-4cf9-9e0b-e2839b01b22f@tootai.net>
Date:   Sun, 5 Nov 2023 15:58:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: fr, fr-FR
To:     Netfilter list <netfilter@vger.kernel.org>
From:   Tech <tech@tootai.net>
Subject: Redirect doesn't do the job as dnat does
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
List-ID: <netfilter.vger.kernel.org>
X-Mailing-List: netfilter@vger.kernel.org

Hi,

nftables v1.0.6 (Lester Gooch #5) on debian bookworm kernel 6.5 from 
unstable. Simple test

#!/bin/sh

sudo nft flush ruleset
sudo nft add table ip6 nat
sudo nft add chain ip6 nat prerouting { type nat hook prerouting 
priority 0 \; }
sudo nft add chain ip6 nat postrouting { type nat hook postrouting 
priority 100 \; }

#sudo nft add rule ip6 nat prerouting ip6 daddr 2001:db8::1 tcp dport { 
58194-58197 } dnat to :58198
#sudo nft add rule ip6 nat prerouting ip6 daddr 2001:db8::1 tcp dport { 
58194-58197 } dnat to [fd99:d:e:f::1]:58198

sudo nft add rule ip6 nat prerouting ip6 daddr 2001:db8::1 tcp dport 
58194 redirect to :58198 ; <= this one doesn't work

#sudo nft add rule ip6 nat prerouting ip6 daddr ::/0 tcp dport 58194 
dnat to :58198
#sudo nft add rule ip6 nat prerouting ip6 daddr ::/0 tcp dport 58194 
dnat to [fd99:d:e:f::1]:58198

in another terminal I run
nc -vl :: 58198
Listening on :: 58198

 From another computer
nc -v 2001:db8::1 58194
nc: connect to 2001:db8::1 port 58194 (tcp) failed: Connection timed out

As you see I never get input on port 58198 with redirect, also tested by 
activating forwarding like below but no luck
echo 1 > /proc/sys/net/ipv6/conf/all/forwarding

Replacing the redirect rule with any on the 4 others rules above, I get 
the right behavior

nc -vl :: 58198
Listening on :: 58198
Connection received on 2001:db8:a:b::c 54748

nc -v 2001:db8::1 58194
Connection to 2001:db8::1 58194 port [tcp/*] succeeded!

Does it mean that redirect is broken or abandonned or did I miss something ?

-- 
Daniel
