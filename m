Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9EA14AEC7
	for <netfilter@vger.kernel.org>; Thu, 11 Apr 2024 16:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712854491; cv=none; b=mAwd3nbsynIMiIW8Brd/d2jlEIpBUZsw2Jl9Od9jfaG3h8xNvVADqlUEXeep6F9ro8B6LpfBv+HCFEqkM+1hrSe2vN0PEdlVktwbfHAxYk6qoG6DPBsXU6TKaSCy3NDvjaYVhM/PPGtUs6+dEOv142SPp9NP236u6QEhjfgAqNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712854491; c=relaxed/simple;
	bh=as/RJzSr4ANHBM+dXpp6VSA3IzN0pc4I1LiLtxEw69o=;
	h=Date:From:To:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eJ8Hlb+s6L9f9SVqUBmwb0MmU+LZ/Ty3YiBjVYN5cO8SfI9zG/6dPvs6bWU2nqGmO2IWFVcziQbjUTSdyBnc0JHmLR/v0fKyrd9uYy/1a/JUAn5aYR2Hfm/0LX6mQsZ5ytBgkzsb7nLEV9GfitlllY/TAyvTwzZkcjz3ABMyaQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=eOQw8147; arc=none smtp.client-ip=198.252.153.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="eOQw8147"
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx0.riseup.net (Postfix) with ESMTPS id 4VFm5H5xqKz9wrB
	for <netfilter@vger.kernel.org>; Thu, 11 Apr 2024 16:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1712854483; bh=as/RJzSr4ANHBM+dXpp6VSA3IzN0pc4I1LiLtxEw69o=;
	h=Date:From:To:Subject:In-Reply-To:References:Reply-To:From;
	b=eOQw8147f4x2MEF9Yzja8KbC7m+Sj8X2jdVI50vrVzfTx7nBSMZHX+GvGyLzqwcqB
	 ofBvdJRzdwqZLArHfF/QoXIF2994PwOn9AvoUCFe+I2QC31SxL/rcVYpAKwX3nyMex
	 Ybr8+1BEW4q9H9aHM0z1kHdKT8Xg7uzlSIxwWjyw=
X-Riseup-User-ID: 841B8B6AE3BAFFEB975CB3A8D7B51BC69C1856C74D0C2D91151D50C1104AE4C4
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4VFm5250J5zFtkf
	for <netfilter@vger.kernel.org>; Thu, 11 Apr 2024 16:54:29 +0000 (UTC)
Date: Thu, 11 Apr 2024 16:54:12 -0000
From: "William N." <netfilter@riseup.net>
To: netfilter@vger.kernel.org
Subject: Re: connlimit from wiki.nftables.org not working
Message-ID: <20240411165412.0f0c65ce@localhost>
In-Reply-To: <f0514bc1-c1dd-4f24-97e5-8c40807dbae9@app.fastmail.com>
References: <20240410172343.1f7f5ee2@localhost>
	<f0514bc1-c1dd-4f24-97e5-8c40807dbae9@app.fastmail.com>
Reply-To: netfilter@riseup.net
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 10 Apr 2024 22:40:53 +0100 Kerin Millar wrote:

> For the avoidance of doubt, please show the complete ruleset that you
> are attempting to load.

# cat connlimit-example 
#!/usr/sbin/nft -f

flush ruleset

table ip filter {
        set my_connlimit {
                type ipv4_addr
                size 65535
                flags dynamic
        }

        chain output {
                type filter hook output priority filter; policy accept;
                ct state new add @my_connlimit { ip saddr ct count over 20 } counter drop
        }
}

# nft flush ruleset
# nft list ruleset
# ./connlimit-example 
./connlimit-example:14:16-62: Error: Could not process rule: No such file or directory
                ct state new add @my_connlimit { ip saddr ct count over 20 } counter drop
                             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
# nft list ruleset
#
# nft -V
nftables v1.0.6 (Lester Gooch #5)
  cli:          editline
  json:         yes
  minigmp:      no
  libxtables:   yes
#

> Additionally, compare the output of "uname -r" to the contents of the
> /lib/modules directory. Sometimes, people upgrade their kernels then
> forget to reboot before trying to load a ruleset that requires for
> one or more kernel modules to be newly loaded.

Everything is up-to-date and rebooted (many times).

# lsmod | grep -E '^nf'
nft_flow_offload       16384  0
nf_flow_table_inet     16384  0
nf_flow_table          40960  2 nft_flow_offload,nf_flow_table_inet
nf_conntrack_netlink    57344  0
nft_limit              16384  0
nf_log_syslog          24576  0
nft_log                16384  0
nft_nat                16384  0
nft_reject_ipv6        16384  0
nf_reject_ipv6         20480  1 nft_reject_ipv6
nft_reject_ipv4        16384  0
nf_reject_ipv4         16384  1 nft_reject_ipv4
nft_reject             16384  2 nft_reject_ipv6,nft_reject_ipv4
nft_ct                 20480  0
nft_masq               16384  0
nft_chain_nat          16384  0
nf_nat                 57344  3 nft_nat,nft_masq,nft_chain_nat
nf_conntrack          167936  7 nf_nat,nft_flow_offload,nft_ct,nft_nat,nf_conntrack_netlink,nft_masq,nf_flow_table
nf_defrag_ipv6         24576  1 nf_conntrack
nf_defrag_ipv4         16384  1 nf_conntrack
nf_tables             307200  11 nft_reject_ipv6,nft_reject_ipv4,nft_flow_offload,nft_ct,nft_log,nft_nat,nft_masq,nft_chain_nat,nft_limit,nf_flow_table_inet,nft_reject
nfnetlink              20480  2 nf_conntrack_netlink,nf_tables
