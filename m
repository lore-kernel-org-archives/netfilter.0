From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Details on iif in ip rule
Date: Wed, 21 Dec 2011 03:20:31 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1112210318020.5980@frira.zrqbmnf.qr>
References: <9E4E4FA919634D48ADBF608395D283EE0721B63257@exc-aus-0001>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <9E4E4FA919634D48ADBF608395D283EE0721B63257@exc-aus-0001>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Aadith Koshy <ak699f@att.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Wednesday 2011-12-21 01:08, Aadith Koshy wrote:

>Hi Team,
>
>I am having some trouble understanding 'iif' on the ip rules. Let me 
>explain what I am trying out. I have 3 virtual interfaces on a single 
>interface.

No you are not having 3 interfaces. You are having exactly _one_ 
interface. You are being deluded by ifconfig - stop using net-tools.
Use iproute2. Then it all starts making sense.

>eth0       192.168.4.0/24
>eth0:1   192.168.5.0/24
>eth0:2   192.168.6.0/24
>eth0:3   192.168.7.0/24
>
>
>I have all the interfaces setup with dhcp servers and they are able to 
>hand out I have rules that direct traffic from each of the interfaces 
>except eth0:2 to a route table as follows [...]
