Received: from mail-4319.protonmail.ch (mail-4319.protonmail.ch [185.70.43.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90EBF635
	for <netfilter@vger.kernel.org>; Fri,  1 Aug 2025 00:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754008664; cv=none; b=R6b/hzoAMIcwsTofb2d0OospudTOEGgqoctRVmLq26a/A7K5vaZu3X6VU20RXe6LnyppTWV1/mZsxR3HFPeljFuO1iJkHlTNaNfN4S7Sxe2vkPf2hO0JRMxrvIioMPO+SxmMOOI9msUFkp0nDV5fj+LKxMGJ0KvRo+brqmxxtGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754008664; c=relaxed/simple;
	bh=1uMVQhVoI9n3g4hA+927F91Ps0BRRwnef+dlbozm5Ec=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qhiLXXl+Qw5lxmHciivcixrgZLiwm+Hb6QGu5gxpZLG1bbr2Rzdihnd0maNSJfLnKKsRFdnqixjfz29x7k7LqYhSwIwF3NQ9S1Ox0RLEU6fkL8hoJIqwBgwQqD3t7eXDDZO2sHBfXi6oGqONmBoK6vXI2qAumd5kPxz/4FESz6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=ehLwUAp0; arc=none smtp.client-ip=185.70.43.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="ehLwUAp0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1754008653; x=1754267853;
	bh=1uMVQhVoI9n3g4hA+927F91Ps0BRRwnef+dlbozm5Ec=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=ehLwUAp0u1SOJxb7v0gbDjQotb6UR+jYUIqTiqq0g7YsAtdd1NegaE1lwyss/TNSb
	 5tFTDmHsmUKLfi1cW5G2/tLH3DPabs+bnIliduBD3fPvaM7pWzjAfTrnkbnme5RZP6
	 To1YhFQW5Qc9uoEJh0NttQSS237YcUv4KHV1ttsoDNRsv3OQGAqTSMNfwHPM5oCFKN
	 Dl6Zage2pIyB65ef6AJqfknIobG1ull0u4xbSyn74GcLwge611B4bEYzdtzdv0B8sa
	 CIZihkkmtoyOdHOSahu9NWhCNiQ8XNPTLRwA038Cbx57nbHRq/ZljIg2WTmY6o0uJ0
	 7HUNyds+SB7ZA==
Date: Fri, 01 Aug 2025 00:37:29 +0000
To: Michael Tokarev <mjt@tls.msk.ru>
From: Sunny73Cr <Sunny73Cr@protonmail.com>
Cc: netfilter@vger.kernel.org
Subject: Re: another netfilter-initiated martian source
Message-ID: <piJMusI05I5kJYQLODHq1mfDgoziqzcA4nAy0EtKXI2iPinVOf889r3n5--jM9kqfZ2jd0_yP6DH72SWYCnmdJsyzYH5nMrdjtc64uBkvT0=@protonmail.com>
In-Reply-To: <6c104af0-eadd-4449-b690-126030b8794f@tls.msk.ru>
References: <6c104af0-eadd-4449-b690-126030b8794f@tls.msk.ru>
Feedback-ID: 13811339:user:proton
X-Pm-Message-ID: f1374f2cfbe76e60560f88c3340d1f735c90e96c
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

Unless there are additional rules in a forward chain, which were not shown =
in your mail:

> With these, the following packets are seen on eth-tls interface...
> ...ICMP 16.15.192.246 tcp port 443 unreachable...
...
> And at the same time, I see this in dmesg:...
> Jul 03 10:13:12 gate kernel: tls->ext reject:...

It appears that reject functions 'well' - an ICMP reject is sent; though, i=
t should probably appear in dmesg - that is configuration task on your part=
. Whether you can aptly match this type of packet with expressions, I am un=
sure. After writing the rule to match ICMP reject, check the 'bytecode' by =
adding the '-d' flag to your call to 'nft' when loading the ruleset. Try '-=
d netlink', but '-d all' can be helpful if you have the time.

> With these, the following packets are seen on eth-tls interface...
> And at the same time, I see this in dmesg...

It appears that the packet is not forwarded - try re-running the test after=
 logging all packets to dmesg, and compare to output of something like tsha=
rk or wireshark.

> And at the same time, I see this in dmesg:...
> ul 03 10:13:12 gate kernel: IPv4: martian source 192.168.177.2 from
16.15.192.246, on dev eth-rinet

It is possible that this log occurs prior to the packet getting dropped. Yo=
u are correct in saying that it does not originate from address "16.15..." =
and it should not be on the 'rinet' interface. What a poor log! That code m=
ay have been written when only inbound filtering was popular. It may also (=
poorly) report that it was found on a different interface compared to where=
 it really occurred, or, it really was forwarded to the wrong interface, an=
d 'rp_filter 1' saved the situation.

Try setting up some explicit rules to kill martian packets, where they shou=
ld not exist. i.e. block 192.168.0.0/16 source out WAN, 192.168.0.0/16 dest=
ination from WAN (usually... -_-), etc.

sunny
