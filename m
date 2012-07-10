From: =?ISO-8859-1?Q?Humberto_Juc=E1?= <betolj@gmail.com>
Subject: Re: iptables and vlan tagging
Date: Tue, 10 Jul 2012 18:17:27 -0400
Message-ID: <CACuyg25P99E60ct-cHb3uzJVHiww7wm+sYmpJDXAMofmXUJ1-g@mail.gmail.com>
References: <1341903855.5850.20.camel@donetsk.home.lusan.id.au>
	<20120710101314.GB5772@tosh.sltosis.org>
	<1341920764.5850.36.camel@donetsk.home.lusan.id.au>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=c0Od4vqUv+CJShhvEPMVh8X4soZAr1BF7p28gVGlCro=;
        b=Y+nZn4O0GDfQZiw1hhbqxFdLr8krd5BLBV/tYOTuK1fn/zPSr5TrMo6N2PxOAFwMjE
         Zt7sZo2J3CmpIcLSqkQJxnKT539QcaU7XjlW0HBqR1PiZA57fRj3nan7X4vTxdxm7EDP
         7jwz9El3xQVUBHyrFS4eQFlEZQIXzpibWxIbxOq5YrTyIjp7O7QITq3GhumimzIc4ckh
         oR4AUd1fa+Po8RnT1PWzan4ywz1R8SIGZvWiki93XBUBFc/Fmv/PxMz3XY2A5pes2CKy
         ZnPx9Nq2hv9zCc22xLLaewOv4PmzkRs0GXUfOE5lsIdWdAWpHOp0WcfnIO6HaHIEb9g2
         dQ1Q==
In-Reply-To: <1341920764.5850.36.camel@donetsk.home.lusan.id.au>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nikolai Lusan <nikolai@lusan.id.au>
Cc: netfilter@vger.kernel.org

Hi,

The treatment of VLAN Tags is done in L2, you dont need worry about it
- that is solved with routing.
You only have to worry about configuring the VLAN interface on the
firewall and the switch port.

- If you make VLAN configuration on the firewall interface, configure
the Tag in switch port too.
- The switch configuration must be in accordance with firewall
configuration, so when you configure an interface with a VLAN tag and
other without (pvid 1, for example), the switch port must be "hybrid".
It's the setting that determines how the marking is done (tagging or
removing).

When the packet is forwarded, the interface VLAN configuration
determines whether should be tagged or not.


2012/7/10 Nikolai Lusan <nikolai@lusan.id.au>:
> On Tue, 2012-07-10 at 12:13 +0200, SamLT wrote:
>> On Tue, Jul 10, 2012 at 05:04:15PM +1000, Nikolai Lusan wrote:
>> > Hi,
>> > I have a 2 vlans, 1 untagged with private IP's (vlan1) and 1 tagged
>> > (vlan2) with non-private IP addresses, and I want to remove the vlan
>> > tags before sending vlan2 packets out over my internet link and add them
>> > back before sending packets from the internet to vlan2. Should this be
>> > done in the iptbales mangle table? or do I need to use ebtables? And
>> > exactly how should I go doing this?
>>
>> I'm not really sure to understand your question.
>
> My main concern is that I have packets that will end up in the forward
> chain and exit out my ADSL link onto the internet with their vlan
> tagging in place.
>
>
>> Viewing the commands
>> you used to set this up would certainly help.
>
> The config (on the server/firewall) is done in the
> Debian /etc/network/interfaces file:
>
> auto dsl-provider
> iface dsl-provider inet ppp
>    pre-up /sbin/ifconfig eth0 up
>    provider dsl-provider
>
> auto
> iface bond0 inet static
>    address 10.XXX.XXX.XXX
>    netmask 255.255.255.0
>    broadcast 10.XXX.XXX.255
>    bond-slaves eth1 eth2 eth3
>    bond-mode 4
>    bond-miimon 100
>    bond-lacp-rate 1
>    mtu 9000
>    bond-primary eth1 eth2 eth3
>
>
> auto vlan2
> iface vlan2 inet static
>    vlan-raw-device bond0
>    address 150.XXX.XXX.XXX
>    netmask 255.255.255.248
>    broadcast 150.XXX.XXX.XXX
>
>
> A similar method is used on the clients, so all the instances of the
> "vlan2" interface on machines are tagged vlans on the 150.XXX.XXX.XXX/29
> subnet.
>
>
>> anyway, assuming you configured this with iproute: eg:
>> ip link add link eth0 eth0.10 type vlan id 10
>> Then the tagging depends on your routing:
>>    * If it has to go out from eth0.10 -> tagging
>>    * If it has to go out from eth0 -> no tagging
>>
>
> The routing table looks like this on the firewall:
>
> # ip route list
> default dev ppp0  scope link
> 10.XX.XX.0/24 dev bond0  proto kernel  scope link  src 10.XX.XX.XX
> 150.XX.XX.XX dev ppp0 proto kernel scope link src 59.XX.XX.XX
> 150.XX.XX.XX/29 dev vlan2 proto kernel scope link src 150.XX.XX.XX
> 192.168.XX.0/24 dev eth0  proto kernel  scope link  src 192.168.XX.XX
>
>
> on the network hosts that need to be routed it looks like this
>
> # ip route list
> default via 10.XX.XX.XX dev eth0
> 10.XX.XX.0/24 dev eth0  proto kernel  scope link  src 10.XX.XX.XX
> 150.XX.XX.XX/29 dev vlan2 proto kernel scope link src 150.XX.XX.XX
>
>
> So, I guess the question is twofold:
> 1) Do I need to worry about tagged packets leaking onto the internet?
> 2) If so how do I use the netfilter toolset to stop this from happening?
>
> Thanks
> --
> Nikolai Lusan
>
> Email:     nikolai@lusan.id.au
> Phone(H):  (07) 3136 3065
> Phone(M):  0425 661 620
