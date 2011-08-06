From: Marek Kierdelewicz <marek@piasta.pl>
Subject: Re: Enable connection from host in LAN to VPN server through
 iptables.
Date: Sat, 6 Aug 2011 17:44:48 +0200
Message-ID: <20110806174448.5e9c4248@catus>
References: <2080860960.316820.1312450017847.JavaMail.open-xchange@ox-app-1.superhost.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <2080860960.316820.1312450017847.JavaMail.open-xchange@ox-app-1.superhost.pl>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Piotr =?UTF-8?B?UGF3xYJvd3NraQ==?= <piotr.pawlowski@superhost.pl>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

>Dear all,

Hi,

From several days I am trying to enable connection from host in LAN to
>VPN server through router with iptables (Gentoo distro). Unfortunately
>I am unable to configure it correctly. Below is What I have in my
>iptables rules:

If you suspect iptables rulest, then try allowing all traffic in FORWARD
for the moment. You'll know if the ruleset is causing problems.

Best regards,
Marek Kierdelewicz
