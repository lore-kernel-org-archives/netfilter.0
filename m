From: Patrick McHardy <kaber@trash.net>
Subject: Re: nf_nat_sip & nf_conntrack_sip
Date: Sat, 11 Jul 2009 19:13:02 +0200
Message-ID: <4A58C81E.4010606@trash.net>
References: <1982.192.168.1.3.1246005268.squirrel@webmail.decimal.pt>    <4A44C5B2.9030408@trash.net>    <2164.87.196.204.28.1246043247.squirrel@webmail.decimal.pt>    <1892.192.168.1.3.1246263728.squirrel@webmail.decimal.pt>    <4A48B3F4.8000705@trash.net>    <2152.192.168.1.3.1246280022.squirrel@webmail.decimal.pt>    <4A48B97C.1060803@trash.net> <3238.192.168.1.3.1247247415.squirrel@webmail.decimal.pt>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <3238.192.168.1.3.1247247415.squirrel@webmail.decimal.pt>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jorge Bastos <mysql.jorge@decimal.pt>
Cc: netfilter@vger.kernel.org

Jorge Bastos wrote:
>>> Then i've been loading the nat modules in the wrong order, it should be
>>> always:
>>> 1- nf_conntrack_??? options
>>> 2- nf_nat_???
>> Yes.
>>
>>> correct?
>>> I've loaded the modules in this order with the parameters and it's
>>> working
>>> file now :)
>>>
>>> Explain something to me if possible, why is the SIP module need if
>>> everything works without it?
>> Well, in that case you don't need it obviously :) In case you're using
>> NAT, I guess you're also using STUN or something similar. This does not
>> really work reliable with netfilter, although it might appear that way
>> most of the time.
>>
> 
> Hi Patrick,
> continuing this matter, after updating to 2.6.31-rc2-git4 (i needed 'cause
> a fix for pty.c for PPTPD connections), loading the modules:
> 
> /sbin/modprobe nf_conntrack_sip sip_direct_signalling=0 sip_direct_media=0
> /sbin/modprobe nf_nat_sip
> 
> When the other person disconnects from the other side, the call remains
> active in my side.
> Unloading the modules works as expected.
> A bug?

What exactly do you mean with "remains active"? The expectations?
