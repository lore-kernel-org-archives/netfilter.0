From: "Jorge Bastos" <mysql.jorge@decimal.pt>
Subject: Re: nf_nat_sip & nf_conntrack_sip
Date: Sat, 11 Jul 2009 22:03:10 +0100 (WEST)
Message-ID: <2026.87.196.17.191.1247346190.squirrel@webmail.decimal.pt>
References: <1982.192.168.1.3.1246005268.squirrel@webmail.decimal.pt>
    <4A44C5B2.9030408@trash.net>
    <2164.87.196.204.28.1246043247.squirrel@webmail.decimal.pt>
    <1892.192.168.1.3.1246263728.squirrel@webmail.decimal.pt>
    <4A48B3F4.8000705@trash.net>
    <2152.192.168.1.3.1246280022.squirrel@webmail.decimal.pt>
    <4A48B97C.1060803@trash.net>
    <3238.192.168.1.3.1247247415.squirrel@webmail.decimal.pt>
    <4A58C81E.4010606@trash.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4A58C81E.4010606@trash.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Patrick McHardy <kaber@trash.net>
Cc: netfilter@vger.kernel.org

>> Hi Patrick,
>> continuing this matter, after updating to 2.6.31-rc2-git4 (i needed
>> 'cause
>> a fix for pty.c for PPTPD connections), loading the modules:
>>
>> /sbin/modprobe nf_conntrack_sip sip_direct_signalling=0
>> sip_direct_media=0
>> /sbin/modprobe nf_nat_sip
>>
>> When the other person disconnects from the other side, the call remains
>> active in my side.
>> Unloading the modules works as expected.
>> A bug?
>
> What exactly do you mean with "remains active"? The expectations?
>

Let me see if i can explain myself.
When I'm on a call, and the person for the other side ends the call, the
sessions remains active.
Without loadling the modules, it works fine.

