From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: iptables rules for cups printer discovery
Date: Fri, 15 Aug 2008 10:16:42 -0500
Message-ID: <48A59DDA.7070404@riverviewtech.net>
References: <19894-78618@sneakemail.com> <48A4DD48.3080004@riverviewtech.net> <alpine.LNX.1.10.0808142150080.25617@fbirervta.pbzchgretzou.qr> <48A4E340.1090305@riverviewtech.net> <alpine.LNX.1.10.0808142202380.25617@fbirervta.pbzchgretzou.qr> <30978-20009@sneakemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <30978-20009@sneakemail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 08/15/08 08:10, Stephen Isard wrote:
> "-m recent --set" stores an address, just as an address, not marked as 
> source or dest.  This address is taken from either the source or 
> destination address of a packet, depending on the use of --rsrc/--rdest. 
> In order for the rules to do what we want them to, the address has to 
> include the port number as well as the ip address.
> 
> "-m recent --rcheck" looks to see whether the stored address is the same 
> as either the source or destination address on a packet, depending on 
> the use of --rsrc/--rdest.

The default is to use --rsource if neither --rsource or --rdest are 
specified.

> By the way, googling around for help on this issue, I came across a 
> forum thread from 2004 discussing the same problem with respect to 
> samba.  Evidently samba uses the same broadcast/response tactic. 
> Unfortunately the thread seemed to peter out without resolution.  But is 
> there an approved firewall setup for samba these days?  (I don't use 
> samba myself.)  If so, maybe we could adapt it.

There is now a connection tracking helper in the kernel specifically 
meant to help some NetBIOS traffic.



Grant. . . .
