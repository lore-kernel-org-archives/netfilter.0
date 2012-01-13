From: "Lloyd Standish" <lloyd@crnatural.net>
Subject: Re: Dual WAN set-up
Date: Fri, 13 Jan 2012 08:17:20 -0600
Message-ID: <op.v700m6kzx1lyi3@debiandesk2.net>
References: <201201121651.18887.dyioulos@onpointfc.com>
 <op.v7zujutux1lyi3@debiandesk2.net> <1326439545.2182.17.camel@andrew-desktop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1326439545.2182.17.camel@andrew-desktop>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed	delsp=yes"
To: Andrew Beverley <andy@andybev.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Fri, 13 Jan 2012 01:25:45 -0600, Andrew Beverley <andy@andybev.com> wrote:

> Using marks is one way to do this, and provides plenty of flexibility.
> However, if all the traffic is coming from the same IP address /
> interface, then you should be able to use straight iproute2 rules to
> match those aspects, without even touching iptables (see ip rule).
>
>> 	iptables -t mangle -A PREROUTING -m state --state NEW
>> -s 10.x.x.x -j CONNMARK1
>>

That's a good point.  In my own firewall, at one point I wanted to avoid load-balancing for certain hosts (i.e., always route through a given interface for a certain source IP), and I was unable to use "ip rule" with no packet marking.  However, I think this is because all the hosts were internal LAN hosts using SNAT, and the NAT is done before the packet hits "ip rule."  Therefore "ip rule" could not match on the source IP.  But in Dimitri's case, since there is no NAT for the DMZ hosts, this should work fine, and is simpler.  The only reason to mark packets would be to allow the possibility of later routing some of the LAN hosts through the second interface.

>Also, if you do decide to use netfilter marks (which is certainly no bad
> thing IMHO), then you probably don't need to mark connections and then
> restore them. Instead just mark a packet straight away:
>iptables -t mangle -A PREROUTING -s 10.x.x.x -j MARK --set-mark 1

Another very good point for Dimitri, Andy, which should give better efficiency.  Connection marking is only necessary for load-balancing. I guess I am in a "load-balancing" mindset.

-- 
Lloyd
