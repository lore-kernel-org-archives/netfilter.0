From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: Disable port translation in SNAT
Date: Thu, 24 Jul 2014 20:43:03 +0200
Message-ID: <53D153B7.6000302@plouf.fr.eu.org>
References: <2F6A61C9-C112-4C17-9BE7-9B6438B19893@warp2biz.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <2F6A61C9-C112-4C17-9BE7-9B6438B19893@warp2biz.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: James Lamanna <james@warp2biz.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hello,

James Lamanna a =E9crit :
> Hi,
> Is there a way to disable port translation during SNAT so that traffi=
c
> originates from the same external port as it did internally?

When possible this is already the default when you don't specify a port
range nor --random. From the man page :

--to-source  ipaddr[-ipaddr][:port-port]
     which  can  specify a single new source IP address, an inclusive
     range of IP addresses, and optionally, a port  range  (which  is
     only  valid if the rule also specifies -p tcp or -p udp).	 If no
     port range is specified, then source ports  below	 512  will  be
     mapped  to  other	 ports	below  512: those between 512 and 1023
     inclusive will be mapped to ports below 1024,  and  other	 ports
     will  be mapped to 1024 or above. Where possible, no port alter-
     ation will occur.

Sometimes the source port must be translated in order to avoid a
conflict with an existing connection to the same destination which
already uses that source port.
