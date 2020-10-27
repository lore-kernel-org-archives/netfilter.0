From: dirdi <lists@dirdi.name>
Subject: Wiki inaccuracy regarding the 'redirect' statement
Date: Tue, 27 Oct 2020 13:03:56 +0100
Message-ID: <40860804-5378-d32d-371e-a38ab9a43af5@dirdi.name>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dirdi.name;
        s=kas202010141013; t=1603800236;
        bh=4VO1kpG9gu9QWo6HcMarj8JxPfUuSQiFnIf4pUW78nk=;
        h=From:To:Subject:Date:From;
        b=mXsGepHEAEeLp3MzYX506W2N7kizwctabt1oQBMAEfRCr5AGwaJnaBlapbDvG2s2c
         8Ai+f0q4xdgYA2gw+K/8Xc4bbSCTGIjH/16SjED/DaDnz4XBH0rLnxWpViHPAYBawo
         4RIu0w7QweoHDjKIncv5pbLu+nXM6Yly0H7osnel9LK70C/QYHznv4rplpZCUvrzPH
         84bL4+Z4KNDsvPKPXhGWSLILm6CSiZ/uhEHwdJC/TrebvXtvIbejHtjPBveTTlZTsA
         kLgk8rQWcYCYwXikXHa3kgggR5xY/p5AlUcbUxE75/Pbl8aM5YT0v+iFuctaZafj3A
         WeWw1i39aRX2A==
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter user mailinglist <netfilter@vger.kernel.org>

Hi there,

https://wiki.nftables.org/wiki-nftables/index.php/Performing_Network_Address_Translation_(NAT)#Redirect
states that the _redirect_ statement "only makes sense in a prerouting
chain of NAT type."

This is AFAICS inaccurate. A _redirect_ statement is also useful if one
wants to redirect outgoing traffic through a local, transparent proxy,
cf. the example configuration to route traffic through a local tor
client
https://trac.torproject.org/projects/tor/wiki/doc/TransparentProxy#LocalRedirectionThroughTor
.

This is seconded by nft's man page, which states that "dnat and redirect
statements are only valid in the prerouting and output chains".

Therefore I suggest to patch the aforementioned Wiki page:
- Note that: ''redirect'' only makes sense in a prerouting chain of NAT
type.
---
+ This example redirects outgoing 53/tcp traffic to a local proxy
listening on port 10053/tcp:
+
+ <source lang="bash">
+ % nft add rule nat output tcp dport 853 redirect to 10053
+ </source>
+
+ Note that: ''redirect'' only makes sense in prerouting and output
chains of NAT type.

-- 
Best

dirdi
