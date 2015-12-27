From: "Neal P. Murphy" <neal.p.murphy@alum.wpi.edu>
Subject: Re: Problems with bridge+router setup
Date: Sun, 27 Dec 2015 14:21:18 -0500
Message-ID: <20151227142118.27861ea5@playground>
References: <b012b8f6ef5b98338b2ce4544df60a24@vpn.quintux.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Filter: OpenDKIM Filter v2.10.3 MAIL1.WPI.EDU tBRJLLWo014176
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=wpi.edu; s=_dkim;
	t=1451244081; i=@wpi.edu;
	bh=11rwAMjNg0UYLCN141U1lnMGoD64MG+PlMIe4nF9BWQ=;
	h=Date:From:To:Subject:In-Reply-To:References;
	b=qzay4kYGkWvKkk9i2TIBFub0v9mttirGKqItLnSG7/HzQsdnhWgmYkw1AHCtpXAwP
	 rbmCEEJqAvE6Fr7je/elpID/32F0Js928h6muMRUCXzW4U5WfMMsMwfB34dqJng+tR
	 0oB3+St4wnEm7VDOEzUolceGXrdEeaR09Tw/vArY=
In-Reply-To: <b012b8f6ef5b98338b2ce4544df60a24@vpn.quintux.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Sun, 27 Dec 2015 12:00:57 +0100
Kurt Haenen <Kurt.Haenen@quintux.com> wrote:

> Dear all,
> 
> I'm trying to setup a Raspberry Pi2 as a special kind of bridge+router, 
> but am getting stuck (basically way before the difficult stuff starts) 
> with just basic bridging already.  I've tried figuring this out on my 
> own and with searching through all stuff on the Internet, but still am 
> no step closer to understanding the cause of my problems (even though I 
> don't thing I'm an idiot), so this is basically a cry for help ...
> 
> 
> So, the basics of my setup:
> 
> Client <----> RPI2 <----> LAN
> 
> The RPI2 has an extra eth1 via USB to which the Windows-7 client is 
> connected, while the rest of the network is connected through eth0 of 
> the RPI2.  The LAN contains a server that hands out DHCP addresses.
> 
> The RPI2 is running the latest Raspbian Jessie (Linux raspberrypi 
> 4.1.13-v7+ #826 SMP PREEMPT Fri Nov 13 20:19:03 GMT 2015 armv7l 
> GNU/Linux).
> I created the bridge through the /etc/network/interfaces config file:
>      auto lo eth1 br0
>      iface lo inet loopback
>      iface eth0 inet manual
>      iface eth1 inet manual
>      iface br0 inet dhcp
>          bridge_fd 0
>          bridge_maxwait 0
>          bridge_stp off
>          bridge_ports eth0 eth1

I think you need STP (Spanning Tree Protocol); it's how devices on a LAN find out where bridges (switches) are and what's on the other side of them.

Also, remove eth1 from the 'auto' statement. Only br0 should be handled automatically.

You've largely done what I do for my home-brew KVM controller, except that I also add "post-up brctl setfd br0 0". It's been years since I set it up and I don't remember why I added it. (It may've been needed for an older version of Debian that didn't do bridges right: DHCP would often fail because it would come up long before the bridge would time out and start processing traffic.)

To debug, you might add a script that periodically pings something on the LAN. When the pings start to fail, bounce the link. It's rare, but not unheard of, for NICs to go to sleep.

