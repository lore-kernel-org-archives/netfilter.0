Received: from mail.netfilter.org (mail.netfilter.org [217.70.188.207])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6219915CD65
	for <netfilter@vger.kernel.org>; Mon,  6 May 2024 21:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.188.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715032438; cv=none; b=myIXyTRmEwPmj4c18Z2eQ4bIJfzebJkC8wLYaAYRlGoFYp6ax4zGGK1Sh3cWZCEDPRnv4SF07dAZDsG/6/Tf/wHr2JYVTzdh5n3pKkQqOzRM5PaX8EMNKxjnuRfj1D9RJ9mMcvYXMUmQq6gEzo0u71dIrc4N22yOSI9UMJ1fSpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715032438; c=relaxed/simple;
	bh=51IysXBNevouza/i/7Btqmrzhn4IYGbESIc/PVp4VE8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pjuUJMQ0nW+X12csr8+SPil9lepys66oIVfaKZt7GTaclpoAAPKbeRpo5wMk14RtTXDlnhXkWk2GYxBuJ+OH8wbIo3qROCVNNo9tfTLCbFPLT1vQhL0UNshsJIlc4oaGFX0jGIzglVbNb0WD8FzO9WfkzpJRrCIkog0IE2As6pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org; spf=pass smtp.mailfrom=netfilter.org; arc=none smtp.client-ip=217.70.188.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netfilter.org
Date: Mon, 6 May 2024 23:53:49 +0200
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: shibu samuel <msshibu@gmail.com>
Cc: netfilter@vger.kernel.org
Subject: Re: Kernel panic in nf_nat_setup_info, with re injected packet from
 libnfml
Message-ID: <ZjlRbXsjCc9uOjpN@calendula>
References: <CAKon4rta5-Nynqh71LCHVo6mJKKD+ZNz447NebsjMnoNuz6Ogg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAKon4rta5-Nynqh71LCHVo6mJKKD+ZNz447NebsjMnoNuz6Ogg@mail.gmail.com>

On Mon, May 06, 2024 at 09:27:43AM +0530, shibu samuel wrote:
> Hello All,
> 
> We are seeing a kernel panic, while using application which
> "reinjects" packets to kernel using, libnfml.
> 
> Below the brief view of the setup. Linux 5.14 Kernel, libnfml version 1.0.4)
> 
> - an LXC container based application is listening for certain packets,
> using libnfml netlink sockets.

Are you using br_netfilter as a built-in feature? I cannot see in the
module list.

> - In the HOST iptables rule, certain rules are written to push to the
> queue via below iptables actions
>    "-j NFQUEUE --queue-num 0 --queue-bypass"
> - The container based application examines the packet and then either
> a) Drops the packet by setting NF_DROP verdit
> or
> b) Reinjects back to kernel with NF_REPAT verdict.
> 
> 
> The issue is randomly reproducible, the setup has various sort of
> traffic (DNS, HTTP, HTTPS and multicast)
> 
> Below is the call stack we got from the Kernel Panic. (include the
> KASAD dump as well)
> 
> root@Beacon 10:/# [ 8927.212608]
> ==================================================================
> [ 8927.212650] BUG: KASAN: wild-memory-access in
> nf_nat_setup_info+0x170/0xb10 [nf_nat]
> [ 8927.218715] Read of size 1 at addr 646f636e652031de by task fstunnel/5303
> [ 8927.226609]
> [ 8927.233293] CPU: 3 PID: 5303 Comm: fstunnel Tainted: P        W
>     5.4.164 #0
> [ 8927.234858] Hardware name: Qualcomm Technologies, Inc.
> IPQ9574/AP-AL02-C2 (DT)
> [ 8927.242234] Call trace:
> [ 8927.249441]  dump_backtrace+0x0/0x1a8
> [ 8927.251784]  show_stack+0x14/0x1c
> [ 8927.255604]  dump_stack+0xe0/0x138
> [ 8927.258902]  __kasan_report+0x18c/0x1c4
> [ 8927.262197]  kasan_report+0xc/0x14
> [ 8927.265931]  __asan_load1+0x58/0x60
> [ 8927.269409]  nf_nat_setup_info+0x170/0xb10 [nf_nat]
[...]
> Some debugging from our side shows the that memory violation has
> happened in below function
> while using the tuple fetched from ct tuplehash.
> 
> nf_nat_setup_info->get_unique_tuple->find_appropriate_src->same_src

How did you obtain this call path? Do you have a reproducer?

> This suggests that there could be a corrupted/already freed entry in
> nat_bysource table.
> 
> 
> Can anybody help in this regards?
> - Any suggestions to further narrow the problem
> - Similar known problems or any patches in later versions?

There are at least two fixes for nf_queue that I can see in more recent
5.4 -stable series, but it might be unrelated.
