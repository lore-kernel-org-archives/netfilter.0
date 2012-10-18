From: "U.Mutlu" <for-gmane@mutluit.com>
Subject: Re: How to block all packets not destined to local IP's ?
Date: Thu, 18 Oct 2012 05:36:45 +0200
Message-ID: <k5ntgc$t1g$1@ger.gmane.org>
References: <k5nm1g$brb$1@ger.gmane.org> <k5no3s$ot0$1@ger.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <k5no3s$ot0$1@ger.gmane.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

U.Mutlu wrote, On 10/18/2012 04:04 AM:
> I solved the problem in 2 steps, in that order:
>    drop all packets to unwanted dest ip's
>    drop all packets from unwanted cc's
>
> If the IP's are consecutive then one can use a the range option of iptables, like this:
>    iptables -A INPUT -m iprange --dst-range x.x.x.210-x.x.x.219 -j DROP
>
> Ie.:
>    iptables -A INPUT -m iprange --dst-range x.x.x.210-x.x.x.219 -j DROP
>    ...
>    iptables -A INPUT -m geoip --src-cc CN -j DROP
>    ...

Correction: since all packets to non-local IP's go thru the FORWARD chain
the above example must be changed to:
      iptables -A FORWARD -m iprange --dst-range x.x.x.210-x.x.x.219 -j DROP


> U.Mutlu wrote, On 10/18/2012 03:29 AM:
>> Subtitle: [xtables geoip] rules not applied to packets for non-configured IP's
>>
>> Hi,
>> from the router link (just 1 link) I'm getting traffic for multiple IP's
>> (a quasi multihomed system, actually a host node and multiple virtual systems therein),
>> that's correct so, but is there a way to drop all packets to IP's
>> that are actually not configured on the local system?
>> Is there a better way than writing a drop/reject-rule for each such IP?
>>
>> And related to this, I think there is a bug in xtables geoip
>> because if there is a packet for such a not-configured IP
>> then the iptables rules (at least geoip rules) aren't applied to such packets.
>> How to fix this?

...because they go thru the FORWARD chain, not the INPUT chain!... :-)

Problem solved.