> 
> The fd, maxwait and stp bridge settings were actually added after 
> checking the Internet for the problems I was hitting.  I've also tried 
> executing explicit brctl commands for the same, but that didn't change 
> anything ...  No ebtables or iptables rules applied yet, since I first 
> wanted to test basic bridging.
> 
> With this setup, when I attach my Windows-7 client to eth1 of the RPI 
> and ensure the client has a static IP in the same range as the LAN, then 
> everything seems to work fine.  I can ping hosts on the LAN from the 
> client and vice-versa, BUT ...
> 
> If I tell the client to use DHCP, then it (most of the time) doesn't 
> get an IP address.  I added a rule to just log events in the FORWARD 
> chain of ebtables' filter table, which (filtered on ports 67 and 68) 
> shows:
> 
> Dec 27 10:35:54 raspberrypi kernel: [73804.793870] LOG_FORWARD IN=eth1 
> OUT=eth0 MAC source = 00:26:2d:c6:df:50 MAC dest = ff:ff:ff:ff:ff:ff 
> proto = 0x0800 IP SRC=0.0.0.0 IP DST=255.255.255.255, IP tos=0x00, IP 
> proto=17 SPT=68 DPT=67
> Dec 27 10:35:54 raspberrypi kernel: [73804.794508] LOG_FORWARD IN=eth0 
> OUT=eth1 MAC source = 00:e0:4c:e8:42:30 MAC dest = ff:ff:ff:ff:ff:ff 
> proto = 0x0800 IP SRC=192.168.21.1 IP DST=255.255.255.255, IP tos=0x10, 
> IP proto=17 SPT=67 DPT=68
> Dec 27 10:35:54 raspberrypi kernel: [73804.799762] LOG_FORWARD IN=eth0 
> OUT=eth1 MAC source = 00:e0:4c:e8:42:30 MAC dest = ff:ff:ff:ff:ff:ff 
> proto = 0x0800 IP SRC=192.168.21.1 IP DST=255.255.255.255, IP tos=0x10, 
> IP proto=17 SPT=67 DPT=68
> Dec 27 10:35:54 raspberrypi kernel: [73804.801009] LOG_FORWARD IN=eth1 
> OUT=eth0 MAC source = 00:26:2d:c6:df:50 MAC dest = ff:ff:ff:ff:ff:ff 
> proto = 0x0800 IP SRC=0.0.0.0 IP DST=255.255.255.255, IP tos=0x00, IP 
> proto=17 SPT=68 DPT=67
> Dec 27 10:35:54 raspberrypi kernel: [73804.809660] LOG_FORWARD IN=eth0 
> OUT=eth1 MAC source = 00:e0:4c:e8:42:30 MAC dest = ff:ff:ff:ff:ff:ff 
> proto = 0x0800 IP SRC=192.168.21.1 IP DST=255.255.255.255, IP tos=0x10, 
> IP proto=17 SPT=67 DPT=68
> Dec 27 10:35:55 raspberrypi kernel: [73805.917988] LOG_FORWARD IN=eth1 
> OUT=eth0 MAC source = 00:26:2d:c6:df:50 MAC dest = ff:ff:ff:ff:ff:ff 
> proto = 0x0800 IP SRC=0.0.0.0 IP DST=255.255.255.255, IP tos=0x00, IP 
> proto=17 SPT=68 DPT=67
> Dec 27 10:35:55 raspberrypi kernel: [73805.924720] LOG_FORWARD IN=eth0 
> OUT=eth1 MAC source = 00:e0:4c:e8:42:3
> 0 MAC dest = ff:ff:ff:ff:ff:ff proto = 0x0800 IP SRC=192.168.21.1 IP 
> DST=255.255.255.255, IP tos=0x10, IP proto=17 SPT=67 DPT=68
> 
> So, I would conclude from this (correct me if I'm wrong) that the 
> server (192.168.21.1) is receiving the request for a DHCP address and 
> even responds back, but for some reason this response either never 
> reaches the Windows 7 machine or it refuses to use it.
> 
> Now, yesterday, for an extensive period, the problem was gone: I could 
> attach the client, get an IP, detach it, attach it again and get the 
> same IP again.  Then this morning, with nothing changed, not even the 
> power taken off from any of the involved devices (apart from the client 
> which was put to sleep while detached from the network), it came back to 
> not getting an IP at all ...
> 
> So, any clue, tips or whatever that could help me in figuring out the 
> root cause here?
> 
> Much thanks in advance and happy hollidays to all!
> 
> K.
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

