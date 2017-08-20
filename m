From: J Doe <general@nativemethods.com>
Subject: Re: Unable to create set -- neftilter v0.5 on Ubuntu
Date: Sun, 20 Aug 2017 00:05:12 -0400
Message-ID: <19D662AE-1A9C-41F2-A2E3-B89668C62720@nativemethods.com>
References: <78d387b7-25bf-3ae9-3b1e-7d6acc5c0d6a@wagsky.com>
Mime-Version: 1.0 (1.0)
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <78d387b7-25bf-3ae9-3b1e-7d6acc5c0d6a@wagsky.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jeff Kletsky <netfilter@allycomm.com>, netfilter@vger.kernel.org

Hi Jeff,

The error is being caused because a table that does not explicitly state it's protocol type is assumed to be of type ip.  In this case, we need to include "inet":

nft add set inet global some_addrs { type ipv4_addr \; }

There are no gotchas with building the nft user-land tool against kernel 4.4.  I have it built on a Ubuntu Server 16.04.03 LTS box which has a kernel of 4.4.0-92.

If you are building on Ubuntu Server, make sure to grab the build tools:

sudo apt-get install bison flex binutils build-essential autoconf libtool pkg-config

...and then follow the build steps from the wiki.

One little caveat - once you build libmnl and libnftnl, be sure to run:

sudo ldconfig

...and then build the nftables code.

To check for a proper install, check the version of nft:

nft -v
nftables v0.7 (Scrooge McDuck)

Regards,

- J
