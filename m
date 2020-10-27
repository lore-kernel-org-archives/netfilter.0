From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: [ANNOUNCE] libnftnl 1.1.8 release
Date: Tue, 27 Oct 2020 10:55:02 +0100
Message-ID: <20201027095502.GA32189@salvia>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="4Ckj6UjgE2iN1+kY"
Return-path: <netfilter-devel-owner@vger.kernel.org>
Content-Disposition: inline
List-ID: <netfilter.vger.kernel.org>
To: netfilter-devel@vger.kernel.org
Cc: netfilter@vger.kernel.org, netfilter-announce@lists.netfilter.org, lwn@lwn.net


--4Ckj6UjgE2iN1+kY
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi!

The Netfilter project proudly presents:

        libnftnl 1.1.8

libnftnl is a userspace library providing a low-level netlink
programming interface (API) to the in-kernel nf_tables subsystem.
This library is currently used by nftables.

See ChangeLog that comes attached to this email for more details.

You can download it from:

https://www.netfilter.org/projects/libnftnl/downloads.html

Happy firewalling.

--4Ckj6UjgE2iN1+kY
Content-Type: text/plain; charset=utf-8
Content-Disposition: attachment; filename="changes-libnftnl-1.1.8.txt"

Florian Westphal (1):
      libnftnl: export nftnl_set_elem_fprintf

Jose M. Guisado Gomez (5):
      examples: add support for NF_PROTO_INET family
      udata: add NFTNL_UDATA_SET_COMMENT
      table: add userdata support
      object: add userdata and comment support
      chain: add userdata and comment support

Pablo Neira Ayuso (6):
      src: add support for chain ID attribute
      examples: unbreak nft-set-elem-del
      expr: socket: add wildcard support
      expr: expose nftnl_expr_build_payload()
      expr: add nftnl_rule_del_expr()
      build: libnftnl 1.1.8 release


--4Ckj6UjgE2iN1+kY--
