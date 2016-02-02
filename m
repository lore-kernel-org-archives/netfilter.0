From: AllKind <AllKind@fastest.cc>
Subject: [announce] iptables-bash_completion 1.4 - Bash shell programmable
 completion for ip[6]tables
Date: Tue, 2 Feb 2016 09:24:15 +0100
Message-ID: <56B067AF.40700@fastest.cc>
Reply-To: AllKind@fastest.cc
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=fastest.cc; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:reply-to:subject:to:x-sasl-enc:x-sasl-enc; s=
	mesmtp; bh=Xs3ieMiT1HHZgtGzayab8Scw2cM=; b=M0S9QLIfujMi81dk6fzcX
	6xXKw/FiiovY4EiBuW+EFCnskp8tjx1sq2aA+KNasJu6so0fC/R78Q3tAenp3Sxx
	SW/LoTvEBbrEjbJjmF2x4CVltWvwQi7a9uXUeQuxsa+mLi+LvUYlopza0JZ7uuBH
	E7ZhFIQ0aik2RwhvDCqIwo=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=content-transfer-encoding:content-type
	:date:from:message-id:mime-version:reply-to:subject:to
	:x-sasl-enc:x-sasl-enc; s=smtpout; bh=Xs3ieMiT1HHZgtGzayab8Scw2c
	M=; b=F+drTcHcfMQIoaiyZ44t27xOEWqalsojxou7D/kun6rU++ejJAIqKhdeT1
	Rykbvt8DxzH4ukilP/WHJ/JigHrZzXdma8q0lobXGpMJ0R8KIQbq6vPwT3QzvfZ9
	xDtDMXXBu5s05n8niTRPe44wB3BJuXZ6prB6JJuiyR/D5nri0=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hello netfilter list,

I'm happy to announce a new release (1.4) of iptables-bash_completion.

----------------------------------------------------------------------

Update:

This release updates the completion to the features of iptables 1.6.
It also contains some fixes and improvements.

----------------------------------------------------------------------

Description:

iptables-bash_completion provides programmable completion for the
iptables and ip6tables programs from netfilter.org. Following the
logic of iptables, options are shown only if they are valid at the
current context. Additionally to the completion on options, matches
and targets, it supports dynamic retrieval of data from the system
i.e: chain-, set-names, interfaces, hostnames, etc. Environment
variables allow to fine grade completion options. IP and MAC
addresses can be feed by file.

Author: AllKind - AllKind@fastest.cc

Homepage:
http://sourceforge.net/projects/ipt-bashcompl
https://github.com/AllKind/iptables-bash_completion

Readme:
https://sourceforge.net/p/ipt-bashcompl/code/ci/master/tree/README.md
https://github.com/AllKind/iptables-bash_completion/blob/master/README.md

Changelog:
https://github.com/AllKind/iptables-bash_completion/commits/master
https://sourceforge.net/p/ipt-bashcompl/code/commit_browser

----------------------------------------------------------------------

You might want to take a look at my other netfilter related projects:

ipset-bash_completion (completion for ipset):
https://sourceforge.net/projects/ipset-bashcompl/

ipset_list (ipset set listing wrapper script):
https://sourceforge.net/projects/ipset-list/

IP-Array (IPv4 firewall & traffic shaping):
https://sourceforge.net/projects/ip-array/

----------------------------------------------------------------------

Good day!

AllKind

