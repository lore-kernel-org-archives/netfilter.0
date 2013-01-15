From: Jan Engelhardt <jengelh@inai.de>
Subject: Re: iptables deactivate "getportbyname"
Date: Tue, 15 Jan 2013 13:51:37 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1301151350060.19279@nerf07.vanv.qr>
References: <50F5483C.9050807@kraftcom.de>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <50F5483C.9050807@kraftcom.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Manuel Scheub <manuel.scheub@kraftcom.de>
Cc: netfilter@vger.kernel.org


On Tuesday 2013-01-15 13:14, Manuel Scheub wrote:
>
> after an upgrade of iptables from version 1.4.3.2 to 1.4.16.3, some rules
> doesn't work anymore.
> e.g. all rules with protocol UDP an port information:
>
> #iptables -A INPUT -p udp -i eth0 --dport 67 --sport 68 -j ACCEPT
> iptables v1.4.16.3: Port "67" does not resolve to anything.

Hrm. I cannot reproduce this so far, but I have a suspicion:
Do you have some libc other than glibc, perhaps?
