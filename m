From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: Re: [ANNOUNCE] ipset-5.0 released
Date: Sun, 19 Dec 2010 17:04:52 +0000
Message-ID: <4D0E3B34.7090105@googlemail.com>
References: <alpine.DEB.2.00.1012172259100.10231@blackhole.kfki.hu> <4D0CC3BB.8030801@googlemail.com> <alpine.DEB.2.00.1012182050280.11577@blackhole.kfki.hu> <4D0D2CF4.5070201@googlemail.com> <alpine.DEB.2.00.1012190105460.11753@blackhole.kfki.hu> <4D0E0E2A.3090604@googlemail.com> <4D0E22A5.8090808@conversis.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:message-id
         :disposition-notification-to:date:from:user-agent:mime-version:to:cc
         :subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=YsPlrfSrOm7YNO55Of/15G48hFd7IZFZgVaRtCYdJb8=;
        b=NSmEX50PFUZedwYnw7yfkPDF//rzH/Jgdc49cZsSHJ9+SxoJerHBzgeRwGdTw3OdSx
         QTVoEtEhZh8U/vl/gAThVdveWA7RZwa3JgmIOc5xsWaEmwXbKuQqK5Zkv1UpeqcQ8YWs
         iLe7jcfbDxeqeNmv2482s4rIavLH9q3+Gno5E=
In-Reply-To: <4D0E22A5.8090808@conversis.de>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Dennis Jacobfeuerborn <dennisml@conversis.de>
Cc: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>, netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org


>>
>> Wouldn't you agree that this is a better solution than registering 
>> twice as
>> many members in a particular set in order to get the match I need?
>
> Given that ports are only meaningful in the context of a protocol I 
> don't think that makes sense.
You are mistaken! I've never actually stated, nor implied, that 
protocols are 'meaningless' when ports are specified or used - I stated 
that I am not interested in *matching* the protocol as for me this part 
of the match is irrelevant - there are plenty of examples where a 
particular service can employ either tcp or udp protocol on the same 
port - see below for examples.

> If I want to block traffic to "port 80" in order to prevent access to 
> a web server then what I'm rally saying is that I want top block 
> traffic to "tcp port 80". There is no point in blocking udp port 80 too.
True, but that is an isolated case when I want to block a traffic to 1) 
a particular well-known service (web/http), which uses 2) a well-defined 
port (80 in this case) and 3) a well-defined protocol (tcp in this case).

That, as I already mentioned is an isolated case and defining the 
protocol and port in the ipset makes perfect sense. I would like to be 
able to define a match which captures subnets and port numbers 
regardless of the protocol involved (udp or tcp) - I thought I made that 
perfectly clear.

> While there are some servers out there that use connections on the 
> same port on both udp and tcp (e.g. DNS) these are the exception and 
> should still be handled explicitly by defining rules for both 
> protocols separately.
I disagree! Why should I have to define 2x as many members in a 
particular set in order to cover tcp and udp protocols where, in 
reality, I have no interest whatsoever in matching the protocol element 
at all - all I need is a subnet match and a port number, the protocol 
part (whatever that is - udp or tcp) is completely irrelevant - I do not 
really care whether the protocol is tcp or udp.

> Why would you want to match a port for all protocols? Do you have a 
> specific example for that?
You already mentioned DNS, I'd add DHCP to that list as well as VPN, 
IPSec and Kerberos traffic, which could be either tcp or udp on the same 
port numbers. VOIP (including STUN, RTP and SIP) is another example - 
not only the port numbers vary wildly within (usually) pre-defined 
group, but could utilise tcp as well as the udp protocol on these ports. 
IRC and media streaming too, not to mention the (notoriously bad) 
Microsoft NetBIOS (ports 135, 137, 138 and 139), WINS or even LDAP. 
Various databases (MySQL, PostgreSQL and Oracle to name a few) also 
utilise both protocols on the same port numbers.

Using tcp as well as udp traffic on the same port numbers is not as 
uncommon as you might think, hence why I would like to have subnet and 
port matching regardless of what the protocol is.
