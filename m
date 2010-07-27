From: Andrew Beverley <andy@andybev.com>
Subject: Re: making QoS for FTP traffic using tc HTB
Date: Tue, 27 Jul 2010 07:31:05 +0100
Message-ID: <1280212265.1462.65.camel@andybev>
References: <AANLkTiltEFL_FDC2Ah1RedeQTDHji94UbAGUyn39lT1e@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1280212277; bh=/DRlUHhoTrorstxzX2gH6S0IZROl/oHjgEXca
	OT5+n8=; h=Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:Message-ID:Mime-Version:Content-Transfer-Encoding; b=TatsqwTP
	HqKIbBV+dTWI25pT9FaIPoPQ1iP8nmxfSPv5s0BQs0AcwiCakND1fy37KePbFOeEYFx
	v3NzREd7kjTfeHFNqHbsrmliJonxUKc59DdL1NhOufOG24VW5PyIszlUMxTkzfJm9r8
	nek/KFs5vy4q/UlTe/4Xl3b5mGX34=
In-Reply-To: <AANLkTiltEFL_FDC2Ah1RedeQTDHji94UbAGUyn39lT1e@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mamadou =?ISO-8859-1?Q?Tour=E9?= <e2ia.ci@gmail.com>
Cc: netfilter@vger.kernel.org

> I've some problem with making Qos.
> All my pass through a linux box which is in Bridge mode.
> I'd to implement a QoS to allocate 25Kbit of bandwith to the FTP
> traffic. So I've made these commands:

<snip>

> tc filter add dev  eth1  protocol ip parent 1:  prio 1 u32   match ip  src
> 192.168.2.88/32  match ip dport  20  0xffff flowid  1:8170
> tc filter add dev  eth1  protocol ip parent 1:  prio 1 u32   match ip  dst
> 192.168.2.88/32    0xff match ip dport  21  0xffff flowid  1:8170
> --------------------------------------------------------------------
> The filter tc filter add dev  eth1.....
> Is never match for the FTP downstream.

FTP is quite a complex protocol that jumps around port numbers
(especially passive FTP - see http://slacksite.com/other/ftp.html). I've
not looked at your rules close enough to see whether that is the
problem, but I would recommend using the iptables FTP connection
tracking module with iptables to track the connection, then MARK it, and
then use the mark in the filter.

Andy


