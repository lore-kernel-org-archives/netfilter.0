From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: iptables rules for cups printer discovery
Date: Thu, 14 Aug 2008 21:14:27 -0500
Message-ID: <48A4E683.80206@riverviewtech.net>
References: <19894-78618@sneakemail.com> <48A4DD48.3080004@riverviewtech.net> <alpine.LNX.1.10.0808142150080.25617@fbirervta.pbzchgretzou.qr> <48A4E340.1090305@riverviewtech.net> <alpine.LNX.1.10.0808142202380.25617@fbirervta.pbzchgretzou.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.1.10.0808142202380.25617@fbirervta.pbzchgretzou.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 8/14/2008 9:04 PM, Jan Engelhardt wrote:
> You can specify --rsrc/--rdest (patch just merged that documents 
> them).

So the options did exist, but they were undocumented?

> -A INPUT -d 192.168.0.255 -p udp --dport 161 -m recent --name snmp 
> --rsrc --set
> 
> -A OUTPUT -p udp --sport 161 -m recent --name snmp --rdest --rcheck

*nod*  That is the general idea.

So I take it that the default is --rsrc but you can specify --rdest and 
act on the destination IP for all options of recent, i.e. --update and 
--remove too?



Grant. . . .
