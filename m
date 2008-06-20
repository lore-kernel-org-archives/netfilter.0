From: Patrick McHardy <kaber@trash.net>
Subject: Re: conntrack and PREROUTING
Date: Fri, 20 Jun 2008 12:21:08 +0200
Message-ID: <485B8494.7050608@trash.net>
References: <869998.64693.qm@web52012.mail.re2.yahoo.com> <alpine.LNX.1.10.0806200942340.11250@fbirervta.pbzchgretzou.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.1.10.0806200942340.11250@fbirervta.pbzchgretzou.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: Doug Kehn <rdkehn@yahoo.com>, netfilter@vger.kernel.org

Jan Engelhardt wrote:
> On Friday 2008-06-20 01:57, Doug Kehn wrote:
> 
>> iptables -t raw -A PREROUTING -d ! 192.168.2.0/255.255.255.0 -i br0
>> -p tcp -m tcp --tcp-flags FIN,SYN,RST,ACK ACK -m tcp --dport 80 -m
>> conntrack --ctstate ESTABLISHED -j NOTRACK
>>
>> Does this even make sense?
> 
> Yes, but:

No. The raw table doesn't have conntrack information.
