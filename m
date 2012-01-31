From: Andrew Beverley <andy@andybev.com>
Subject: Re: Extended IPTables options
Date: Tue, 31 Jan 2012 17:23:25 +0000
Message-ID: <1328030605.2018.6.camel@andy-laptop>
References: <E7E899956E6065488DBC6623F76F36A2650ADB4520@RAMNL-EX02.Ram.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <E7E899956E6065488DBC6623F76F36A2650ADB4520@RAMNL-EX02.Ram.nl>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1328031586;
	bh=kFYgjJ2/djzGv8u6fzrhC7TEvBAO+Q9O/Cf6pA4e1n0=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:Mime-Version:Content-Transfer-Encoding;
	b=pXPKZ76lgo0CgPFN1b5RyTrIsba2vwiQIDL9nwOcEWsBaJ6SjiA8sR/U+kbUt0PuA
	 cwT4UACHVExBWBeCvC3e+o+IsFB+Rsh+k9p/kBKMsb+7smOFHYmJCEKvhaEs8OVbqW
	 CV+wLhTciXqjuZieBDMGwEwgn+O8yx9jZV45zkYA=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Arnoud Tijssen <ATijssen@Ram.nl>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Mon, 2012-01-30 at 08:40 +0100, Arnoud Tijssen wrote:
> I`m looking for the more sophisticated options of iptables/netfilter
> like: connmark, quota, qos, recent, netmap, tos, ulog, clustering and
> failover etc etc.

Have you tried the iptables man page? Personally I think that's pretty
well written and a good place to start. If you've got any specific
questions then feel free to post to this list.

> Is it possible to create a modular setup with iptables that offers the
> possibility to reload a specific part of the iptables rulebase instead
> of the entire rulebase.

You can add and remove rules "on the fly". There's no need to reload the
whole ruleset. Use "iptables -L  --line-numbers" to see all your rules
with associated rule number, and then use the "-D" command with that
number to delete as required.

Andy


