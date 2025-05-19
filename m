Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc [91.216.245.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B1F21C9E3
	for <netfilter@vger.kernel.org>; Mon, 19 May 2025 22:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.216.245.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747693255; cv=none; b=ASar8CMsU4tZxjoMLMhkUxeUcgMvZyrHRX2lK4wFfTIWfjjAqJ4N/eK1/yHLa71eEDZvNKYJDw+h0ZY3zD6DHKwWzxBGh5oLxpnn6llqo8LantBYXOoXIOZGMujzSgVEsAP+WKbLgG9HV/4Ov3nsgcrzyeX/DlS6LWRLjeJ8H2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747693255; c=relaxed/simple;
	bh=lmi67jkqL/smeBcQRYV0puPSlv1Jg/NaqLWAQzIvN90=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CqL33shpH+ufNvw18ZyC6r7/o3lPdm5ldxqMjED/iaL++4WAGfXKcCrlDe6pEfGEwawADNN+rs0or4PTYLmE6XcTzvIkkoTMMrFyKrqh3NUhKtqoZHxmBYKd0f17/dhb64FNnFcuk46mAV119hmuoQ+uW8p9Vu9VFC6Ur7glVtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de; spf=pass smtp.mailfrom=strlen.de; arc=none smtp.client-ip=91.216.245.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=strlen.de
Received: by Chamillionaire.breakpoint.cc (Postfix, from userid 1003)
	id CA71060146; Tue, 20 May 2025 00:20:42 +0200 (CEST)
Date: Tue, 20 May 2025 00:20:10 +0200
From: Florian Westphal <fw@strlen.de>
To: netfilter@vger.kernel.org
Subject: [ANNOUNCE] ulogd 2.0.9 release
Message-ID: <aCuxDRv-wa236GbK@strlen.de>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="Ye+0WOi6LuW7/zp3"
Content-Disposition: inline


--Ye+0WOi6LuW7/zp3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi!

The Netfilter project proudly presents:

        ulogd 2.0.9

ulogd is a userspace logging daemon for netfilter/iptables related
logging. This includes per-packet logging and per-flow logging as
well as flexible user-defined accounting. This also includes output
plugins to represent logging using different backends such as mysql,
postgresql, pcap, json among others.

See ChangeLog that comes attached to this email for more details.

You can download it from:

https://www.netfilter.org/projects/ulogd/downloads.html

Happy firewalling.

--Ye+0WOi6LuW7/zp3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="changes-ulogd-2.0.9.txt"

Corubba Smith (18):
      nfct: fix calloc argument order
      nfct: add newline to reliable log message
      gprint: fix comma after ip addresses
      ipfix: re-arm send timer
      ulogd: ignore private data on plugin stop
      ulogd: fix config file fd leak
      ulogd: ignore malformed config directives
      nfct: add icmpv6
      ulogd: add ulogd_parse_configfile public function
      all: use config_parse_file function in all plugins
      ulogd: improve integer option parsing
      ulogd: provide default configure implementation
      all: remove trivial configure hooks
      ulogd: raise error on unknown config key
      nfct: fix counter-reset without hashtable
      nfct: add flow end timestamp on hashtable purge
      ulog: remove input plugin
      ulogd: remove libipulog

Harald Welte (1):
      README: update project homepage and mailing list addresses

Jeremy Sowden (25):
      doc: mysql: declare MAC protocol columns unsigned
      ulogd: fix parse-error check
      filter: fix buffer sizes in filter plug-ins
      JSON: remove incorrect config value check
      db: fix back-log capacity checks
      pgsql: correct `ulog2.ip_totlen` type
      filter: IP2BIN: correct spelling of variable
      output: add missing support for int64_t values
      output: Fix formatting of OPRINT switch.
      build: fix pgsql fall-back configuration of CFLAGS
      pcap: simplify opening of output file
      pcap: prevent crashes when output `FILE *` is null
      src: record length of integer key values
      printpkt: fix statement punctuator
      printpkt, raw2packet_BASE: keep gateway address in NBO
      raw2packet_BASE: store ARP address values as integers
      ip2hbin: store ipv6 address as integer
      ipfix: skip non-ipv4 addresses
      gprint, oprint: use inet_ntop to format ip addresses
      gprint, oprint: add support for printing ipv6 addresses
      sqlite3: correct binding of ipv4 addresses and 64-bit integers
      sqlite3: insert ipv6 addresses as null rather than garbage
      db: insert ipv6 addresses in the same format as ip2bin
      IP2STR: correct address buffer size
      IP2HBIN, IP2STR: correct typo's

Kyuwon Shim (1):
      ulogd2: avoid use after free in unregister on global ulogd_fds linked list

Pablo Neira Ayuso (1):
      build: bump release version to 2.0.9

Phil Sutter (1):
      Makefile: Create LZMA-compressed dist-files


--Ye+0WOi6LuW7/zp3--
