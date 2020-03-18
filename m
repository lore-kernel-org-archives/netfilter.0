From: Frank Myhr <fmyhr@fhmtech.com>
Subject: Advantage(s) of static over dynamic nftables sets?
Date: Wed, 18 Mar 2020 17:17:13 -0400
Message-ID: <a2d41bb9-2cbe-8b5e-99d9-a00cb086ca0b@fhmtech.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=larkmoor.net; s=larkmoor20140928;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:Message-ID:Subject:From:To; bh=kTRNiCuaAtJRFu23y/u6h1MbfJV1PpguOEHl7m+roVA=;
        b=c3ry+/NCWuL2G1gPT09yVmtE9BHN9DE1C8+8abAMCbMLmABaqw7D5TJBjit0w0x+fcnCvu0cThNeoqMM3IzO0Wz6CHIkadtLWcO3rMNsGprFjPKssWxt7qi00O3rV6kBdowmbwvips1TFeHZV6/T1/5BOLSWi/D0xM8sb9ZUHWw=;
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hi,

As an nftables newbie I was a bit surprised to discover that defining a 
set as static prevents adding or deleting elements not only from the 
packet path but also from the nft command line:

#  nft add element ip ip_filter static_set { a.b.c.d }
Error: Could not process rule: Device or resource busy

Which is easily remedied by defining the set as dynamic instead.

So now I wonder: why not define every set as dynamic? Which would allow 
modification of any set's elements without having to reload the entire 
firewall -- thereby preserving accumulated counters and other stateful 
objects. Would performance and/or memory usage take a significant hit by 
doing this?

Thanks,
Frank
