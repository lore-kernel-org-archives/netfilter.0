From: Andrew Beverley <andy@andybev.com>
Subject: Re: limit badwidth not working
Date: Sat, 01 Jan 2011 16:08:05 +0000
Message-ID: <1293898085.1601.29.camel@andybev>
References: <BAY145-ds40063ED1096C32DC63795F3710@phx.gbl>
	 <BAY145-ds9975844F1691A3B9C49EAF3010@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1293899038; bh=pSjLGKJYx8iYNIelAAqMuHZYooQ0Bu1TJZ6Vo
	urLytg=; h=Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:Message-ID:Mime-Version:Content-Transfer-Encoding; b=YWb/VBnQ
	sG7FdZYh7LbGNbWqZZokT8YdYZe2lCc3gnpbsbWJj7Vt/5J9TS7arFFamm6Pq+HL78f
	F77GD4v1lxuGlf0Ao9fqWj+AYptQQMyWNNIGP/nLvg6QT1wt+hqX/jMky2roMmWlPGw
	ttL4UqsUFC1DcapkfXxNxDFEV3cCE=
In-Reply-To: <BAY145-ds9975844F1691A3B9C49EAF3010@phx.gbl>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: J Webster <webster_jack@hotmail.com>
Cc: netfilter@vger.kernel.org

On Tue, 2010-12-28 at 12:12 +0100, J Webster wrote:
> I have a setup where uisers connect by VPN and are given IP addresses in the 
> range 10.8.0.xxx

I can't advise on the VPN aspects of this, but see below for some
general comments.

> I would like to limit their bandwidth to 1.5Mbps per IP address. However, I 
> don't want to limit the incoming connection.
> For example, they access the VPN server by it's WAN IP 200.xx.xx.xx and are 
> given a local IP of 10.0.8.x
> User 1 goes to www.youtube.com and starts streaming videos, this should be 
> limited to 1.5Mbps.
> User 2 goes to www.youtube.com and starts downloading a video, this should 
> also be limited to 1.5Mbps but the
> server connection to youtube should have unlimited bandwidth to allow for 
> multiple users, in this sinstance at least 3Mbps.

Please clarify - you state that you don't want to limit the incoming
connection, but then state that you want to limit the download limit per
IP address to 1.5Mbps. Do you mean that you don't want to limit the
overall inbound connection but want to limit per destination IP address?

> I tried the tc example below but am not sure whether I should apply the 
> filter to the tun0 network 10.0.8x or to the entire iptables connections.

Not sure I'm afraid.

<snip>

> 
> # The network interface we're planning on limiting bandwidth.
> IF=eth0             # Interface

Is eth0 your internet side interface or your local network side?

> # IP address of the machine we are controlling
> IP=216.3.128.12     # Host IP
> 
> # Filter options for limiting the intended interface.
> U32="$TC filter add dev $IF protocol ip parent 1:0 prio 1 u32"
> 

>     $TC qdisc add dev $IF root handle 1: htb default 30
>     $TC class add dev $IF parent 1: classid 1:1 htb rate $DNLD
>     $TC class add dev $IF parent 1: classid 1:2 htb rate $UPLD
>     $U32 match ip dst $IP/32 flowid 1:1
>     $U32 match ip src $IP/32 flowid 1:2

I *think* that you'll need a separate leaf class for each client on your
network. I think you'll also need an overall rate limit for the root
(which is kind of what you've already got above). If you want to avoid
rate limiting the overall interface, then don't set a default and only
filter by destination IP address.

I'm a bit confused about what you want to control (see comment above),
as you have references to upload and download limits. If you only want
to limit the download stream, then you can't do this by ingress on the
source interface. You'll have to either do it as egress on the outbound
interface, or use an IFB interface. That said, I don't know how a VPN
affects this and whether that makes a difference.

So, in summary:

- Use a root qdisc with an overall limit on the correct interface
- Add a leaf class for each client
- Filter into each leaf class based on IP address

Andy


