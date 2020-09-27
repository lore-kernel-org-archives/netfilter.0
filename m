From: "Rob Sterenborg (Lists)" <lists@sterenborg.info>
Subject: Compiling nft-0.9.6
Date: Sun, 27 Sep 2020 13:57:45 +0200
Message-ID: <95edb5b7-7db6-47d6-2942-1d17b27c2ac3@sterenborg.info>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=sterenborg.info;
         h=content-transfer-encoding:content-language:content-type
        :content-type:mime-version:user-agent:date:date:message-id
        :subject:subject:from:from:received:received; s=sel1; t=
        1601207865; x=1603022266; bh=rXheynKi/6ac/FeUFj+Aeyj6+tx76qaYcJM
        i4yfya54=; b=A4J0w/NJWdfj4HwBD2lPqn+HPRugF/K8zECgWtcoNka/ULBVSKl
        09uAzm2H6eXtYWTlGeyCur0ycx+Dl1RJjBn2dnIb/Hfwi6Pzc+uzS7J7kp6yyzxW
        tOU8TSudfGCyX4i4QaNh6ERMt8tdXBhldjyS5bL+OwajNHCMEUsSy5x4=
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Netfilter <netfilter@vger.kernel.org>

I'm on CentOS 7 and trying to compile nftables 0.9.6.

For requirements I downloaded the sources from 
https://www.netfilter.org/pub and:

- I compiled and installed the latest libmnl-1.0.4 in /usr/local.
   (./configure && make && make install && ldconfig)

- I compiled and installed the latest libnftl-1.1.6 in /usr/local.
   (PKG_CONFIG_PATH=/usr/local/lib/pkgconfig ./configure && make && make 
install && ldconfig)

When configuring nftables-0.9.6 it says that libmnl is okay, but it 
requires libnftl-1.1.7:

================
checking for LIBMNL... yes
checking for LIBNFTNL... no
configure: error: Package requirements (libnftnl >= 1.1.7) were not met:

Requested 'libnftnl >= 1.1.7' but version of libnftnl is 1.1.6
You may find new versions of libnftnl at 
http://netfilter.org/projects/libnftnl/
================

At the time of writing there is no libnftl-1.1.7 in 
https://www.netfilter.org/pub/libnftnl/ so I checked Git. In git there 
is a 1.1.7 tag, so I cloned the repo and switched to the libnftnl-1.1.7 tag.

When configuring, it returns a syntax error:

================
./configure: line 4141: syntax error near unexpected token `LIBMNL,'
./configure: line 4141: `PKG_CHECK_MODULES(LIBMNL, libmnl >= 1.0.4)'
================

I don't know how to fix this..
Is there something I can do to be able to compile nftables-0.9.6?

The most recent nftables I was able to compile is 0.9.3 with 
libmnl-1.0.4 and libnft-1.1.6.


Thanks,
Rob
