From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: [ANNOUNCE] nftables 0.9.5 release
Date: Sat, 6 Jun 2020 13:21:24 +0200
Message-ID: <20200606112124.GA4622@salvia>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="17pEHd4RhPHOinZp"
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netdev-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter <netfilter@vger.kernel.org>, netfilter-devel <netfilter-devel@vger.kernel.org>
Cc: netdev@vger.kernel.org, netfilter-announce@lists.netfilter.org


--17pEHd4RhPHOinZp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi!

The Netfilter project proudly presents:

        nftables 0.9.5

This release contains fixes and new features available up to the Linux
kernel 5.7 release.

* Support for set counters:

  table ip x {
            set y {
                    typeof ip saddr
                    counter
                    elements = { 192.168.10.35, 192.168.10.101, 192.168.10.135 }
            }

            chain z {
                    type filter hook output priority filter; policy accept;
                    ip daddr @y
            }
  }

  The counter statement in the set `y' definition turns on counters.

* Support for restoring set element counters via nft -f.

  # cat ruleset.nft
  table ip x {
        set y {
                typeof ip saddr
                counter
                elements = { 192.168.10.35 counter packets 1 bytes 84, 192.168.10.101 counter p
                             192.168.10.135 counter packets 0 bytes 0 }
        }

        chain z {
                type filter hook output priority filter; policy accept;
                ip daddr @y
        }
  }
  # nft -f ruleset.nft
  # nft list ruleset
  table ip x {
        set y {
                typeof ip saddr
                counter
                elements = { 192.168.10.35 counter packets 1 bytes 84, 192.168.10.101 counter p
                             192.168.10.135 counter packets 0 bytes 0 }
        }

        chain z {
                type filter hook output priority filter; policy accept;
                ip daddr @y
        }
  }

* Counters support for flowtables:

     table ip foo {
            flowtable bar {
                    hook ingress priority -100
                    devices = { eth0, eth1 }
                    counter
            }

            chain forward {
                    type filter hook forward priority filter;
                    flow add @bar counter
            }
     }

  You can list the counters via `conntrack -L':

  tcp      6 src=192.168.10.2 dst=10.0.1.2 sport=47278 dport=5201 packets=9 bytes=608 src=10.0.1.2 dst=10.0.1.1 sport=5201 dport=47278 packets=8 bytes=428 [OFFLOAD] mark=0 secctx=null use=2
  tcp      6 src=192.168.10.2 dst=10.0.1.2 sport=47280 dport=5201 packets=1005763 bytes=44075714753 src=10.0.1.2 dst=10.0.1.1 sport=5201 dport=47280 packets=967505 bytes=50310268 [OFFLOAD] mark=0 secctx=null use=2

  The [OFFLOAD] status bit specifies that this flow is exercising the
  flowtable fast datapath.

* typeof concatenations support for sets. You can use typeof to specify the
  datatype of the selector in sets, e.g.

     table ip foo {
            set whitelist {
                    typeof ip saddr . tcp dport
                    elements = { 192.168.10.35 . 80, 192.168.10.101 . 80 }
            }

            chain bar {
                    type filter hook prerouting priority filter; policy drop;
                    ip daddr . tcp dport @whitelist accept
            }
     }

  You can also use typeof concatenations in maps:

     table ip foo {
            map addr2mark {
                typeof ip saddr . tcp dport : meta mark
                elements = { 192.168.10.35 . 80 : 0x00000001,
                             192.168.10.135 . 80 : 0x00000002 }
            }

            chain bar {
                    type filter hook prerouting priority filter; policy drop;
                    meta mark set ip daddr . tcp dport map @addr2mark accept
            }
     }

* Support for concatenated ranges in anonymous sets.

  # nft add rule inet filter input ip daddr . tcp dport \
       { 10.0.0.0/8 . 10-23, 192.168.1.1-192.168.3.8 . 80-443 } accept

* Allow to reject packets with 802.1q from the bridge family.

  # nft add rule bridge foo bar ether type vlan reject with tcp reset

