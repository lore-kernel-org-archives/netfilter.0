From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: ebtables & VLAN redirect
Date: Wed, 30 Jun 2010 16:21:40 -0500
Message-ID: <4C2BB564.3010208@riverviewtech.net>
References: <AANLkTilVkFmW0SL3t6ESUN72On5y52OvxYBUz2ZZdAWc@mail.gmail.com>	<4C262DA2.1040103@riverviewtech.net>	<AANLkTikWc-CNXMieyxv2lB69UphqQRsjjJATJYrpjkMK@mail.gmail.com>	<4C2805A3.4070801@riverviewtech.net>	<AANLkTikeVKxFv4jTp2vLTh80BOQW1nAQxmCc8M7EsPJ1@mail.gmail.com>	<4C2909D9.8010506@riverviewtech.net>	<AANLkTindtJ35xk2AgQxS_Fkac86s-n1riksh7D2oD34o@mail.gmail.com>	<4C2A49A3.1030600@riverviewtech.net>	<4C2A49F6.2060704@riverviewtech.net> <AANLkTinR6BX8jk6QRl3j-srd1_yprRQz30cKJjGNLtGd@mail.gmail.com> <4C2BB2A1.40406@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C2BB2A1.40406@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 06/30/10 16:09, Taylor, Grant wrote:
> That would be a show stopper.

... unless ...

> I'm going to give another reply for an even more strange idea (extension 
> of my earlier idea) that might get around your first point above.

I have messed with creating virtual networks in Linux for various 
different reasons.  One of the virtual networks that I was going to 
create (but the problem changed before I needed to do so) was to create 
a pair of devices connected to each other like a cross over cable using 
socat.

With this in mind, you could create a number of pairs of virtual devices 
and use them to connect the bridges together.

eth0.101 <-> br101 <-> ve101a   ve101b <-> br9
eth0.102 <-> br102 <-> ve102a   ve102b <-> br9
eth0.103 <-> br103 <-> ve103a   ve103b <-> br9 <-> eth1.9
...
eth0.199 <-> br199 <-> ve199a   ve199b <-> br9

Thus, there is no nesting and no device is in more than one bridge group.

So traffic coming in eth0.123 would be filtered by ebtables rules for 
br1234 before going in to ve123a.  Traffic would then pass through socat 
and come out ve123b and in to br9 and subsequently out eth1.9.

You might want to brief your self with how Xen does it's networking as 
it uses virtual point to point network pairs like what I'm calling 
ve<bla>a and ve<bla>b.



Grant. . . .
