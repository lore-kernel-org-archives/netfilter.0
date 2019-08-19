From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: [ANNOUNCE] nftables 0.9.2 release
Date: Mon, 19 Aug 2019 13:58:07 +0200
Message-ID: <20190819115807.myv6owxzblj2bthd@salvia>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="576j5lenulbtw6hh"
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netdev-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter <netfilter@vger.kernel.org>, netfilter-devel <netfilter-devel@vger.kernel.org>
Cc: netdev@vger.kernel.org, lwn@lwn.net


--576j5lenulbtw6hh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi!

The Netfilter project proudly presents:

        nftables 0.9.2

This release contains fixes and new features, available up with Linux
kernels >= 5.3-rc.

* Transport header port matching, e.g.

        add rule x y ip protocol { tcp, udp } th dport 53

  This allows you to match on transport protocols with ports
  regardless the layer 4 protocol type. You can also use this from
  sets, maps and concatenations, e.g.

        table inet filter {
            set myset {
                    type ipv4_addr . inet_proto . inet_service
            }

            chain forward {
                    type filter hook forward priority filter; policy accept;
                    ip daddr . ip protocol . th dport @myset
            }
        }

* Allow to restore expiration for set elements:

        add element ip x y { 1.1.1.1 timeout 30s expires 15s }

* Match on IPv4 options, e.g.

        add rule x y ip option rr exists drop

  You can also match on type, ptr, length and addr fields of routing
  options, e.g.

        add rule x y ip option rr type 1 drop

  lsrr, rr, ssrr and ra IPv4 options are supported.

* Use prefix and ranges in statements, e.g.

        iifname ens3 snat to 10.0.0.0/28
        iifname ens3 snat to 10.0.0.1-10.0.0.15

* Allow for variables in chain definitions, e.g.

    define default_policy = accept
    add chain ip foo bar { type filter hook input priority filter; policy $default_policy }

  also when specifying chain priority, either numeric or literal:

    define prio = filter
    define prionum = 10
    define prioffset = "filter - 150"

    add table ip foo
    add chain ip foo bar { type filter hook input priority $prio; }
    add chain ip foo ber { type filter hook input priority $prionum; }
    add chain ip foo bor { type filter hook input priority $prioffset; }

* synproxy support, e.g.

    table ip x {
            chain y {
                    type filter hook prerouting priority raw; policy accept;
                    tcp dport 8888 tcp flags syn notrack
            }

            chain z {
                    type filter hook forward priority filter; policy accept;
                    tcp dport 8888 ct state invalid,untracked synproxy mss 1460 wscale 7 timestamp sack-perm
                    ct state invalid drop
            }
    }

  This ruleset above places the TCP port 8888 behind the synproxy.

* conntrack expectations via ruleset policy, e.g.

        table x {
                ct expectation myexpect {
                        protocol tcp
                        dport 5432
                        timeout 1h
                        size 12
                        l3proto ip
                }

                chain input {
                        type filter hook input priority 0;

                        ct state new tcp dport 8888 ct expectation set myexpect
                        ct state established,related counter accept
                }
        }

  This ruleset creates an expectation on TCP port 5432 for each new TCP
  connection to port 8888. This expectation expires after 1 hour and the
  maximum number of expectation that are pending to be confirmed are 12.

* The libnftables library only exports only public symbols.

* ... and bug fixes.

See ChangeLog that comes attached to this email for more details.

You can download it from:

http://www.netfilter.org/projects/nftables/downloads.html#nftables-0.9.2
ftp://ftp.netfilter.org/pub/nftables/

To build the code, libnftnl 1.1.4 and libmnl >= 1.0.3 are required:

* http://netfilter.org/projects/libnftnl/index.html
* http://netfilter.org/projects/libmnl/index.html

Visit our wikipage for user documentation at:

* http://wiki.nftables.org

For the manpage reference, check man(8) nft.

In case of bugs and feature request, file them via:

* https://bugzilla.netfilter.org

Happy firewalling!

