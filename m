From: "Jorge Bastos" <mysql.jorge@decimal.pt>
Subject: Re: nf_nat_sip & nf_conntrack_sip
Date: Mon, 29 Jun 2009 09:22:08 +0100 (WEST)
Message-ID: <1892.192.168.1.3.1246263728.squirrel@webmail.decimal.pt>
References: <1982.192.168.1.3.1246005268.squirrel@webmail.decimal.pt>
    <4A44C5B2.9030408@trash.net>
    <2164.87.196.204.28.1246043247.squirrel@webmail.decimal.pt>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <2164.87.196.204.28.1246043247.squirrel@webmail.decimal.pt>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Patrick McHardy <kaber@trash.net>
Cc: netfilter@vger.kernel.org

> Hi Patrick,
> kernel 2.6.30
> Well, I'm going to test it with those parameters and let you know starting
> next Monday.
> One question, without the module everything works OK, the module are
> really necessary? If so for what?

ok,
tested and when the person from the other side disconnect's the sessions
remains alive with the module loaded with:

/sbin/modprobe nf_nat_sip
/sbin/modprobe nf_conntrack_sip sip_direct_signalling=0 sip_direct_media=0



