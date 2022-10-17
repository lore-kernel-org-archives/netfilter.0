From: Ian Pilcher <arequipeno@gmail.com>
Subject: How to add set element with libnftnl?
Date: Mon, 17 Oct 2022 07:58:26 -0500
Message-ID: <tijjhi$el0$1@ciao.gmane.io>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

I have some C code that uses libmnl to add entries to old style IP sets.
I am trying to port this code to nftables, using libnftnl.

I haven't found any documentation other than the examples, and
unfortunately nft-set-elem-add.c seems to completely ignore the actual
type of the data that it's putting into the set.

Can anyone help me figure out how do use libnftnl to perform the
equivalent of the following?

   * nft add element TYPE TABLE SET_NAME '{ IPV4_ADDRESS }'
   * nft add element TYPE TABLE SET_NAME '{ IPV4_ADDRESS timeout TIME }'
   * nft add element TYPE TABLE SET_NAME '{ IPV6_ADDRESS }'
   * nft add element TYPE TABLE SET_NAME '{ IPV6_ADDRESS timeout TIME }'

TIA!

-- 
========================================================================
Google                                      Where SkyNet meets Idiocracy
========================================================================

