Received: from isrv.corpit.ru (isrv.corpit.ru [86.62.121.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D525E29B78D
	for <netfilter@vger.kernel.org>; Thu,  3 Jul 2025 07:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=86.62.121.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751528577; cv=none; b=iAakHMU226aQHC7Aw656jAKCwNdA2lo97W8Gwvdgy6nDzjaceSJJw/bB8mDCALjCgOSFBGiQtilIo+sWZkZEj4ESi96LUGMMG97aV9ChZjSf5B9gPjlDqKjRrDMLISodfkpO5ObInTSRtnnNIq/DaLcR3UmeXeyqPmhTectfWpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751528577; c=relaxed/simple;
	bh=JmMGXtKP9XceFzAsoCABYYk2o2DPOlrJFnc/3pjSpMU=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=V7tIL16z3F1SAX4S8UzTivOsJG9+rYGJIBF2kBWRpe6/1JExPu8JPyzIfsRdpWEw0QtwdOzMpIg84L42yim7jvx/pb1Xdp5eOe8lkx6C0ttyac6uZkETHH46DdgQVZyupKTBzWn5uRLxIwwy2BnDQkGxHFXOXlNkFS2iK0qBpv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tls.msk.ru; spf=pass smtp.mailfrom=tls.msk.ru; arc=none smtp.client-ip=86.62.121.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tls.msk.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tls.msk.ru
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id CB45B132C9A
	for <netfilter@vger.kernel.org>; Thu, 03 Jul 2025 10:36:57 +0300 (MSK)
Received: from [192.168.177.146] (mjtthink.wg.tls.msk.ru [192.168.177.146])
	by tsrv.corpit.ru (Postfix) with ESMTP id 4B3E823825B
	for <netfilter@vger.kernel.org>; Thu,  3 Jul 2025 10:37:11 +0300 (MSK)
Message-ID: <6c104af0-eadd-4449-b690-126030b8794f@tls.msk.ru>
Date: Thu, 3 Jul 2025 10:37:11 +0300
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, ru-RU
To: netfilter@vger.kernel.org
From: Michael Tokarev <mjt@tls.msk.ru>
Subject: another netfilter-initiated martian source
Autocrypt: addr=mjt@tls.msk.ru; keydata=
 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
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi!

I'm having, it looks like, an endless amount of issues with
netfilter hooking in the wrong order into the linux network
stack.  This time, it is the netfilter "reject" action, which
triggers "martian source" detection in the network stack, in
a weird way.

I've two "external" network interfaces (pointing to two ISPs),
with policy routing set up for them (different IPs are routed
to/via different ISPs), -- eth-mts and eth-rinet.  The main
routing table has no default route, there are two additional
routing tables (with just one "default" route pointing to one
or another ISP).  And a few rules like 'from foo lookup bar',
routing specific IPs via one or another ISP.

Also there's an "internal" interface, eth-tls, with 192.168.x
addresses behind it.  With NAT for certain internal hosts.

The policy rules:

   from 192.168.177.2 lookup route-mts
   from all lookup route-rinet

  route-mts:
   default via $route-mts dev eth-mts
  route-rinet:
   default via $route-rinet dev eth-rinet

The relevant netfilter rules:

  ip filter chain forward {
    type filter hook forward priority filter
    ct state {established,related} accept
    iifname eth-tls oifname eth-mts saddr 192.168.177.2 <some-condition> 
accept
    iifname eth-tls oifname eth-mts saddr 192.168.177.2 reject log 
prefix "tls->ext reject: "
  }

  ip nat chain postrouting {
    type nat hook postrouting priority srcnat
    oifname eth-mts ip saddr 192.168.177.2 counter snat to $mts-ip
  }

With these, the following packets are seen on eth-tls interface
(192.168.177.5 is this router box):

listening on eth-tls, link-type EN10MB (Ethernet), snapshot length 
262144 bytes
10:13:12.353416 IP 192.168.177.2.59152 > 16.15.192.246.443: Flags [S], 
seq 1254965270, win 64240, options [mss 1460,sackOK,TS val 1778537536 
ecr 0,nop,wscale 7], length 0
10:13:12.353617 IP 192.168.177.5 > 192.168.177.2: ICMP 16.15.192.246 tcp 
port 443 unreachable, length 68

So far, this all works as expected.

And at the same time, I see this in dmesg:

Jul 03 10:13:12 gate kernel: tls->ext reject: IN=eth-tls OUT=eth-mts 
MAC=00:90:27:30:6d:1c:d6:4d:61:a4:e3:03:08:00 SRC=192.168.177.2 
DST=16.15.192.246 LEN=60 TOS=0x00 PREC=0x00 TTL=63 ID=58986 DF PROTO=TCP 
SPT=41754 DPT=443 WINDOW=64240 RES=0x00 SYN URGP=0
ul 03 10:13:12 gate kernel: IPv4: martian source 192.168.177.2 from 
16.15.192.246, on dev eth-rinet
Jul 03 10:13:12 gate kernel: ll header: 00000000: 00 90 27 30 6d 1c d6 
4d 61 a4 e3 03 08 00

and this logging makes no sense whatsoever.

This *seems* to be triggered by the reject packet (ICMP), which should
be injected by the netfilter into the network stack.  Why it causes
"martians detection" is the first question - it should not, since
this packet is not sent by any external host.

Next, why it is logged as coming from eth-rinet interface??  It is
not coming from any interface, and it has nothing to do with this
interface either - initially it should've been routed to eth-mts,
not eth-rinet.

And finally, eth-rinet iface is configured to drop martians (in
addition to logging it) - rp_filter is set to 1.  Yet, this ICMP packet
is actually sent to the originating host.

What is going on here?

It seems that interaction between netfilter code and the network
stack should be reviewed.  There are a few rather serious bugs in
there, it looks like, - all are about the order of the hooks between
netfilter and network/routing stack.  We're almost there, but not
quite there yet :)

Thanks,

/mjt
