From: Alexei Ustyuzhaninov <alust@alust.homeunix.com>
Subject: Re: fwmark iptables/ip routing interaction question
Date: Sun, 11 May 2008 23:50:48 +0600
Message-ID: <482731F8.9030806@alust.homeunix.com>
References: <49159.212.190.198.36.1210171014.squirrel@webserver6.intec.ugent.be> <alpine.LNX.1.10.0805071703150.30395@fbirervta.pbzchgretzou.qr> <48271D8B.5030608@alust.homeunix.com> <alpine.LNX.1.10.0805111938210.19952@fbirervta.pbzchgretzou.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.1.10.0805111938210.19952@fbirervta.pbzchgretzou.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org

Jan Engelhardt wrote:
> On Sunday 2008-05-11 18:23, Alexei Ustyuzhaninov wrote:
>> Jan, could you explain please which code does this extra rerouting: iproute2 or
>> netfilter?
> 
> Netfilter of course.
> grep -r route_me_harder net/ipv4/netfilter/
> 
>> I have a weird with the same scenario: after rerouting a packet goes
>> out through another interface but keeps the source address of the original
>> interface.
> 
> Yes that is ... how the code is currently written it seems.

Well, maybe you can suggest how to work around this? :) I tried snat, 
but this solution seems not to work.

-- 
Alexei
