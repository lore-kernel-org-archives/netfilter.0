From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: conntrack and PREROUTING
Date: Fri, 20 Jun 2008 12:55:58 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0806201253500.11250@fbirervta.pbzchgretzou.qr>
References: <869998.64693.qm@web52012.mail.re2.yahoo.com> <alpine.LNX.1.10.0806200942340.11250@fbirervta.pbzchgretzou.qr> <485B8494.7050608@trash.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <485B8494.7050608@trash.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Patrick McHardy <kaber@trash.net>
Cc: Doug Kehn <rdkehn@yahoo.com>, netfilter@vger.kernel.org


On Friday 2008-06-20 12:21, Patrick McHardy wrote:

> Jan Engelhardt wrote:
>> On Friday 2008-06-20 01:57, Doug Kehn wrote:
>> 
>> > iptables -t raw -A PREROUTING -d ! 192.168.2.0/24 -i br0
>> > -p tcp -m tcp --tcp-flags FIN,SYN,RST,ACK ACK -m tcp --dport 80 -m
>> > conntrack --ctstate ESTABLISHED -j NOTRACK
>> >
>> > Does this even make sense?
>> 
>> Yes, but:
>
> No. The raw table doesn't have conntrack information.
>
Oops ;-)

But you can assume that any ACK belongs to an established connection,
hence omitting -m conntrack --ctstate ESTABLISHED would achieve the
same.

Of course there are scenarios, like probe ACKs sent by nmap that
do not belong to any, or a conntrack router B which got rebooted
(and hence lost the connections that are still active between two
hosts A and C), but that should be real corner cases.

