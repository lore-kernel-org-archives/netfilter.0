From: Patrick McHardy <kaber@trash.net>
Subject: Re: conntrack and PREROUTING
Date: Fri, 20 Jun 2008 15:26:30 +0200
Message-ID: <485BB006.9020104@trash.net>
References: <787076.65754.qm@web52011.mail.re2.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <787076.65754.qm@web52011.mail.re2.yahoo.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: rdkehn@yahoo.com
Cc: Jan Engelhardt <jengelh@medozas.de>, netfilter@vger.kernel.org

Doug Kehn wrote:
> Hi Patrick,
> 
> 
> --- On Fri, 6/20/08, Patrick McHardy wrote:
> 
>> Jan Engelhardt wrote:
>>> On Friday 2008-06-20 01:57, Doug Kehn wrote:
>>>
>>>> iptables -t raw -A PREROUTING -d !
>> 192.168.2.0/255.255.255.0 -i br0
>>>> -p tcp -m tcp --tcp-flags FIN,SYN,RST,ACK ACK -m
>> tcp --dport 80 -m
>>>> conntrack --ctstate ESTABLISHED -j NOTRACK
>>>>
>>>> Does this even make sense?
>>> Yes, but:
>> No. The raw table doesn't have conntrack information.
> 
> I assume the same holds for -m state as well?  If so, this would explain why the rules are never matched.

Correct.

> Is there a way to have ACKs bypass the proxy and not break connection tracking?
> 
> My theory is that when performing a streaming HTTP download (e.g. streaming video over HTTP) having the ACKs traverse the proxy introduces sufficient delay to degrade video playback.  I'm hoping to find a general solution.  Creating a NOTRACK rule for each site is possible but a little cumbersome.

I don't see how that could work, the proxy has two seperate
connections (client<->proxy and proxy<->server), so it
needs to receive all packets.