* Support for matching on the conntrack ID

  You can fetch the conntrack ID via `--output id':

  # conntrack -L --output id
  udp      17 18 src=192.168.2.118 dst=192.168.2.1 sport=36424 dport=53 packets=2 bytes=122 src=192.168.2.1 dst=192.168.2.118 sport=53 dport=36424 packets=2 bytes=320 [ASSURED] mark=0 use=1 id=2779986232

  Then, a very simple single rule to update counters for packets
  matching this conntrack ID.

  # nft add rule foo bar ct id 2779986232 counter

  You can combine this new selector with the existing set and map features
  to build more advanced rules.

You can download this new release from:

http://www.netfilter.org/projects/nftables/downloads.html#nftables-0.9.5
ftp://ftp.netfilter.org/pub/nftables/

To build the code, libnftnl 1.1.7 and libmnl >= 1.0.4 are required:

* http://netfilter.org/projects/libnftnl/index.html
* http://netfilter.org/projects/libmnl/index.html

Visit our wikipage for user documentation at:

* http://wiki.nftables.org

For the manpage reference, check man(8) nft.

In case of bugs and feature request, file them via:

* https://bugzilla.netfilter.org

Have fun.

--17pEHd4RhPHOinZp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="changes-nftables-0.9.5.txt"

Brett Mastbergen (1):
      ct: Add support for the 'id' key

Florian Westphal (1):
      concat: provide proper dtype when parsing typeof udata

Laura Garcia Liebana (2):
      doc: add hashing expressions description
      build: fix tentative generation of nft.8 after disabled doc

Matt Turner (2):
      build: Include generated man pages in dist tarball
      build: Allow building from tarballs without yacc/lex

Michael Braun (7):
      main: fix ASAN -fsanitize=address error in get_optstring()
      utils: fix UBSAN warning in fls
      datatype: fix double-free resulting in use-after-free in datatype_free
      tests: dump generated use new nft tool
      main: fix get_optstring truncating output
      datatype: add frag-needed (ipv4) to reject options
      evaluate: enable reject with 802.1q

Pablo Neira Ayuso (32):
      segtree: broken error reporting with mappings
      parser_bison: proper ct timeout list initialization
      src: NAT support for intervals in maps
      include: resync nf_nat.h kernel header
      src: add netmap support
      src: add STMT_NAT_F_CONCAT flag and use it
      evaluate: fix crash when handling concatenation without map
      tests: py: concatenation, netmap and nat mappings
      mnl: restore --debug=netlink output with sets
      tests: py: remove range test with service names
      tests: shell: add NAT mappings tests
      evaluate: incorrect byteorder with typeof and integer_datatype
      nat: transform range to prefix expression when possible
      rule: memleak in __do_add_setelems()
      rule: fix element cache update in __do_add_setelems()
      src: add rule_stmt_insert_at() and use it
      src: add rule_stmt_append() and use it
      parser_bison: release extended priority string after parsing
      parser_bison: release helper type string after parsing
      src: ct_timeout: release policy string and state list
      src: fix netlink_get_setelem() memleaks
      evaluate: fix memleak in stmt_evaluate_reject_icmp()
      mnl: fix error rule reporting with missing table/chain and anonymous sets
      src: rename CMD_OBJ_SETELEM to CMD_OBJ_ELEMENTS
      libnftables: call nft_cmd_expand() only with CMD_ADD
      src: add CMD_OBJ_SETELEMS
      src: remove empty file
      mnl: add function to convert flowtable device list to array
      src: add devices to an existing flowtable
      src: delete devices to an existing flowtable
      src: allow flowtable definitions with no devices
      build: Bump version to v0.9.5

Phil Sutter (5):
      segtree: Fix missing expires value in prefixes
      segtree: Use expr_clone in get_set_interval_*()
      segtree: Merge get_set_interval_find() and get_set_interval_end()
      segtree: Fix get element command with prefixes
      JSON: Improve performance of json_events_cb()

Stefano Brivio (6):
      include: Resync nf_tables.h cache copy
      src: Set NFT_SET_CONCAT flag for sets with concatenated ranges
      build: Fix doc build, restore A2X assignment for doc/Makefile
      tests: py: Actually use all available hooks in bridge/chains.t
      evaluate: Perform set evaluation on implicitly declared (anonymous) sets
      tests: py: Enable anonymous set rule with concatenated ranges in inet/sets.t


--17pEHd4RhPHOinZp--
