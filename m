From: John de la Garza <john@jjdev.com>
Subject: typo on wiki
Date: Mon, 22 Sep 2014 21:24:22 -0400
Message-ID: <20140923012420.GA6301@vega.jjdev.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

http://wiki.nftables.org/wiki-nftables/index.php/Configuring_chains

it says:

Deleting chains

   You can delete the chains that you don't need, eg.
   % nft add chain ip filter input




should read

Deleting chains

   You can delete the chains that you don't need, eg.
   % nft delete chain ip filter input

