From: Florian Westphal <fw@strlen.de>
Subject: [ANNOUNCE] libnetfilter_conntrack 1.0.9 release
Date: Mon, 14 Feb 2022 12:44:08 +0100
Message-ID: <YgpAiCXVTPZEK6Qq@strlen.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="5j6Eu2BS301oJprp"
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
List-ID: <netfilter.vger.kernel.org>
To: netfilter-devel@vger.kernel.org
Cc: netfilter@vger.kernel.org, netfilter-announce@lists.netfilter.org, lwn@lwn.net


--5j6Eu2BS301oJprp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi!

The Netfilter project proudly presents:

        libnetfilter_conntrack 1.0.9

This release comes with the new nfct_nlmsg_build_filter() function that
allows to add metadata for kernel-side filtering of conntrack entries
during conntrack table dump.

The nfct_query() API supports the new NFCT_Q_FLUSH_FILTER argument,
it allows to flush only ipv4 or ipv6 entries from the connection
tracking table.

nfct_snprint family of functions have been updated.
SCTP conntrack entries now support 'heartbeat sent/acked' state.
Entries offloaded to hardware include '[HW_OFFLOAD]' in the formatted
output string.

Notable bugs fixed with this release include:
Fix buffer overflows and out-of-bounds accesses in the
nfct_snprintf() functions.

nfct_nlmsg_build() did not work for ICMP flows unless all ICMP attributes
were set in the reply tuple too, this affected the 'conntrack' tool
where updates (e.g. setting the conntrack mark to a different value)
of ICMP flows would not work.

See ChangeLog that comes attached to this email for more details.

You can download it from:

https://www.netfilter.org/projects/libnetfilter_conntrack/downloads.html

--5j6Eu2BS301oJprp
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: attachment;
	filename="changes-libnetfilter_conntrack-1.0.9.txt"
Content-Transfer-Encoding: quoted-printable

Daniel Gr=F6ber (9):
      src: Handle negative snprintf return values properly
      src: Fix nfexp_snprintf return value docs
      conntrack: Replace strncpy with snprintf to improve null byte handling
      conntrack: Fix incorrect snprintf size calculation
      include: Add ARRAY_SIZE() macro
      conntrack: Fix buffer overflow on invalid icmp type in setters
      conntrack: Move icmp request>reply type mapping to common file
      conntrack: Fix buffer overflow in protocol related snprintf functions
      conntrack: Fix buffer overflows in __snprintf_protoinfo* like in *2st=
r fns

Eyal Birger (1):
      examples: check return value of nfct_nlmsg_build()

Fabrice Fontaine (1):
      libnetfilter_conntrack.pc.in: add LIBMNL_LIBS to Libs.Private

Florian Westphal (7):
      conntrack: dccp print function should use dccp state
      conntrack: sctp: update states
      include: add CTA_STATS_CLASH_RESOLVE
      include: sync uapi header with nf-next
      src: add support for status dump filter
      include: add CTA_STATS_CHAIN_TOOLONG from linux 5.15 uapi
      libnetfilter_conntrack: bump version to 1.0.9

Jan Engelhardt (2):
      build: use the right automake variables
      Update .gitignore

Jeremy Sowden (1):
      build: update obsolete autoconf macros

Ken-ichirou MATSUZAWA (1):
      conntrack: fix invmap_icmpv6 entries

Luuk Paulussen (1):
      conntrack: Don't use ICMP attrs in decision to build repl tuple

Pablo Neira Ayuso (5):
      src: add IPS_HW_OFFLOAD flag
      conntrack: add flush filter command
      build: missing internal/proto.h in Makefile.am
      conntrack: add nfct_nlmsg_build_filter() helper
      conntrack: don't cancel nest on unknown layer 4 protocols

Phil Sutter (2):
      tests: Fix for missing qa-connlabel.conf in tarball
      tests: Add simple tests to TESTS variable


--5j6Eu2BS301oJprp--
