From: "Jorge Bastos" <mysql.jorge@decimal.pt>
Subject: Re: nf_nat_sip & nf_conntrack_sip
Date: Mon, 29 Jun 2009 13:53:42 +0100 (WEST)
Message-ID: <2152.192.168.1.3.1246280022.squirrel@webmail.decimal.pt>
References: <1982.192.168.1.3.1246005268.squirrel@webmail.decimal.pt>
    <4A44C5B2.9030408@trash.net>
    <2164.87.196.204.28.1246043247.squirrel@webmail.decimal.pt>
    <1892.192.168.1.3.1246263728.squirrel@webmail.decimal.pt>
    <4A48B3F4.8000705@trash.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4A48B3F4.8000705@trash.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Patrick McHardy <kaber@trash.net>
Cc: Jorge Bastos <mysql.jorge@decimal.pt>, netfilter@vger.kernel.org

> What does "remain alive" mean? If something is not working as expected,
> please include a pcap dump of both before and after NAT.

I mean, when the person from the other side disconnects, the call doesn't
end.

>> /sbin/modprobe nf_nat_sip
>> /sbin/modprobe nf_conntrack_sip sip_direct_signalling=0
>> sip_direct_media=0
>
> This does not work, the nat module already pulls in the conntrack module
> without parameters.

ops!
Then i've been loading the nat modules in the wrong order, it should be
always:
1- nf_conntrack_??? options
2- nf_nat_???

correct?
I've loaded the modules in this order with the parameters and it's working
file now :)

Explain something to me if possible, why is the SIP module need if
everything works without it?

Jorge,