--576j5lenulbtw6hh
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: attachment; filename="changes-nftables-0.9.2.txt"
Content-Transfer-Encoding: quoted-printable

Arturo Borrero Gonzalez (4):
      nft: don't use xzalloc()
      libnftables: reallocate definition of nft_print() and nft_gmp_print()
      libnftables: export public symbols only
      doc: don't check asciidoc output with xmllint

Brett Mastbergen (1):
      src: Sync comments with current expr definition

Fernando Fernandez Mancera (7):
      src: introduce SYNPROXY matching
      json: fix synproxy flag parser typo
      tests: py: add missing json outputs
      include: json: add missing synproxy stmt print stub
      src: osf: fix snprintf -Wformat-truncation warning
      src: allow variables in the chain priority specification
      src: allow variable in chain policy

Florian Westphal (17):
      src/ct: provide fixed data lengh sizes for ip/ip6 keys
      proto: add pseudo th protocol to match d/sport in generic way
      tests: shell: make sure we test nft binary from working tree, not host
      tests: fix up two broken json test cases
      doc: fib: explain example in more detail
      src: evaluate: support prefix expression in statements
      tests: shell: check for table re-definition usecase
      doc: fib: explain example in more detail
      scanner: don't rely on fseek for input stream repositioning
      src: mnl: fix setting rcvbuffer size
      src: fix jumps on bigendian arches
      src: parser: fix parsing of chain priority and policy on bigendian
      src: mnl: retry when we hit -ENOBUFS
      src: json: support json restore for "th" pseudoheader
      src: json: fix constant parsing on bigendian
      tests: make sure i is defined
      src: libnftnl: run single-initcalls only once

Jan Engelhardt (3):
      build: unbreak non-functionality of --disable-python
      build: avoid recursion into py/ if not selected
      build: avoid unnecessary call to xargs

Jeremy Sowden (2):
      libnftables: get rid of repeated initialization of netlink_ctx
      rule: removed duplicate member initializer.

Laura Garcia Liebana (2):
      src: enable set expiration date for set elements
      cache: incorrect flush flag for table/chain

M. Braun (2):
      src: Fix dumping vlan rules
      tests: add json test for vlan rule fix

Pablo Neira Ayuso (26):
      monitor: fix double cache update with --echo
      tests: shell: restore element expiration
      parser_bison: do not enforce semicolon from ct helper block
      rule: do not print semicolon in ct timeout
      rule: print space between policy and timeout
      mnl: remove unnecessary NLM_F_ACK flags
      tests: shell: update test to include reset command
      ipopt: missing ipopt.h and ipopt.c files
      src: use malloc() and free() from cli and main
      main: replace NFT_EXIT_NOMEM by EXIT_FAILURE
      cli: remove useless #include headers
      src: add set_is_datamap(), set_is_objmap() and set_is_map() helpers
      evaluate: missing object maps handling in list and flush commands
      src: use set_is_anonymous()
      evaluate: honor NFT_SET_OBJECT flag
      cache: incorrect flags for create commands
      evaluate: missing basic evaluation of expectations
      evaluate: bogus error when refering to existing non-base chain
      evaluate: missing location for chain nested in table definition
      cache: add NFT_CACHE_UPDATE and NFT_CACHE_FLUSHED flags
      src: add parse_ctx object
      src: remove global symbol_table
      tests: shell: move chain priority and policy to chain folder
      include: refresh nf_tables.h cached copy
      gmputil: assert length is non-zero
      build: Bump version to v0.9.2

Phil Sutter (7):
      json: Print newline at end of list output
      main: Bail if non-available JSON was requested
      files: Move netdev-ingress.nft to /etc/nftables as well
      files: Add inet family nat config
      json: Fix memleak in timeout_policy_json()
      parser_bison: Fix for deprecated statements
      src: Call bison with -Wno-yacc to silence warnings

Shekhar Sharma (1):
      tests: py: fix python3

Stephen Suryaputra (1):
      exthdr: add support for matching IPv4 options

St=E9phane Veyret (1):
      src: add ct expectations support


--576j5lenulbtw6hh--
