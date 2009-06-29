From: Patrick McHardy <kaber@trash.net>
Subject: Re: nf_nat_sip & nf_conntrack_sip
Date: Mon, 29 Jun 2009 14:54:20 +0200
Message-ID: <4A48B97C.1060803@trash.net>
References: <1982.192.168.1.3.1246005268.squirrel@webmail.decimal.pt>    <4A44C5B2.9030408@trash.net>    <2164.87.196.204.28.1246043247.squirrel@webmail.decimal.pt>    <1892.192.168.1.3.1246263728.squirrel@webmail.decimal.pt>    <4A48B3F4.8000705@trash.net> <2152.192.168.1.3.1246280022.squirrel@webmail.decimal.pt>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <2152.192.168.1.3.1246280022.squirrel@webmail.decimal.pt>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jorge Bastos <mysql.jorge@decimal.pt>
Cc: netfilter@vger.kernel.org

Jorge Bastos wrote:
>> What does "remain alive" mean? If something is not working as expected,
>> please include a pcap dump of both before and after NAT.
> 
> I mean, when the person from the other side disconnects, the call doesn't
> end.
> 
>>> /sbin/modprobe nf_nat_sip
>>> /sbin/modprobe nf_conntrack_sip sip_direct_signalling=0
>>> sip_direct_media=0
>> This does not work, the nat module already pulls in the conntrack module
>> without parameters.
> 
> ops!
> Then i've been loading the nat modules in the wrong order, it should be
> always:
> 1- nf_conntrack_??? options
> 2- nf_nat_???

Yes.

> correct?
> I've loaded the modules in this order with the parameters and it's working
> file now :)
> 
> Explain something to me if possible, why is the SIP module need if
> everything works without it?

Well, in that case you don't need it obviously :) In case you're using
NAT, I guess you're also using STUN or something similar. This does not
really work reliable with netfilter, although it might appear that way
most of the time.

