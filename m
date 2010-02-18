From: Marek Kierdelewicz <marek@piasta.pl>
Subject: Re: Transparent http filtering VLAN traffic without being a member
 of  tagged VLANs
Date: Thu, 18 Feb 2010 11:36:36 +0100
Message-ID: <20100218113636.6bddb735@catlap>
References: <c4ada2161002171216v202474a0obd2ca5c1f22511f1@mail.gmail.com>
	<20100217215518.2944595e@catlap>
	<c4ada2161002172323r477f2b23g3b5ed981275d11ca@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <c4ada2161002172323r477f2b23g3b5ed981275d11ca@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oguz Yilmaz <oguzyilmazlist@gmail.com>
Cc: netfilter@vger.kernel.org

Hello,

>This may be our problem. However ip route add returns
>"SIOCADDRT: No such device"
>while I see br0.26 in ifconfig output.

Strange. It should work. Tested on debian lenny:

rt1:/# brctl addbr br0
rt1:/# ip link set up dev br0
rt1:/# vconfig add br0 26
Added VLAN with VID == 26 to IF -:br0:-
rt1:/# ip link set up dev br0.26
rt1:/# ip ro add 10.100.0.0/30 dev br0.26
rt1:/# ip ro sh dev br0.26
10.100.0.0/30  scope link    <- route is there!

Post output of your "ip addr sh" and "ip ro show" and steps you take to
set things up.

>What about routing into not "dev br0.26" but to "dev br0"?

In case of routing on br0 and not br0.26 AFAIK bridge would be sending
replies untagged on native vlan. Maybe there are some ebtables hacks
I don't know about.

Best regards,
Marek Kierdelewicz
