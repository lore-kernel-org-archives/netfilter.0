From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Help with multiple IP networks over an ethernet one
Date: Wed, 10 Sep 2008 18:13:07 -0500
Message-ID: <48C85483.2080308@riverviewtech.net>
References: <ef6cbd7b0cc8d867f0702b0494896b60.squirrel@www.arcoscom.com>    <48C6EF5B.3030005@riverviewtech.net>    <99a0783d528d1709644f5e55f406f469.squirrel@www.arcoscom.com>    <48C7D68C.2070902@riverviewtech.net>    <a101ab37cddb703b5cb3cc863b96b846.squirrel@www.arcoscom.com>    <48C82F38.3070400@riverviewtech.net> <7ffdca96fd513b795e9a5996f03c72bd.squirrel@www.arcoscom.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <7ffdca96fd513b795e9a5996f03c72bd.squirrel@www.arcoscom.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 9/10/2008 5:48 PM, ArcosCom Linux User wrote:
> Appears that, between e-mail and e-mail, I have a workaround changing 
> arp parameters to the interfaces.

Good.  :)

> Many thanks!!

You are welcome.

> Uhmm ... VLANs ... sound fine!!
> 
> Do you know any URL to begin with VLANs?

Um, no, I can't say as I do know of a URL / web page to start reading. 
Fell free to reply and ask questions either to the mailing list, or if 
we get too far off topic (Net Filter) email me directly and I'll try to 
help.

In short, VLAN (802.1q) , or Virtual Local Area Network, is a way to 
take an ethernet frame and use some of the previously unused bits in the 
ethernet frame header to indicate which virtual LAN that the given frame 
belongs to.  If memory serves correctly the VLAN number space can hold 
4096 unique VLANs.  VLAN tagging / trunking is the method to pass 
ethernet frames between switches and / or computers so that one can tell 
the other what VLAN the frame belongs to on a single connection.  This 
means that you can have one connection to a router with a separate VLAN 
for each department, floor, building, what ever.

Most server / router grade operating systems / equipment do (and have 
for a long time) support VLANs.  Thus you can have a Linux router with 
multiple VLAN interfaces that correspond to a given VLAN in a network. 
With what I was suggesting previously, you could create a separate VLAN 
for all your uplinks as well as your three LANs.  This would reduce the 
amount of (broadcast) traffic in each LAN as well as providing long 
reach ethernet ports in routers.  If you put all your uplinks and LANs 
in their own VLAN and trunked between switches and your router you could 
freely move your router / server(s) any where so long as they can trunk 
in to a switch and access the VLAN.



Grant. . . .
