From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: [ANNOUNCE] ebtables 2.0.11 release
Date: Mon, 2 Dec 2019 16:33:56 +0100
Message-ID: <20191202153356.xowrrxn26jlm5v4f@salvia>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="xu3xazvyeffwpblx"
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter-devel@vger.kernel.org
Cc: netfilter@vger.kernel.org, netfilter-announce@lists.netfilter.org, lwn@lwn.net


--xu3xazvyeffwpblx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi!

The Netfilter project presents:

        ebtables 2.0.11

ebtables is the userspace command line program used to configure the
Linux 2.4.x and bridge packet filtering ruleset. It is targeted
towards system administrators.

NOTE: This is a release of legacy software. Patches may still be
accepted and pushed out to the git repository, which will remain active
and accessible as usual although support for this software might be
discontinued at some point.

We are thankful to all the contributors of ebtables over time and we
also acknowledge it is time to move on.

See ChangeLog that comes attached to this email for more details.

You can download it from:

ftp://ftp.netfilter.org/pub/ebtables/

Happy firewalling.

--xu3xazvyeffwpblx
Content-Type: text/plain; charset="utf-8"
Content-Disposition: attachment; filename="changes-ebtables-2.0.11.txt"
Content-Transfer-Encoding: 8bit

Alin Năstac (1):
      ebtables: Allow RETURN target rules in user defined chains

Arturo Borrero Gonzalez (3):
      ebtables: legacy renaming
      ebtables: drop .spec file
      ebtables: drop sysvinit script

Bart De Schuymer (4):
      add RARP and update iana url
      add info about -Wl,-no-as-needed
      remove ebtables-restore binary from repository
      don't print IPv6 mask if it's all ones (based on patch by Mariusz Mazur <mmazur at axeos.com>)

Baruch Siach (1):
      include: Fix musl libc compatibility

Bernie Harris (1):
      extensions: Add string filter to ebtables

Duncan Roe (2):
      ebtables: Fix build errors and warnings
      extensions: ebt_string: take action if snprintf discards data

Felix Janda (2):
      extensions: Use stdint types
      ethernetdb.h: Remove C++ specific compiler hint macro _THROW

Florian Westphal (2):
      extensions: fix build failure on fc28
      ebtablesd: avoid build warning

Gargi Sharma (1):
      ebtables: extensions: Constify option struct

Jan Engelhardt (7):
      build: update ebtables.h from kernel and drop local unused copy
      build: drop install -o/-g root
      build: rename sed source files to .in
      build: use autoconf-style placeholders in sed-ed files
      extensions: use __attribute__((constructor)) for autoregistration
      Add .gitignore
      build: move to automake

Luis Fernando (1):
      workaround for kernel regression bug: IPv6 source/destination addresses are potentially not matched correctly

Matthias Schiffer (4):
      include: sync linux/netfilter_bridge/ebt_ip.h with kernel
      Move ICMP type handling functions from ebt_ip6 to useful_functions.c
      ebt_ip: add support for matching ICMP type and code
      ebt_ip: add support for matching IGMP type

Pablo Neira Ayuso (1):
      build: ebtables 2.0.11 release

Pedro Alvarez (1):
      Add kernel headers needed from v3.16

Petri Gynther (1):
      fix compilation warning

Phil Sutter (11):
      Use flock() for --concurrent option
      Fix locking if LOCKDIR does not exist
      extensions: among: Fix bitmask check
      Print IPv6 prefixes in CIDR notation
      Adjust .gitignore to renamed files
      extensions: Drop Makefile
      Allow customizing lockfile location at configure time
      extensions: Add AUDIT target
      Fix segfault with missing lockfile directory
      Fix incorrect IPv6 prefix formatting
      Drop ebtables-config from repository

Sanket Shah (1):
      Add --noflush command line support for ebtables-restore


--xu3xazvyeffwpblx--
