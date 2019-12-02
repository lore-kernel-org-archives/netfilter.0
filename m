From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: [ANNOUNCE] libnftnl 1.1.5 release
Date: Mon, 2 Dec 2019 14:57:42 +0100
Message-ID: <20191202135742.tdkuffglhefgzgnw@salvia>
References: <20190819110328.vnwmmox5ymabneib@salvia>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="4qppecvfce6p6usk"
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190819110328.vnwmmox5ymabneib@salvia>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter-devel@vger.kernel.org
Cc: netfilter@vger.kernel.org, netfilter-announce@lists.netfilter.org, lwn@lwn.net


--4qppecvfce6p6usk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi!

The Netfilter project proudly presents:

        libnftnl 1.1.5

libnftnl is a userspace library providing a low-level netlink
programming interface (API) to the in-kernel nf_tables subsystem. The
library libnftnl has been previously known as libnftables. This
library is currently used by nftables.

See ChangeLog that comes attached to this email for more details.

You can download it from:

http://www.netfilter.org/projects/libnftnl/downloads.html
ftp://ftp.netfilter.org/pub/libnftnl/

Happy firewalling.

--4qppecvfce6p6usk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="changes-libnftnl-1.1.5.txt"

Ander Juaristi (2):
      expr: meta: Make NFT_META_TIME_{NS, DAY, HOUR} known
      expr: meta: Make NFT_DYNSET_OP_DELETE known

Eric Jallot (1):
      flowtable: add support for handle attribute

Fernando Fernandez Mancera (1):
      src: synproxy stateful object support

Manuel Messner (1):
      flowtable: Fix symbol export for clang

Pablo Neira Ayuso (4):
      flowtable: device array dynamic allocation
      chain: multi-device support
      flowtable: remove NFTA_FLOWTABLE_SIZE
      build: libnftnl 1.1.5 release

Phil Sutter (11):
      set: Export nftnl_set_list_lookup_byname()
      obj: ct_timeout: Check return code of mnl_attr_parse_nested()
      set_elem: Fix return code of nftnl_set_elem_set()
      obj/tunnel: Fix for undefined behaviour
      set: Don't bypass checks in nftnl_set_set_u{32,64}()
      obj/ct_timeout: Avoid array overrun in timeout_parse_attr_data()
      set_elem: Validate nftnl_set_elem_set() parameters
      obj/ct_timeout: Fix NFTA_CT_TIMEOUT_DATA parser
      libnftnl.map: Export nftnl_{obj,flowtable}_set_data()
      Deprecate untyped data setters
      utils: Define __visible even if not supported by compiler


--4qppecvfce6p6usk--
