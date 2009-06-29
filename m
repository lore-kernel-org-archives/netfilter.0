From: Patrick McHardy <kaber@trash.net>
Subject: Re: nf_nat_sip & nf_conntrack_sip
Date: Mon, 29 Jun 2009 14:30:44 +0200
Message-ID: <4A48B3F4.8000705@trash.net>
References: <1982.192.168.1.3.1246005268.squirrel@webmail.decimal.pt>    <4A44C5B2.9030408@trash.net>    <2164.87.196.204.28.1246043247.squirrel@webmail.decimal.pt> <1892.192.168.1.3.1246263728.squirrel@webmail.decimal.pt>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1892.192.168.1.3.1246263728.squirrel@webmail.decimal.pt>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jorge Bastos <mysql.jorge@decimal.pt>
Cc: netfilter@vger.kernel.org

Jorge Bastos wrote:
>> Hi Patrick,
>> kernel 2.6.30
>> Well, I'm going to test it with those parameters and let you know starting
>> next Monday.
>> One question, without the module everything works OK, the module are
>> really necessary? If so for what?
> 
> ok,
> tested and when the person from the other side disconnect's the sessions
> remains alive with the module loaded with:

What does "remain alive" mean? If something is not working as expected,
please include a pcap dump of both before and after NAT.

> 
> /sbin/modprobe nf_nat_sip
> /sbin/modprobe nf_conntrack_sip sip_direct_signalling=0 sip_direct_media=0

This does not work, the nat module already pulls in the conntrack module
without parameters.
