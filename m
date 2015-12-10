From: Stefan Berghofer <stefan.berghofer@secunet.com>
Subject: using iptables matches and targets with nft
Date: Thu, 10 Dec 2015 13:16:18 +0100
Message-ID: <56696D12.6040601@secunet.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi all,

recent versions of the Linux kernel and the libnftnl library define nft expression types
with the names "match" and "target". However, I could not find any reference to these
expression types in the code of the nft user space utility, but only in the code for iptables.
Is it possible to access iptables matches and targets from rules defined with nft, or is
this not intended?

Greetings,
Stefan
